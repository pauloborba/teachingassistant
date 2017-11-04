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
                    expect(body).toContain('{"nome":"Mari","cpf":"965","metas":{}}');
                    expect(body).not.toContain('{"nome":"Pedro","cpf":"965","email":"","metas":{}}');
		});
            });
	});
    })

    it("não aceita metas pela metade", () => {
	return request.put(base_url + "selfmetas", {"json":{"nome": "Mariana", "cpf": "965", "selfmetas":{"requisitos": "MANA", "gerDeConfiguracao": ""}}}).then(body => {
	    
	    expect(body).toEqual({failure: "O aluno não pode ser auto avaliado"})}).catch(e => expect(e).toEqual(null))
		});

    it("aceita metas completas", () => {
	return request.put(base_url + "selfmetas", {"json":{"nome": "Mariana", "cpf": "965", "selfmetas":{"requisitos": "MANA", "gerDeConfiguracao": "MANA"}}}).then(body => {
	    
	    expect(body).toEqual({success: "O aluno foi auto avaliado com sucesso"})}).catch(e => expect(e).toEqual(null))
		});
    
})
