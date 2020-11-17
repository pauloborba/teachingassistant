export class Aluno {
    nome: String;
    cpf: String;
    email: String;

    getNome(): String {
        return this.nome
    }

    getCpf(): String {
        return this.cpf
    }

    getEmail(): String {
        return this.email
    }
}