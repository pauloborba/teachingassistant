import { Component, Input, OnInit } from '@angular/core';
import { ApiService } from './api.service';
import { Professor, Turma, Aluno, Monitor, Revalidacao, LogEntry } from './models';

type PopupType = 'cadastro' | 'alocacao' | 'realocacao' | 'notificacoes' | null;
type ManualViewMode = 'allocation' | 'correction' | null;

@Component({
  selector: 'app-professor-dashboard',
  templateUrl: './professor-dashboard.component.html',
  styleUrls: ['./professor-dashboard.component.css']
})
export class ProfessorDashboardComponent implements OnInit {
  @Input() professor: Professor;

  turmas: Turma[] = [];
  selectedTurmaId = '';
  alunos: Aluno[] = [];
  alunosFiltrados: Aluno[] = [];
  monitores: Monitor[] = [];
  filtroNome = '';
  filtroStatus: 'todos' | 'alocado' | 'nao_alocado' = 'todos';
  mensagens: { tipo: 'success' | 'error'; texto: string }[] = [];

  popupAtivo: PopupType = null;
  manualView: ManualViewMode = null;

  cadastroMonitor = { nome: '', matricula: '' };
  tipoAlocacao: 'aleatoria' | 'manual' | '' = '';
  realocacaoForm = { limiteMaximo: '' };
  revalidacao?: Revalidacao;
  notificacaoResumo: string[] = [];
  logs: LogEntry[] = [];

  manualAssignments: { [monitorId: string]: Aluno[] } = {};
  manualSemMonitor: Aluno[] = [];

  constructor(private api: ApiService) {}

  ngOnInit(): void {
    this.carregarTurmas();
    this.carregarLogs();
  }

  get turmaSelecionada(): Turma | undefined {
    return this.turmas.find(t => t.id === this.selectedTurmaId);
  }

  carregarTurmas(): void {
    if (!this.professor) {
      return;
    }
    this.api
      .getTurmas(this.professor.id)
      .then(turmas => {
        this.turmas = turmas;
        if (!this.selectedTurmaId && turmas.length > 0) {
          this.selecionarTurma(turmas[0].id);
        }
      })
      .catch(erro => this.registrarMensagem('error', erro));
  }

  selecionarTurma(turmaId: string): void {
    this.selectedTurmaId = turmaId;
    if (turmaId) {
      this.carregarAlunos();
      this.carregarMonitores();
      this.revalidacao = undefined;
    }
  }

  carregarAlunos(): void {
    this.api
      .getAlunos(this.selectedTurmaId)
      .then(alunos => {
        this.alunos = alunos;
        this.aplicarFiltros();
      })
      .catch(erro => this.registrarMensagem('error', erro));
  }

  carregarMonitores(): void {
    this.api
      .getMonitores(this.selectedTurmaId)
      .then(monitores => (this.monitores = monitores))
      .catch(erro => this.registrarMensagem('error', erro));
  }

  aplicarFiltros(): void {
    let resultado = this.alunos.slice();
    if (this.filtroNome) {
      resultado = resultado.filter(aluno => aluno.nome.toLowerCase().includes(this.filtroNome.toLowerCase()));
    }
    if (this.filtroStatus === 'alocado') {
      resultado = resultado.filter(aluno => !!aluno.monitorId);
    }
    if (this.filtroStatus === 'nao_alocado') {
      resultado = resultado.filter(aluno => !aluno.monitorId);
    }
    this.alunosFiltrados = resultado;
  }

  abrirPopup(tipo: PopupType): void {
    if (!this.selectedTurmaId) {
      this.registrarMensagem('error', 'Selecione uma turma para continuar.');
      return;
    }
    this.popupAtivo = tipo;
    if (tipo === 'notificacoes') {
      this.carregarResumoNotificacoes();
    }
  }

  fecharPopup(): void {
    this.popupAtivo = null;
    this.tipoAlocacao = '';
  }

  registrarNovoMonitor(): void {
    if (!this.cadastroMonitor.nome || !this.cadastroMonitor.matricula) {
      this.registrarMensagem('error', 'Preencha todos os campos de monitor.');
      return;
    }
    this.api
      .cadastrarMonitor(this.selectedTurmaId, this.professor.id, this.cadastroMonitor)
      .then(() => {
        this.registrarMensagem('success', 'Monitor cadastrado com sucesso.');
        this.cadastroMonitor = { nome: '', matricula: '' };
        this.carregarMonitores();
      })
      .catch(erro => this.registrarMensagem('error', erro));
  }

  executarAlocacao(): void {
    if (this.tipoAlocacao === 'aleatoria') {
      this.api
        .alocarAleatorio(this.selectedTurmaId, this.professor.id)
        .then(() => {
          this.registrarMensagem('success', 'Alocação realizada com sucesso.');
          this.fecharPopup();
          this.atualizarListas();
        })
        .catch(erro => this.registrarMensagem('error', erro));
      return;
    }
    if (this.tipoAlocacao === 'manual') {
      this.fecharPopup();
      this.abrirTelaManual('allocation');
      return;
    }
    this.registrarMensagem('error', 'Selecione o tipo de alocação.');
  }

