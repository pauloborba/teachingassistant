import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));



//scenario cadastro de avaliacao
defineSupportCode(function ({ Given, When, Then }) {
    Given(/^Eu estou na pagina de "([^\"]*)"$/, async (name) => {

    	await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        var con = element(by.name("conceitos"));
        await expect(con.getText()).toEqual(name);
		await con.click();
    })
	
	Given (/^eu consigo ver os campos data, avaliacao, e meta todos em branco$/, async() =>{
		
		var data = element(by.model('avaliacao.data'));
		await data.then(data => expect(Promise.resolve(data.getText())).to.eventually.equal(""));
		var aval = element(by.model('avaliacao.aval'));
		await aval.then(aval => expect(Promise.resolve(aval.getText())).to.eventually.equal(""));
		var meta = element(by.model('avaliacao.meta'));
		await meta.then(meta => expect(Promise.resolve(meta.getText())).to.eventually.equal(""));    	
    	
    	
		
	});
	
	
})