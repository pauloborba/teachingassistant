import { defineSupportCode } from 'cucumber';
import { protractor, browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sameCPF = ((elem, cpf) => elem.element(by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(by.name('nomelist')).getText().then(text => text === name));

let sameMetaCPF = ((elem, cpf) => elem.element(by.name('cpfmetalist')).getText().then(text => text === cpf));
let sameMetaName = ((elem, name) => elem.element(by.name('nomemetalist')).getText().then(text => text === name));

let gotExc = ((elem, exc) => elem.element(by.name('exclamations')).getText().then(text => text === exc));

let sameMeta = ((elem, metaname, meta) => elem.element(by.name(metaname)).getText().then(text => text === meta));

let autoavalia = (async(name, cpf, goal1, goal2) => {
    await $("a[name='selfmetas']").click();
    var allalunos : ElementArrayFinder = element.all(by.name('alunosmetalist'));
    await allalunos;
    var samenamecpf = allalunos.filter(elem => sameMetaCPF(elem,cpf) && sameMetaName(elem,name));
    await samenamecpf;
    await samenamecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    // faz com que os campos fiquem vazios
    await samenamecpf.first().element(by.name('requisitos')).sendKeys(protractor.Key.CONTROL, "a", protractor.Key.NULL, protractor.Key.DELETE);
    await samenamecpf.first().element(by.name('gerconfig')).sendKeys(protractor.Key.CONTROL, "a", protractor.Key.NULL, protractor.Key.DELETE);
    await samenamecpf.first().element(by.name('requisitos')).sendKeys(<string> goal1);
    await samenamecpf.first().element(by.name('gerconfig')).sendKeys(<string> goal2);
    await samenamecpf.first().element(by.name('but')).click();

    await $("a[name='discrepancias']").click();
});

let cadastroAvaliacoes = (async(name, cpf, goal1, goal2) => {
    //cadastrando name...
    await $("a[name='alunos']").click();
    await $("input[name='namebox']").sendKeys(<string> name);
    await $("input[name='cpfbox']").sendKeys(<string> cpf);
    await element(by.buttonText('Adicionar')).click();
    //colocando goal1 e goal2...
    await $("a[name='metas']").click();
    var allalunos : ElementArrayFinder = element.all(by.name('alunosmetalist'));
    await allalunos;
    var samenamecpf = allalunos.filter(elem => sameMetaCPF(elem,cpf) && sameMetaName(elem,name));
    await samenamecpf;
    await samenamecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
        // faz com que os campos fiquem vazios
    await samenamecpf.first().element(by.name('requisitos')).sendKeys(protractor.Key.CONTROL, "a", protractor.Key.NULL, protractor.Key.DELETE);
    await samenamecpf.first().element(by.name('gerconfig')).sendKeys(protractor.Key.CONTROL, "a", protractor.Key.NULL, protractor.Key.DELETE);
    await samenamecpf.first().element(by.name('requisitos')).sendKeys(<string> goal1);
    await samenamecpf.first().element(by.name('gerconfig')).sendKeys(<string> goal2);
    await samenamecpf.first().element(by.name('nomemetalist')).click();
    await $("a[name='discrepancias']").click();
});

defineSupportCode(function ({ Given, When, Then, setDefaultTimeout }) {

    setDefaultTimeout(60 * 1000);
    
    Given(/^I am at the discrepancias page$/, async() => {
	await browser.get("http://localhost:4200/");
	await expect(browser.getTitle()).to.eventually.equal('TaGui');
	await $("a[name='discrepancias']").click();
    })

    Given(/^I can see the student "(.*)" with cpf "(.*)" with goals "(.*)", "(.*)"$/, async(name, cpf, goal1, goal2) => {
	await cadastroAvaliacoes(name, cpf, goal1, goal2);
	var allalunos : ElementArrayFinder = element.all(by.name('disclist'));
	await allalunos;
	var samenamecpf = allalunos.filter(elem => sameCPF(elem,cpf) && sameName(elem,name));
        await samenamecpf;
        await samenamecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
	// garantindo que vejo as metas que devo ver em pedro
	await expect(sameMeta(samenamecpf.first(), 'req', goal1)).to.eventually.equal(true);
	await expect(sameMeta(samenamecpf.first(), 'ger', goal2)).to.eventually.equal(true);
    });

    Given(/^"(.*)" with cpf "(.*)" has self-evaluated himself with "(.*)", "(.*)"$/, async(name, cpf, goal1, goal2) => {
	await autoavalia(name, cpf, goal1, goal2);
	var allalunos : ElementArrayFinder = element.all(by.name('disclist'));
	await allalunos;
	var samenames = allalunos.filter(elem => sameName(elem,name));
        await samenames;
        await samenames.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
	// garantindo que vejo as metas que devo ver em pedro auto-avaliado
	await expect(sameMeta(samenames.first(), 'selfreq', goal1)).to.eventually.equal(true);
	await expect(sameMeta(samenames.first(), 'selfger', goal2)).to.eventually.equal(true);
    });

    Then(/^I can see "(\d*)" in total de alunos discrepantes$/, async(total) => {
	var tot = element(by.name('discrepantetotal'));
	await tot;

	await expect(tot.getText().then(text => text === "total: " + total)).to.eventually.equal(true);
    });

    Then(/^I can see "(\d*)"% in porcentagem de alunos discrepantes$/, async(pctg) => {
	var pc = element(by.name('pctgtotal'));
	await pc;
	await expect(pc.getText().then(text => text === "porcentagem: " + pctg + "%")).to.eventually.equal(true);
    });

    Then (/^I can see the list alunos discrepantes with "(.*)" with cpf "(.*)" with "(.*)" near it$/, async(name, cpf, exclamations) => {
	var discrepanteslist : ElementArrayFinder = element.all(by.name('disclist'));
	await discrepanteslist;

	var samenamecpf = discrepanteslist.filter(elem => sameCPF(elem,cpf) && sameName(elem,name));
	await samenamecpf;
	await samenamecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));

	var hasExc = samenamecpf.filter(elem => gotExc(elem, exclamations));
	await hasExc;
	await hasExc.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    Then (/^I can see "(.*)" below the list.$/, async (msg) => {
	var mensagem = element(by.name('mensagem'));
	await mensagem;

	await expect(mensagem.getText().then(text => text === msg)).to.eventually.equal(true);
    });

})
