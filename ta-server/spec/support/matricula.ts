export class Matricula{
    aluno: Aluno
    avaliacoesList: Avaliacoes[] = []
    autoAvaliacoesList: AutoAvaliacoes[] = []
    monitorResponsavel: Monitor
    roteiros: Roteiros[] = []
    
    getAluno(): Aluno;
    getAvaliacoes(): Avaliacoes;
    getAutoAvaliacoes(): AutoAvaliacoes;
    getMonitorResponsavel(): Monitor;
    getRoteiros(): Roteiros;
}