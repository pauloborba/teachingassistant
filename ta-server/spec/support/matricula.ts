export class Matricula{
    aluno: Aluno
    avaliacoes: Avaliacoes[] = []
    autoAvaliacoes: AutoAvaliacoes[] = []
    monitor: Monitor 
    respostaDeRoteiro: respostaDeRoteiro 
    
    getAluno(): Aluno;
    getAvaliacoes(): Avaliacao;
    getAutoAvaliacoes(): AutoAvaliacao;
    getMonitor(): Monitor;
    getRespostaDeRoteiro(): RespostaDeRoteiro;
}