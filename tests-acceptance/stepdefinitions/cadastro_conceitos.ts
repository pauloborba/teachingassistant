import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

let sameCPF = ((elem, cpf) => elem.element(by.name('cpflist')).getText().then(text => text == cpf));

let isEmpty = ((elem) => elem.element(by.model('aluno.conceito')).getText().then(text => text == null));


//scenario cadastro de avaliacao
defineSupportCode(function ({ Given, When, Then }) {
    Given(/^Eu estou na pagina de "([^\"]*)"$/, async (name) => {

    	await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        var con = element(by.name('conceitos'));
        await con;
        await expect(con.getText()).to.eventually.equal(name);
        await con.click();
		
    })
	
	Given (/^eu consigo ver os campos data, avaliacao e meta todos em branco$/, async() =>{
		
		var data = element(by.name('data'));
		await data;
		await expect(data.getAttribute('value')).to.eventually.equal('');
		var descricao = element(by.name('descricao'));
		await descricao;
		await expect(descricao.getAttribute('value')).to.eventually.equal('');
		var meta = element(by.name('meta'));
		await meta;
		await expect(meta.getAttribute('value')).to.eventually.equal('');	   	
    	
    	
		
	});
	
	Given(/^Ha um aluno de cpf "(\d*)" e outro aluno de cpf "(\d*)" cadastrados$/, async (cpf, cpf2) => {

    	var allcpfs : ElementArrayFinder = element.all(by.name('alunosList'));
    	await allcpfs;
    	var samecpf = allcpfs.filter(elem => sameCPF(elem,cpf) || sameCPF(elem,cpf));
        await samecpf;
        await samecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(2));
        
    });
	
	 When(/^eu tento preencher os campos data com "([^\"]*)" , avaliação com "([^\"]*)" e meta com "([^\"]*)"$/, async (data, aval, meta) => {
        
        await element(by.name('data')).sendKeys(<string> data);
        await element(by.name('descricao')).sendKeys(<string> aval);
        await element(by.name('data')).sendKeys(<string> meta);
        
    });
	
	 Then(/^eu posso ver na linha do aluno de cpf "(\d*)" na coluna de requisitos o campo em branco para o cadastro de conceitos$/, async (cpf) => {
        
        var alunos :  ElementArrayFinder = element.all(by.name('alunosList'));
        await alunos;
        var onealuno = alunos.filter(elem => sameCPF(elem,cpf) && isEmpty(elem));
		await onealuno;
		await onealuno.then(elem => expect(Promise.resolve(elem.length)).to.eventually.equal(1));

    });

     Then(/^eu posso ver na linha do aluno de cpf "(\d*)" na coluna de requisitos o campo em branco para o cadastro de conceitos$/, async (cpf) => {
        
		var alunos :  ElementArrayFinder = element.all(by.name('alunosList'));
        await alunos;
        var onealuno = alunos.filter(elem => sameCPF(elem,cpf) && isEmpty(elem));
		await onealuno;
		await onealuno.then(elem => expect(Promise.resolve(elem.length)).to.eventually.equal(1));
       
    });
	
	
})