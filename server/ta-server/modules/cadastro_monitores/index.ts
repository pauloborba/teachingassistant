import { store } from '../../data/store';
import { Monitor } from '../../models';
import { assertProfessorOwnership, getTurmaById, registrarLog } from '../helpers';

export interface NovoMonitorDTO {
  nome: string;
  matricula: string;
  senha?: string;
}

export class CadastroMonitoresModule {
  listar(turmaId: string): Monitor[] {
    return store.monitores.filter(m => m.turmaId === turmaId);
  }

  cadastrar(turmaId: string, professorId: string, dados: NovoMonitorDTO): Monitor {
    if (!turmaId) {
      throw new Error('Selecione uma turma antes de cadastrar.');
    }
    assertProfessorOwnership(turmaId, professorId);
    if (!dados.nome || !dados.matricula) {
      throw new Error('Nome e matrícula são obrigatórios.');
    }
    const duplicado = store.monitores.find(m => m.matricula === dados.matricula);
    if (duplicado) {
      throw new Error('Monitor já cadastrado.');
    }
    const monitor: Monitor = {
      id: `monitor-${store.monitores.length + 1}`,
      nome: dados.nome,
      matricula: dados.matricula,
      turmaId,
      alunosAlocados: [],
      senha: dados.senha || 'monitor'
    };
    store.monitores.push(monitor);
    const turma = getTurmaById(turmaId);
    if (turma) {
      turma.monitores.push(monitor.id);
    }
    registrarLog(`Monitor ${monitor.nome} cadastrado.`, professorId, turmaId);
    return monitor;
  }
}
