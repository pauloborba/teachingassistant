import { aplicarAtribuicoes } from '../alocacao/manual_allocation';
import { AllocationSnapshot } from '../../data/store';
import { assertProfessorOwnership, registrarLog } from '../helpers';
import { NotificacaoModule } from '../notificacoes';

const notificacoesModule = new NotificacaoModule();

export function aplicarCorrecaoManual(turmaId: string, professorId: string, atribuicoes: AllocationSnapshot[]) {
  assertProfessorOwnership(turmaId, professorId);
  aplicarAtribuicoes(turmaId, atribuicoes, 'Nenhum aluno pode ficar sem monitor.');
  registrarLog('Correção manual aplicada.', professorId, turmaId);
  notificacoesModule.enfileirarResumo(turmaId, 'Correção manual salva.');
  return { mensagem: 'Alocação corrigida com sucesso.' };
}
