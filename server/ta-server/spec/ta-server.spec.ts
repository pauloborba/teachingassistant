import request = require("request-promise");
import { closeServer } from '../ta-server';
import { Meta } from "../../../gui/ta-gui/src/app/meta";

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

  it("não cadastra metas com nome duplicado", () => {
    return request.post(base_url + "metas", { "json": { "nome": "Compreender métodos de refatoração" } }).then(body => {
      expect(body).toEqual({ success: "A meta foi adicionada com sucesso" });
      return request.post(base_url + "metas", { "json": { "nome": "Compreender métodos de refatoração" } }).then(body => {
        expect(body).toEqual({ failure: "A meta não pode ser adicionada" });
        return request.get(base_url + "metas").then(body => {
          var result : Meta[] = <Meta[]>JSON.parse(body);
          expect(body).toContain('{"nome":"Compreender métodos de refatoração"}');
          expect(result.length).toBe(1);
        });
      });
    });
  })

  it("atualiza metas cadastradas", () => {
    return request.post(base_url + "metas", { "json": { "nome": "Compreender métodos de gerência de projeto" } }).then(body => {
      expect(body).toEqual({ success: "A meta foi adicionada com sucesso" });
      return request.put(base_url + "metas", { "json": { "meta": { "nome": "Compreender métodos de gerência de projeto"}, "nome": "Compreender técnicas de gerência de projeto" } }).then(body => {
        expect(body).toEqual({ success: "A meta foi atualizada com sucesso" });
        return request.get(base_url + "metas").then(body => {
          var result: Meta[] = <Meta[]>JSON.parse(body);
          expect(body).not.toContain('{"nome":"Compreender métodos de gerência de projeto"}');
          expect(body).toContain('{"nome":"Compreender técnicas de gerência de projeto"}');
          
        });
      });
    });
  })

  it("remove metas cadastradas", () => {
    return request.post(base_url + "metas", { "json": { "nome": "Compreender métodos de documentação" } }).then(body => {
      expect(body).toEqual({ success: "A meta foi adicionada com sucesso" });
      return request.get(base_url + "metas").then(body => {
        expect(body).toContain('{"nome":"Compreender métodos de documentação"}');
        return request.delete(base_url + "metas", { "json": { "nome": "Compreender métodos de documentação" } }).then(body => {
          expect(body).toEqual({ success: "A meta foi removida com sucesso" });
          return request.get(base_url + "metas").then(body => {
            expect(body).not.toContain('{"nome":"Compreender métodos de documentação"}');
          });
        });
      });
    });
  })

})
