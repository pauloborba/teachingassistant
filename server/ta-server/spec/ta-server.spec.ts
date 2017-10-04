import request = require("request");
import { closeServer } from '../ta-server';

var base_url = "http://localhost:3000/";

describe("O servidor", () => {
  var server:any;

  beforeAll(() => server = require('../ta-server'));

  afterAll(() => server.closeServer());

  it("inicialmente retorna uma lista de alunos vazia", (done:any) => {
    request.get(base_url + "alunos", (error, response, body) => {
        expect(body).toBe("[]");
        done();
    });
  })

  it("só cadastra alunos", (done:any) => {
    request.post(base_url + "aluno", {"json":{"name": "Mari", "cpf" : "962"}}, (error, response, body) => {
        expect(body).toEqual({failure: "O aluno não pode ser cadastrado"});
        done();
    });
  })

  it("não cadastra alunos com CPF duplicado", (done:any) => {
    request.post(base_url + "aluno", {"json":{"nome": "Mari", "cpf" : "965"}}, (error, response, body) => {
        expect(body).toEqual({success: "O aluno foi cadastrado com sucesso"});
        done();
    });
    request.post(base_url + "aluno", {"json":{"nome": "Pedro", "cpf" : "965"}}, (error, response, body) => {
        expect(body).toEqual({failure: "O aluno não pode ser cadastrado"});
        done();
    });
    request.get(base_url + "alunos", (error, response, body) => {
        expect(body).toContain('[{"nome": "Mari", "cpf" : "965", "email": "", "metas":{}}]');
        expect(body).not.toContain('[{"nome": "Pedro", "cpf" : "965", "email": "", "metas":{}}]');
        done();
    });
  })

})
