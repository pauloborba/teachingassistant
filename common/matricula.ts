import { Aluno } from "aluno"
import { Avaliacao } from "../ta-server/avaliacao"
import { RespostaDeRoteiro } from "../ta-server/respostaderoteiro"

export class Matricula{
    aluno: Aluno
    avaliacoes: Avaliacao[] = []
    autoAvaliacoes: Avaliacao[] = []
    monitor: Aluno
    respostasDeRoteiros: RespostaDeRoteiro[] = []
    
    getAluno(): Aluno{
        return this.aluno
    }
    getAvaliacoes(): Avaliacao[]{
        return this.avaliacoes
    }
    getAutoAvaliacoes(): Avaliacao[]{
        return this.autoAvaliacoes
    }
    getMonitor(): Aluno {
        return this.monitor      
    }
    getRespostasDeRoteiros(): RespostaDeRoteiro[]{
        return this.respostasDeRoteiros
    }
}