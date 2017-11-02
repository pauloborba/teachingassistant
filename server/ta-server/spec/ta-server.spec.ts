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

  it("só cadastra alunos", () => {
    var options:any = {method: 'POST', uri: (base_url + "aluno"), body:{name: "Mari", cpf: "962"}, json: true};
    return request(options).then(body =>
         expect(body).toEqual({failure: "O aluno não pode ser cadastrado"})
    ).catch(e =>
         expect(e).toEqual(null)
    )
  });


  it("não cadastra alunos com CPF duplicado", () => {
    return request.post(base_url + "aluno", {"json":{"nome": "Mari", "cpf" : "965"}}).then(body => {
         expect(body).toEqual({success: "O aluno foi cadastrado com sucesso"});
         return request.post(base_url + "aluno", {"json":{"nome": "Pedro", "cpf" : "965"}}).then(body => {
             expect(body).toEqual({failure: "O aluno não pode ser cadastrado"});
             return request.get(base_url + "alunos").then(body => {
                 expect(body).toContain('{"nome":"Mari","cpf":"965","email":"","metas":{}}');
                 expect(body).not.toContain('{"nome":"Pedro","cpf":"965","email":"","metas":{}}');
             });
         });
     });
  })

  it("inicialmente retorna uma lista de auto-avaliacao vazia", () => {
    return request.get(base_url + "autoAvaliacao").then(body => expect(body).toBe("[]")).catch(e => expect(e).toEqual(null));
  })

  it("não aceita novo cadastro de auto-avaliacao depois de confirmação de cadastro", () => {
    return request.post(base_url + "autoAvaliacao", {"json":{"meta": "Conceitos Requisitos", "conceito" : "MA"}}).then(body => {
         expect(body).toEqual({success: "A autoavaliacao foi cadastrada com sucesso"});
         return request.post(base_url + "autoAvaliacao", {"json":{"meta": "Conceitos Requisitos", "conceito" : "MPA"}}).then(body => {
             expect(body).toEqual({failure: "A autoavaliacao não pode ser cadastrada"});
             return request.get(base_url + "autoAvaliacao").then(body => {
                 expect(body).toContain('{"meta": "Conceitos Requisitos", "conceito" : "MA"}');
                 expect(body).not.toContain('{"meta": "Conceitos Requisitos", "conceito" : "MPA"}');
             });
         });
     });
  })

})