  abrirTelaManual(modo: ManualViewMode): void {
    if (this.monitores.length === 0) {
      this.registrarMensagem('error', 'Cadastre monitores antes de utilizar a alocação manual.');
      return;
    }
    this.manualView = modo;
    this.manualAssignments = {};
    this.monitores.forEach(m => (this.manualAssignments[m.id] = []));
    if (modo === 'correction') {
      this.manualSemMonitor = [];
      this.alunos.forEach(aluno => {
        if (aluno.monitorId && this.manualAssignments[aluno.monitorId]) {
          this.manualAssignments[aluno.monitorId].push(aluno);
        } else {
          this.manualSemMonitor.push(aluno);
        }
      });
    } else {
      this.manualSemMonitor = this.alunos.slice();
    }
  }

  arrastarAluno(evento: DragEvent, alunoId: string): void {
    if (evento.dataTransfer) {
      evento.dataTransfer.setData('text/plain', alunoId);
    }
  }

  permitirSoltar(evento: DragEvent): void {
    evento.preventDefault();
  }

  soltarAluno(evento: DragEvent, destino: string): void {
    evento.preventDefault();
    const alunoId = evento.dataTransfer ? evento.dataTransfer.getData('text/plain') : '';
    if (alunoId) {
      this.moverAluno(alunoId, destino);
    }
  }

  moverAluno(alunoId: string, destino: string): void {
    const aluno = this.alunos.find(a => a.id === alunoId);
    if (!aluno) {
      return;
    }
    Object.keys(this.manualAssignments).forEach(monitorId => {
      this.manualAssignments[monitorId] = this.manualAssignments[monitorId].filter(a => a.id !== alunoId);
    });
    this.manualSemMonitor = this.manualSemMonitor.filter(a => a.id !== alunoId);
    if (destino === 'sem-monitor') {
      this.manualSemMonitor.push(aluno);
    } else if (this.manualAssignments[destino]) {
      this.manualAssignments[destino].push(aluno);
    }
  }

  salvarDistribuicaoManual(): void {
    const monitorSemAlunos = Object.keys(this.manualAssignments).filter(
      monitorId => this.manualAssignments[monitorId].length === 0
    );
    if (this.manualSemMonitor.length > 0) {
      this.registrarMensagem('error', 'Há alunos sem monitor.');
      return;
    }
    if (monitorSemAlunos.length > 0) {
      this.registrarMensagem('error', 'Todos os monitores devem possuir alunos.');
      return;
    }
    const atribuicoes = Object.keys(this.manualAssignments).map(monitorId => ({
      monitorId,
      alunoIds: this.manualAssignments[monitorId].map(aluno => aluno.id)
    }));
    const acao = this.manualView === 'allocation'
      ? this.api.alocarManual(this.selectedTurmaId, this.professor.id, atribuicoes)
      : this.api.salvarCorrecao(this.selectedTurmaId, this.professor.id, atribuicoes);
    acao
      .then(() => {
        this.registrarMensagem('success', 'Distribuição salva com sucesso.');
        this.manualView = null;
        this.atualizarListas();
      })
      .catch(erro => this.registrarMensagem('error', erro));
  }

  cancelarManual(): void {
    this.manualView = null;
  }

  executarRealocacao(): void {
    const limite = Number(this.realocacaoForm.limiteMaximo);
    this.api
      .realocar(this.selectedTurmaId, this.professor.id, limite)
      .then(() => {
        this.registrarMensagem('success', 'Realocação concluída com sucesso.');
        this.fecharPopup();
        this.atualizarListas();
      })
      .catch(erro => this.registrarMensagem('error', erro));
  }

  enviarNotificacoes(): void {
    this.api
      .enviarNotificacoes(this.selectedTurmaId, this.professor.id)
      .then(resumo => {
        this.notificacaoResumo = resumo.map(item => item.mensagem);
        this.registrarMensagem('success', 'Notificações enviadas com sucesso.');
      })
      .catch(erro => this.registrarMensagem('error', erro));
  }

  revalidar(): void {
    this.api
      .revalidar(this.selectedTurmaId)
      .then(resultado => {
        this.revalidacao = resultado;
        const texto = resultado.valido ? 'Alocações válidas.' : resultado.erros.join(' ');
        this.registrarMensagem(resultado.valido ? 'success' : 'error', texto);
      })
      .catch(erro => this.registrarMensagem('error', erro));
  }

  carregarResumoNotificacoes(): void {
    if (!this.selectedTurmaId) {
      return;
    }
    this.api
      .revalidar(this.selectedTurmaId)
      .then(resumo => {
        this.notificacaoResumo = [
          `Alunos: ${resumo.resumo.totalAlunos}`,
          `Monitores: ${resumo.resumo.totalMonitores}`
        ];
      })
      .catch(() => (this.notificacaoResumo = []));
  }

  atualizarListas(): void {
    this.carregarAlunos();
    this.carregarMonitores();
    this.carregarLogs();
  }

  registrarMensagem(tipo: 'success' | 'error', texto: string): void {
    this.mensagens.push({ tipo, texto });
    setTimeout(() => {
      this.mensagens = this.mensagens.filter(m => m.texto !== texto);
    }, 5000);
  }

  carregarLogs(): void {
    if (!this.professor) {
      this.logs = [];
      return;
    }
    this.api
      .getLogs()
      .then(logs => (this.logs = logs.slice(0, 5)))
      .catch(() => (this.logs = []));
  }

  nomeDoMonitor(monitorId: string | null): string {
    const monitor = this.monitores.find(m => m.id === monitorId);
    return monitor ? monitor.nome : 'Não alocado';
  }
}
