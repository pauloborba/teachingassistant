export class Matricula{
    aluno: Aluno
    avaliacao: Avaliacoes[] = []
    autoAvaliacao: AutoAvaliacoes[] = []
    monitor: Monitor
    respostaDeRoteiro: respostasDeRoteiros[] = []
    
    getAluno(): Aluno;
    getAvaliacao(): Avaliacao;
    getAutoAvaliacoes(): AutoAvaliacao;
    getMonitor(): Monitor;
    getRoteiros(): Roteiros;
}