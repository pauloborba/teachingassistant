export class Matricula{
    aluno: Aluno
    avaliacoes: Avaliacao[] = []
    autoAvaliacoes: Avaliacao[] = []
    monitor: Monitor 
    respostaDeRoteiro: RespostaDeRoteiro 
    
    getAluno(): Aluno;
    getAvaliacoes(): Avaliacao;
    getAutoAvaliacoes(): Avaliacao;
    getMonitor(): Monitor;
    getRespostaDeRoteiro(): RespostaDeRoteiro;
}