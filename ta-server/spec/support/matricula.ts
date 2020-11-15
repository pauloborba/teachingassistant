export class Matricula{
    aluno: Aluno
    avaliacoes: Avaliacao[] = []
    autoAvaliacoes: Avaliacao[] = []
    monitor: Monitor 
    respostasDeRoteiros: RespostaDeRoteiro[] = []
    
    getAluno(): Aluno;
    getAvaliacoes(): Avaliacao[];
    getAutoAvaliacoes(): Avaliacao[];
    getMonitor(): Monitor;
    getRespostasDeRoteiros(): RespostaDeRoteiro[];
}