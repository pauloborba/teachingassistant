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
let sameNota = ((elem,nota) => elem.element(by.name('requisitos')).getAttribute('value').then(text => text == nota));

let pAND = ((p,q) => p.then(pb => q.then(qb => pb && qb)));
let pOR = ((p,q) => p.then(pb => q.then(qb => pb || qb)));




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

//scenario cadastro de conceitos de uma meta
defineSupportCode(function ({ Given, When, Then }) {
    Given(/^Eu estou novamente na página de "([^\"]*)"$/, async (name) => {
        await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        var con = element(by.name('conceitos'));
        await con;
        await expect(con.getText()).to.eventually.equal(name);
        await con.click();
    })

    Given(/^eu posso ver também na tela as informações da data com "([^\"]*)", avaliação "([^\"]*)" e meta "([^\"]*)"$/, async (data, desc, meta) => {
        
        var aval :  ElementArrayFinder = element.all(by.name('avaliacaoList'));
        await aval;
        var sameAval = aval.filter(elem => sameData(elem,data) && sameDesc(elem,desc) && sameMeta(elem,meta) );
        await sameAval;
        await sameAval.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
        

    }); 

    Given(/^Há um aluno de cpf "(\d*)" e outro aluno de cpf "(\d*)" cadastrados$/, async (cpf, cpf2) => {

    	var allcpfs : ElementArrayFinder = element.all(by.name('alunoList'));
    	await allcpfs;
    	var samecpf = allcpfs.filter(elem =>  pOR(sameCPF(elem,cpf),sameCPF(elem,cpf2)));
        await samecpf;
        await samecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(2));
        
    });   

     Given(/^eu posso ver que na coluna "([^\"]*)" os campos estão todos em branco$/, async (meta) => {

    	var allalunos : ElementArrayFinder = element.all(by.name('alunoList'));
    	await allalunos;
    	//var emptyfield = allalunos.filter(elem => isEmpty(elem,meta));
        //await emptyfield;
        //await emptyfield.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(2));
        
    });    

    When(/^eu tento preencher na linha do aluno de cpf "(\d*)" o conceito "([^\"]*)" no campo de "([^\"]*)"$/, async (cpf, conceito, meta) => {
        var a = element(by.name('requisitos'));
        
        //await a.sendKeys(<string>conceito);
        
		

    });

      When(/^eu tento preencher também na linha do aluno de cpf "(\d*)" o conceito "([^\"]*)" no campo de "([^\"]*)"$/, async (cpf, conceito,meta) => {
        
       var a = element(by.name('requisitos'));
       //await a.sendKeys(<string>conceito);
		

    });

     Then(/^eu posso ver na tela os alunos de cpf "(\d*)" e "(\d*)" com seus respectivos conceitos "([^\"]*)" e "([^\"]*)" na coluna requisitos$/, async (cpf, cpf2, nota, nota2) => {
        
        var allalunos :  ElementArrayFinder = element.all(by.name('alunoList'));
        await allalunos
        var alunos = allalunos.filter(elem => pOR(pAND(sameCPF(elem, cpf),sameNota(elem, nota)), pAND(sameCPF(elem, cpf2),sameNota(elem, nota2))));
        await alunos;
        await alunos.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(2));
    });
})


/*
defineSupportCode(function ({ Given, When, Then }) {
    Given(/^Eu vou para a página de "([^\"]*)"$/, async (name) => {
        await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        var con = element(by.name('conceitos'));
        await con;
        await expect(con.getText()).to.eventually.equal(name);
        await con.click();
    })

    Given(/^eu posso ver novamente as informações da data "([^\"]*)" , avaliação "([^\"]*)" e meta "([^\"]*)"$/, async (data, desc, meta) => {
        
        var aval :  ElementArrayFinder = element.all(by.name('avaliacaoList'));
        await aval;
        var sameAval = aval.filter(elem => sameData(elem,data) && sameDesc(elem,desc) && sameMeta(elem,meta) );
        await sameAval;
        await sameAval.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
        

    }); 

   Given (/^Há um aluno de cpf "(\d*)" cadastrado com conceito "([^\"]*)"$/, async(cpf,nota) =>{
		var allcpfs : ElementArrayFinder = element.all(by.name('AlunoList'));
    	await allcpfs;
    	var samecpf = allcpfs.filter(elem => sameCPF(elem,cpf) && sameNota(elem,mota));
        await samecpf;
        await samecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));

	});	

	Given (/^Há um outro aluno de cpf "(\d*)" cadastrado ainda sem conceito em "([^\"]*)"$/, async(cpf, meta) =>{
		var allcpfs : ElementArrayFinder = element.all(by.name('alunoList'));
    	await allcpfs;
    	var samecpf = allcpfs.filter(elem => sameCPF(elem,cpf) && isEmpty(elem,meta));                                      
        await samecpf;
        await samecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));

	});  

	Given (/^não há nenhum outro aluno cadastrado$/, async() =>{
		var allcpfs : ElementArrayFinder = element.all(by.name('alunoList'));
    	await allcpfs;    	
        await allcpfs.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(2));

	});    

    When(/^eu preencho na linha do aluno de cpf "(\d*)" o conceito "([^\"]*)" na coluna de "([^\"]*)"$/, async (cpf, conceito, meta) => {
        
        var alunos :  ElementArrayFinder = element.all(by.name('alunoList'));
        await alunos;
        var onealuno = alunos.filter(elem => sameCPF(elem,cpf));
		await onealuno.row(0).column(meta).sendKeys(<string>conceito);
		

    });
    

     Then(/^eu posso ver na tela os alunos de cpf "(\d*)" e "(\d*)" com seus respectivos conceitos "([^\"]*)" e "([^\"]*)" na coluna requisitos$/, async (cpf, cpf2, nota, nota2) => {
        
        var allalunos :  ElementArrayFinder = element.all(by.name('alunoList'));
        await allalunos
        var alunos = allalunos.filter(elem => pOR(pAND(sameCPF(elem, cpf),sameNota(elem, nota)), pAND(sameCPF(elem, cpf2),sameNota(elem, nota2))));
        await alunos;
        await alunos.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(2));
    });
})
*/
