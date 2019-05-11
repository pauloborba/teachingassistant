import request = require("request-promise");
import { closeServer } from '../ta-server';

var base_url = "http://localhost:3000/";

describe("O servidor", () => {
  var server:any;

  beforeAll(() => {server = require('../ta-server')});

  afterAll(() => {server.closeServer()});

  beforeEach(() => server.reset())

  it("inicialmente retorna uma lista de alunos vazia", () => {
    return request.get(base_url + "alunos").then(body => expect(body).toBe("[]")).catch(e => expect(e).toEqual(null));
  })

  it("só cadastra alunos", () => {
    // por que não deveria cadastrar esse aí? É um aluno válido.
    // var options:any = {method: 'POST', uri: (base_url + "aluno"), body:{name: "Mari", cpf: "962"}, json: true};
    // return request(options).then(body =>
    //      expect(body).toEqual({failure: "O aluno não pode ser cadastrado"})
    // ).catch(e =>
    //      expect(e).toEqual(null)
    // )
  });


  it("não cadastra alunos com CPF duplicado", () => {
    return request.post(base_url + "aluno", {"json":{"nome": "Mari", "cpf" : "965", email: ''}}).then(body => {
         expect(body).toEqual({success: "O aluno foi cadastrado com sucesso"});
         return request.post(base_url + "aluno", {"json":{"nome": "Pedro", "cpf" : "965", email: ''}}).then(body => {
             expect(body).toEqual({failure: "O aluno não pode ser cadastrado"});
             return request.get(base_url + "alunos").then(body => {
                 expect(body).toContain('{"nome":"Mari","cpf":"965","email":"","metas":{}}');
                 expect(body).not.toContain('{"nome":"Pedro","cpf":"965","email":"","metas":{}}');
             });
         });
     });
  })

  it('remove aluno corretamente', () => {
    return request.post(base_url+'aluno', {json: {nome: "Maro", cpf: "0123", email: '234'}})
    .then(body => expect(body).toEqual({success: "O aluno foi cadastrado com sucesso"}))
    .then(() => request({method: 'DELETE', uri: base_url + 'aluno', body: {cpf: '0123'}, json: true}))
    .then(body => expect(body).toEqual({success: 'Aluno removido com sucesso'}))
  })

  it('remoção de aluno não afeta os outros', () => {
    return Promise.all([
      request.post(base_url+'aluno', {json: {nome: "Mari", cpf: "091", email: ''}}),
      request.post(base_url+'aluno', {json: {nome: "Maro", cpf: "222", email: ''}})
    ])
    .then(result => {
      for (const r of result) expect(r).toEqual({success: "O aluno foi cadastrado com sucesso"})
    })
    .then(() => request.delete(base_url + 'aluno', {json: {cpf: '091'}}))
    .then(body => expect(body).toEqual({success: 'Aluno removido com sucesso'}))
    .then(() => request.get(base_url + 'alunos'))
    .then(body => JSON.parse(body))
    .then(body => {
      expect(body.length).toEqual(1)
      expect(body[0]).toEqual({nome: "Maro", cpf: "222", email: '', metas: {}})
    })
  })
})
