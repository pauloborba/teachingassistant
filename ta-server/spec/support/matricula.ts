export class Matricula{
    aluno: Aluno
    avaliacoes: Avaliacoes[] = []
    autoAvaliacoes: AutoAvaliacoes[] = []
    monitor: Monitor 
    respostaDeRoteiro: respostaDeRoteiro 
    
    getAluno(): Aluno;
    getAvaliacoes(): Avaliacoes;
    getAutoAvaliacoes(): AutoAvaliacoes;
    getMonitor(): Monitor;
    getRespostaDeRoteiro(): RespostaDeRoteiro;
}