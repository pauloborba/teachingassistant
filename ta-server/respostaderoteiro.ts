import { Roteiro } from "./roteiro";
import { RespostaDeQuestao } from "./respostadequestao"

export class RespostaDeRoteiro {
    nota: String;
    roteiro: Roteiro
    respostaDeQuestao: RespostaDeQuestao

    getNota(): String{
        return this.nota
    }

    getRoteiro(): Roteiro{}
    getRespostaDeQuestao(): RespostaDeQuestao{}
}