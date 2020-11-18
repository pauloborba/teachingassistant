import { Questao} from './questao'

export class BlocoDeQuestoes{
    tipo: string;
    questoes : Questao[];



    
    getQuestoes(): Questao[]{
        return this.questoes;
    }
    addQuestao(questao: Questao): void{};
    removeQuestao(questao: Questao): void{};
    updateQuestao(oldQuestao: Questao, newQuestao: Questao): void{};

}