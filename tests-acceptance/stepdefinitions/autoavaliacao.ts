import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

defineSupportCode(function({ Given, When, Then }){
	Given(/^Given que estou na página de autoavaliação$/, async() => {
		await browser.get("http://localhost:4200/");
		await expect (browser.getTitle()).to.eventually.equal('TaGui');
		await $("a[name='autoavaliacao']").click();
	})
	Given(/^ a aluna “(.*?)” com CPF "(.*?)" se auto avaliou como “(.*?)” em “(.*?)”, “(.*?)” em “(.*?)” e “(.*?)” em “(.*?)”$/,
	async(name, cpf, meta1, conc1, meta2, conc2, meta3, conc3) =>{
		await $("input[name='namebox']").sendKeys(<string> name);
        await $("input[name='cpfbox']").sendKeys(<string> cpf);
        await $("input[name='conc1in']").sendKeys(<string> meta1);
        await $("input[name='conc2in']").sendKeys(<string> meta2);
        await $("input[name='conc3in']").sendKeys(<string> meta3);
	})
	Given(/^ a aluna “(.*?)” com CPF "(.*?)" se auto avaliou como “(.*?)” em “(.*?)” e “(.*?)” em “(.*?)”$/,
	async(nome, cpf, meta2, conc2, meta3, conc3) =>{
		await $("input[name='namebox']").sendKeys(<string> name);
        await $("input[name='cpfbox']").sendKeys(<string> cpf);
        await $("input[name='conc2in']").sendKeys(<string> meta2);
        await $("input[name='conc3in']").sendKeys(<string> meta3);
	})
	When(/^ finalizar a autoavaliacao$/, async() =>{
		await $("a[name='finalizar']").click();
	})
	Then(/^uma mensagem de confirmação é mostrada$/, async() =>{
		await expect(element(by.binding('confirmmsg')).isPresent()).toBe(true);
	})
	Then(/^uma mensagem de erro é mostrada$/, async() =>{
		await expect(element(by.binding('errormsg')).isPresent()).toBe(true);
	})
	Then(/^a meta"(.*?) é destacada$/, async(meta1) => {
		await expect($("input[name=meta]").getCssValue('color')).to.eventually.equal('#db0202');
	})
	
	
})

// cor de aviso #db0202