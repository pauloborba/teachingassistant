import { Questao } from "./questao";

export class RespostaDeQuestao{
    questao: Questao;
    resposta: String;
    nota: String;
    correlacao: String;
    duracao: number;

    getQuestao(): Questao{}
    getResposta(): String{}
    getNota(): String{}
    getCorrelacao(): String{}
    getDuracao(): number{}
}