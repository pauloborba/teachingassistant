import request = require("request-promise");
import { closeServer } from '../ta-server';

var base_url = "http://localhost:3000/";

describe("O servidor", () => {
 var server:any;

 beforeAll(() => {server = require('../ta-server')});
 afterAll(() => {server.closeServer()});

  it("Register student with no self assessment and no goals", () => {
	return request.post(base_url + "aluno", {"json":{
  	    "nome": "Paulo",
  	    "cpf" : "678",
  	    "email" : "phmb@cin.ufpe.br"
  	}}).then(body => {
        expect(body).toEqual({success: "O aluno foi cadastrado com sucesso"});
        return request.get(base_url + "alunos").then(body => { 
            expect(body).toContain('[{"nome":"Paulo","cpf":"678","email":"phmb@cin.ufpe.br","metas":{}}]');});
    	});
    });

it("Register complete student", () => {
	return request.put(base_url + "aluno", {"json":{
  	"nome": "Paulo",
  	"cpf" : "876",
  	"email" : "phmb@cin.ufpe.br",
  	"metas":{
      	"Requisitos":"MANA",
      	"Gerência De Configuração":"MANA"
      	},
  	"autoavaliacoes":{
      	"Requisitos":"MA",
      	"Gerência De Configuração":"MA"
      	}}
  	}).then(body => {
    	expect(body).toEqual({success: "O aluno foi cadastrado com sucesso"});
        	return request.get(base_url + "alunos").then(body => {
            	expect(body).toContain('{"nome":"Paulo","cpf":"876","email":"phmb@cin.ufpe.br","metas":{"Requisitos":"MANA","Gerência De Configuração":"MANA"},"autoavaliacoes":{"Requisitos":"MA","Gerência De Configuração":"MA"}}');
        	});
    	});
	});
})