import { store } from '../../data/store';
import { getAlunosByTurma, getMonitoresByTurma, registrarLog, assertProfessorOwnership } from '../helpers';
import { Notificacao } from '../../models';

export class NotificacaoModule {
  enviarResumoFinal(turmaId: string, professorId: string) {
    assertProfessorOwnership(turmaId, professorId);
    const notificacoes = this.criarNotificacoes(turmaId, 'Alocação finalizada. Confira seu monitor/alunos.');
    registrarLog('Notificações enviadas.', professorId, turmaId);
    return notificacoes;
  }

  enfileirarResumo(turmaId: string, mensagem: string) {
    this.criarNotificacoes(turmaId, mensagem);
  }

  private criarNotificacoes(turmaId: string, mensagem: string): Notificacao[] {
    const base = new Date().getTime();
    const alunos = getAlunosByTurma(turmaId);
    const monitores = getMonitoresByTurma(turmaId);
    const notificacoes: Notificacao[] = [];
    alunos.forEach((aluno, index) => {
      notificacoes.push({
        id: `notificacao-aluno-${base + index}`,
        tipo: 'aluno',
        mensagem: `${mensagem} Monitor: ${this.obterNomeMonitor(aluno.monitorId) || 'Não alocado'}.`,
        destinatarioId: aluno.id,
        status: 'enviado',
        turmaId
      });
    });
    monitores.forEach((monitor, index) => {
      notificacoes.push({
        id: `notificacao-monitor-${base + index}`,
        tipo: 'monitor',
        mensagem: `${mensagem} Total de alunos: ${monitor.alunosAlocados.length}.`,
        destinatarioId: monitor.id,
        status: 'enviado',
        turmaId
      });
    });
    store.notificacoes.push(...notificacoes);
    return notificacoes;
  }

  private obterNomeMonitor(monitorId: string | null): string | null {
    const monitor = store.monitores.find(m => m.id === monitorId);
    return monitor ? monitor.nome : null;
  }
}
