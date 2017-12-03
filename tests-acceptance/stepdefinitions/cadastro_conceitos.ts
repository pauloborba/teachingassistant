import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

let sameCPF = ((elem, cpf) => elem.element(by.name('cpfs')).getText().then(text => text == cpf));

let sameData = ((elem, data) => elem.element(by.name('a.data')).getText().then(text => text == data));
let sameDesc = ((elem, desc) => elem.element(by.name('a.descricao')).getText().then(text => text == desc));
let sameMeta = ((elem, meta) => elem.element(by.name('a.meta')).getText().then(text => text == meta));

let isEmpty = ((elem,meta) => elem.element(by.name(meta)).getAttribute('value').then(text => text ==''));

let pAND = ((p,q) => p.then(pb => q.then(qb => pb && qb)));




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

	Given (/^Ha um aluno de cpf "(\d*)" cadastrado$/, async(cpf) =>{
		var allcpfs : ElementArrayFinder = element.all(by.name('cpfs'));
    	await allcpfs;
    	var samecpf = allcpfs.filter(elem =>
                                      elem.getText().then(text => text === cpf));
        await samecpf;
        await samecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));

	});	

	Given (/^Ha um outro aluno de cpf "(\d*)" cadastrado$/, async(cpf) =>{
		var allcpfs : ElementArrayFinder = element.all(by.name('alunoList'));
    	await allcpfs;
    	var samecpf = allcpfs.filter(elem => sameCPF(elem,cpf));                                      
        await samecpf;
        await samecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));

	});
	
	
	When(/^eu tento preencher os campos data com "([^\"]*)" , avaliação com "([^\"]*)" e meta com "([^\"]*)"$/, async (data, aval, meta) => {
        
        await element(by.name('data')).sendKeys(<string> data);
        await element(by.name('descricao')).sendKeys(<string> aval);
        await element(by.name('meta')).sendKeys(<string> meta);
        await element(by.buttonText('Adicionar')).click();

        
    });

    Then(/^eu posso ver na tela as informações da data "([^\"]*)", avaliação "([^\"]*)" e meta "([^\"]*)"$/, async (data, desc, meta) => {
        
        var aval :  ElementArrayFinder = element.all(by.name('avaliacaoList'));
        await aval;
        var sameAval = aval.filter(elem => sameData(elem,data) && sameDesc(elem,desc) && sameMeta(elem,meta) );
        await sameAval;
        await sameAval.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
        

    });

  
	
	Then(/^eu posso ver na linha do aluno de cpf "(\d*)" na coluna de "([^\"]*)" o campo em branco para o cadastro de conceitos$/, async (cpf, meta) => {
        
        var alunos :  ElementArrayFinder = element.all(by.name('alunoList'));
        await alunos;
        var onealuno = alunos.filter(elem => pAND(sameCPF(elem,cpf), isEmpty(elem,meta)) );
		await onealuno;
		await onealuno.then(elem => expect(Promise.resolve(elem.length)).to.eventually.equal(1));

    });

    Then(/^eu tambem posso ver na linha do aluno de cpf "(\d*)" na coluna de "([^\"]*)" o campo em branco para o cadastro de conceitos$/, async (cpf, meta) => {
        
		var alunos :  ElementArrayFinder = element.all(by.name('alunoList'));
        await alunos;
        var onealuno = alunos.filter(elem => pAND(sameCPF(elem,cpf), isEmpty(elem,meta)) );
		await onealuno;
		await onealuno.then(elem => expect(Promise.resolve(elem.length)).to.eventually.equal(1));
       
    });
	
	
})