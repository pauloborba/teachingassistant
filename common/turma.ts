import { Matricula } from './matricula';
import { Roteiro } from '../ta-server/roteiro';
import { Aluno } from './aluno';

export class Turma {
    descrição: string = ""
    metas: string[] = []
    matriculas: Matricula[] = []
    roteiros: Roteiro[] = []
    monitores: Aluno[] = []
    numeroMatriculas: number = 0


    getNumMatriculas(): number {
        return this.numeroMatriculas
    }

    getNumAprovados(): number{
        
    }

    getNumReprovados(): number{

    }

    getMedia(): number{

    }

    getMatricula(cpf:string): Matricula{ 

    }

    getRoteiros(): Roteiro[]{
        
    }
    
    getMonitores(): Aluno[] {

    }

    getPercentual(meta: string, conceito: string): number{

    }
}