import { Questao } from "./questao";

export class RespostaDeQuestao{
    questao: Questao;
    resposta: String;
    nota: String;
    correcao: String;
    duracao: number;

    getQuestao(): Questao{}
    getResposta(): String{}
    getNota(): String{}
    getCorrecao(): String{}
    getDuracao(): number{}
}