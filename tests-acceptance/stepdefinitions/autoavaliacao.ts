import { defineSupportCode } from 'cucumber';
import { protractor, browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

let sameCPF = ((elem, cpf) => elem.element(by.name('cpfmetalist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(by.name('nomemetalist')).getText().then(text => text === name));
let sameMeta = ((elem, metaname, meta) => elem.element(by.name(metaname)).getAttribute('ng-reflect-model').then(attr => attr === meta));
let emptyField = ((elem, field) => elem.element(by.name(field)).getAttribute('ng-reflect-model').then(attr => {//!attr));
    if (attr) {
	return attr.length === 0;
    } else {
	return true;
    }
}, function() {
    return true
}));

defineSupportCode(function ({ Given, When, Then }) {
    Given(/^I am at the metas page$/, async () => {
        await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        await $("a[name='metas']").click();
    });

    Given(/^I can see the student "([^\"]*)" with CPF "(\d*)" in the students list without concepts$/, async (name, cpf) => {
	var allalunos : ElementArrayFinder = element.all(by.name('alunosmetalist'));
        await allalunos;
        var samenamecpf = allalunos.filter(elem => sameCPF(elem,cpf) && sameName(elem,name));
        await samenamecpf;
        await samenamecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
	// faz com que os campos fiquem vazios
	await samenamecpf.first().element(by.name('requisitos')).sendKeys(protractor.Key.CONTROL, "a", protractor.Key.NULL, protractor.Key.DELETE);
	await samenamecpf.first().element(by.name('gerconfig')).sendKeys(protractor.Key.CONTROL, "a", protractor.Key.NULL, protractor.Key.DELETE);

	// ativar o onchange
	await samenamecpf.first().element(by.name('cpfmetalist')).click();
	
	await expect(emptyField(samenamecpf.first(), 'requisitos')).to.eventually.equal(true);
	await expect(emptyField(samenamecpf.first(), 'gerconfig')).to.eventually.equal(true);
    });

    When(/^I try to register meta "(\w*)" to student "([^\"]*)" with CPF "(\d*)" in the "(.*)" field$/, async (meta, name, cpf, field) => {
	var allalunos : ElementArrayFinder = element.all(by.name('alunosmetalist'));
        await allalunos;
        var samenamecpf = allalunos.filter(elem => sameCPF(elem,cpf) && sameName(elem,name));
        await samenamecpf;
	var fd;
	if (field === "Requisitos") fd = 'requisitos';
	else fd = 'gerconfig';
        await samenamecpf.first().element(by.name(fd)).sendKeys(<string> meta);
	// ativar onchange
	await samenamecpf.first().element(by.name('cpfmetalist')).click();
    });

    When(/^I reload the page$/, async () => {
	await browser.refresh();
	await expect(browser.getTitle()).to.eventually.equal('TaGui');
    });

    Then(/^I can see the student "([^\"]*)" with CPF "(\d*)" with meta "(\w*)" in "(.*)"\.?$/, async (name, cpf, meta, field) => {
        var allalunos : ElementArrayFinder = element.all(by.name('alunosmetalist'));
        await allalunos;
	var fd;
	if (field === "Requisitos") fd = 'requisitos';
	else fd = 'gerconfig';
        var samenamecpf = allalunos.filter(elem => sameCPF(elem,cpf) && sameName(elem,name));
        await samenamecpf;
        await samenamecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
	await expect(sameMeta(samenamecpf.first(), fd, meta)).to.eventually.equal(true);
    });

    Then(/^I can see the student "([^\"]*)" with CPF "(\d*)" still without metas.$/, async (name, cpf) => {
	var allalunos : ElementArrayFinder = element.all(by.name('alunosmetalist'));
	await allalunos;
	var samenamecpf = allalunos.filter(elem => sameCPF(elem,cpf) && sameName(elem,name));
	await samenamecpf;
        await samenamecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
	await expect(emptyField(samenamecpf.first(), 'requisitos')).to.eventually.equal(true);
	await expect(emptyField(samenamecpf.first(), 'gerconfig')).to.eventually.equal(true);
    });
})
