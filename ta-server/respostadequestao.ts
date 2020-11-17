import { Questao } from "./questao";

export class RespostaDeQuestao{
    questao: Questao;
    resposta: String;
    nota: String;
    correlacao: String;
    duracao: Int16Array;

    getQuestao(): Questao{}
    getResposta(): String{}
    getNota(): String{}
    getCorrelacao(): String{}
    getDuracao(): Int16Array{}
}