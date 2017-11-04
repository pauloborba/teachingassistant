import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

defineSupportCode(function({ Given, When, Then }){
	Given(/^ que estou na página de avaliações$/, async() =>{
	await browser.get("http://localhost:4200/");
		await expect (browser.getTitle()).to.eventually.equal('TaGui');
		await $("a[name='avaliacoes']").click();
	})
	Given(/^ as metas avaliadas são "(.*?)", "(.*?)", "(.*?)", "(.*?)" e "(.*?)", respectivamente$/, async(meta1, meta2, meta3, meta4, meta5) => {
		await expect(element(by.name('mt1')).getText()).toBe(meta1);
		await expect(element(by.name('mt2')).getText()).toBe(meta2);
		await expect(element(by.name('mt3')).getText()).toBe(meta3);
		await expect(element(by.name('mt4')).getText()).toBe(meta4);
		await expect(element(by.name('mt5')).getText()).toBe(meta5);
	})
	Given(/^a aluna "(.*?)" se auto avaliou como "(.*?)", "(.*?)", "(.*?)", "(.*?)" e "(.*?)", respectivamente.$/,	async(nome, con1, con2, con3, con4, con5) => {
		await expect(element(by.tagName('td')).getText()).toEqual(nome);
		await expect(element(by.name('mt1avaliation')).getText()).toBe(con1);
		await expect(element(by.name('mt2avaliation')).getText()).toBe(con2);
		await expect(element(by.name('mt3avaliation')).getText()).toBe(con3);
		await expect(element(by.name('mt4avaliation')).getText()).toBe(con4);
		await expect(element(by.name('mt5avaliation')).getText()).toBe(con5);
	})
	
	Given(/^ o professor avaliou "(.*?)" como "(.*?)", "(.*?)", "(.*?)", "(.*?)" e "(.*?)", respectivamente$/,	async(nome, con1, con2, con3, con4, con5/*  */) => {
		await expect(element(by.tagName('td')).getText()).toEqual(nome);
		await expect(element(by.name('mt1t_avaliation')).getText()).toBe(con1);
		await expect(element(by.name('mt2t_avaliation')).getText()).toBe(con2);
		await expect(element(by.name('mt3t_avaliation')).getText()).toBe(con3);
		await expect(element(by.name('mt4t_avaliation')).getText()).toBe(con4);
		await expect(element(by.name('mt5t_avaliation')).getText()).toBe(con5);
	})
	
	When(/^o professor for para a opção de “Discrepâncias”$/, async() =>{
		await $("a[name='discrepancias']").click();
	})

	Then(/^o professor verá verá a planilha de auto avaliação de "(.*?)" destacada$/, async() => {
		await expect(element(by.id('aluno')).getText()).toEqual('Larícia Maria').getCssValue('color').to.eventually.equal('#db0202');
	
	})

	Then(/^ o professor verá as estatísticas de discrepância da turma$/, async() =>{
		await $(expect(element(by.binding('estatistica')).isPresent()).toBe(true));
	})
	Then(/^ o professor verá as estatísticas da turma$/, async() =>{
	await $(expect(element(by.binding('estatistica')).isPresent()).toBe(true));
	})
	Then(/^o professor verá uma mensagem indicando que não há discrepâncias$/, async() =>{
		await $(expect(element(by.binding('semdisc')).isPresent()).toBe(true));
	})
})

