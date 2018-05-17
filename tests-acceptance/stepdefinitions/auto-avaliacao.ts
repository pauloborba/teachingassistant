import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => {setTimeout(resolve, ms)}));

defineSupportCode(function ({ Given, When, Then }) {
	Given(/^O aluno está na página de "([^"]*)" logado com nome "([^"]*)" e senha "([^"]*)"$/, async(pagina, nome_user, senha) =>{
		await browser.get("http://localhost:4200/"+pagina+"_login");
		await $("input[name='user']").sendKeys(<string> nome_user);
		await $("input[name='passwd']").sendKeys(<string> senha);
	});
	Given(/^o aluno pode ver a lista de metas com os campos "([^"]*)", "([^"]*)" e "([^"]*)"$/, async(meta1, meta2, meta3) =>{
		var cur_meta : ElementArrayFinder = element.all(by.name(meta1+'_student_evaluation'));
		await cur_meta;
		await cur_meta.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
		var cur_meta : ElementArrayFinder = element.all(by.name(meta2+'_student_evaluation'));
		await cur_meta;
		await cur_meta.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
		var cur_meta : ElementArrayFinder = element.all(by.name(meta3+'_student_evaluation'));
		await cur_meta;
		await cur_meta.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
	});
	When(/^o aluno tenta submeter sua avaliação com “([^"]*)” em “([^"]*)”, “([^"]*)” em “([^"]*)” e “([^"]*)” em “([^"]*)”$/, async(nota1, meta1, nota2, meta2, nota3, meta3) =>{
		 await $("input[name=meta1+'box']").sendKeys(<string> nota1);
 		 await $("input[name=meta2+'box']").sendKeys(<string> nota2);
		 await $("input[name=meta3+'box']").sendKeys(<string> nota3);
		 await $("button[name='Submit']").click();
	});
	Then(/^O aluno pode ver no campo correspondente a sua auto-avaliação “([^"]*)” na célula correspondente a “([^"]*)”, “([^"]*)” na célula correspondente a “([^"]*)” e “([^"]*)” na célula correspondente a “([^"]*)”$/, async(nota1, meta1, nota2, meta2, nota3, meta3) =>{
		let avaliacao = element.all(by.name(meta1+'_student_evaluation'));
	        avaliacao.then(elems=> {
        	       	expect(elems.length).toBe(1);//há um e somente um campo de exibição da nota
			expect(elems[0].getText().to.eventually.equal(nota1));//e ele mostra a nota correspondente
		});
		avaliacao = element.all(by.name(meta2+'_student_evaluation'));
                avaliacao.then(elems=> {
                      expect(elems.length).toBe(1);//há um e somente um campo de exibição da nota
                      expect(elems[0].getText().to.eventually.equal(nota2));
                });    
		avaliacao = element.all(by.name(meta3+'_student_evaluation'));
                avaliacao.then(elems=> {
                       expect(elems.length).toBe(1);//há um e somente um campo de exibição da nota
                       expect(elems[0].getText().to.eventually.equal(nota3));
                });    
	});
	Then(/^O aluno recebe uma mensagem de que a auto-avaliação não foi realizada$/, async=>{
		expect(element(by.binding('fail_to_evaluate')).isPresent()).toBe(true);
	});
	Then(/^O aluno permanece na página de “([^"])”$/, async(pagina)=>{
		browser.assert.urlEquals('127.0.0.1:4200/'+pagina);
	});
});
