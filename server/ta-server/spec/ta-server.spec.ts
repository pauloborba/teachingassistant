import request = require("request-promise");
import { closeServer } from '../ta-server';

var base_url = "http://localhost:3000/";

describe("O servidor", () => {
  var server:any;

  beforeAll(() => {server = require('../ta-server')});

  afterAll(() => {server.closeServer()});

  it("inicialmente retorna uma lista de alunos vazia", () => {
    return request.get(base_url + "alunos").then(body => expect(body).toBe("[]")).catch(e => expect(e).toEqual(null));
  })

  it("não cadastra alunos com CPF duplicado", () => {
    return request.post(base_url + "aluno", {"json":{"nome": "Mari", "cpf" : "965"}}).then(body => {
         expect(body).toEqual({success: "O aluno foi cadastrado com sucesso"});
         return request.post(base_url + "aluno", {"json":{"nome": "Pedro", "cpf" : "965"}}).then(body => {
             expect(body).toEqual({failure: "O aluno não pode ser cadastrado"});
             return request.get(base_url + "alunos").then(body => {
                 expect(body).toContain('{"nome":"Mari","cpf":"965","metas":{},"autoavaliacao":{}}');
                    expect(body).not.toContain('{"cpf":"965","nome":"Pedro","metas":{},"autoavaliacao":{}}');
             });
         });
     });
  })

})

