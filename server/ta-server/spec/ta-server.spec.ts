import request = require("request-promise");
import { closeServer } from '../ta-server';

var base_url = "http://localhost:3000/";

describe("O servidor", () => {
  var server:any;

  beforeAll(() => {server = require('../ta-server')});

  afterAll(() => {server.closeServer()});

  it("inicialmente retorna uma lista de alunos vazia", () => {
    return request.get(base_url + "alunos")
            .then(body => 
               expect(body).toBe("[]")
             )
            .catch(e => 
               expect(e).toEqual(null)
             );
  })

  it("só cadastra alunos", () => {
    var options:any = {method: 'POST', uri: (base_url + "aluno"), body:{name: "Mari", cpf: "962"}, json: true};
    return request(options)
             .then(body =>
                expect(body).toEqual({github: "O aluno não pode ser cadastrado"})
             ).catch(e =>
                expect(e).toEqual(null)
             )
  });

  it("cadastra aluno sem cpf", () => {
   var options:any = {method: 'POST', uri: (base_url + "aluno"), body:{name: "Jose", cpf: "", email: "", github: "jose"}, json: true};
   return request(options)
            .then(body =>
               expect(body).toEqual({cpf: "O aluno não pode ser cadastrado"})
            ).catch(e =>
               expect(e).toEqual(null)
            )
 });


  it("não cadastra alunos com CPF duplicado", () => {
    var aluno1 = {"json":{"nome": "Mari", "cpf" : "965", "email":"", "github":"a"}};
    var aluno2 = {"json":{"nome": "Pedro", "cpf" : "965", "email":"", "github":"b"}};
    var resposta1 = '{"nome":"Mari","cpf":"965","email":"","github":"a","metas":{}}';
    var resposta2 = '{"nome":"Pedro","cpf":"965","email":"","github":"b","metas":{}}';
    return request.post(base_url + "aluno", aluno1)
             .then(body => {
                expect(body).toEqual({success: "O aluno foi cadastrado com sucesso"});
                return request.post(base_url + "aluno", aluno2)
                         .then(body => {
                            expect(body).toEqual({cpf: "O aluno não pode ser cadastrado"});
                            return request.get(base_url + "alunos")
                                     .then(body => {
                                        expect(body).toContain(resposta1);
                                        expect(body).not.toContain(resposta2);
                                      });
                          });
              })
              .catch(err => {
                 expect(err).toEqual(null)
              });
 })

 it("deleta um aluno a ser adicionado", () => {
   var aluno = {"json":{"nome": "Paulo", "cpf" : "123", "email":"", "github":"p"}};
   var resposta = '{"nome":"Paulo","cpf":"123","email":"","github":"p","metas":{}}';
   return request.post(base_url + "aluno", aluno)
            .then(body => {
               expect(body).toEqual({success: "O aluno foi cadastrado com sucesso"});
               return request.delete(base_url + "aluno/" + aluno.json.cpf)
                        .then(body => {
                           expect(body).toEqual('{"success":"O aluno foi removido com sucesso"}');
                           return request.get(base_url + "alunos")
                                    .then(body => {
                                       expect(body).not.toContain(resposta);
                                     });
                         });
             })
             .catch(err => {
                expect(err).toEqual(null)
             });
})

it("deleta um aluno não existente", () => {
   var cpfT = "444";
   return request.delete(base_url + "aluno/" + cpfT)
                        .then(body => {
                           expect(body).toEqual('{"failure":"O aluno não pode ser removido"}');
                        })

})

}) 