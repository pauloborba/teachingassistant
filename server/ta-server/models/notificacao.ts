export type TipoDestinatario = 'monitor' | 'aluno';
export type StatusNotificacao = 'pendente' | 'enviado';

export interface Notificacao {
  id: string;
  tipo: TipoDestinatario;
  mensagem: string;
  destinatarioId: string;
  status: StatusNotificacao;
  turmaId: string;
}
