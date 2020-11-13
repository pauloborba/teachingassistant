export class Matricula{
    aluno: Aluno
    avaliacao: Avaliacao[] = []
    autoAvaliacao: AutoAvaliacao[] = []
    monitor: Monitor
    respostaDeRoteiro: respostaDeRoteiro[] = []
    
    getAluno(): Aluno;
    getAvaliacao(): Avaliacao;
    getAutoAvaliacoes(): AutoAvaliacao;
    getMonitor(): Monitor;
    getRoteiros(): Roteiros;
}