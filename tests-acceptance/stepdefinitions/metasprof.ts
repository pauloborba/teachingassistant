import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

let sameName = ((elem, name) => elem.element(by.name('nomelist')).getText().then(text => text === name));

let sameGoal = ((elem, concept, goal) => elem.element(by.name(concept)).getText().then(text => text ===goal));

let sameEvaluation = ((elem, concept, evaluation) => elem.element(by.name(concept+"-A")).getText().then(text => text ===evaluation));

defineSupportCode(function ({ Given, When, Then }) {
Given(/^estou na página de "metas"$/,async () => {
           await browser.get("http://localhost:4200/");
           await expect(browser.getTitle()).to.eventually.equal('TaGui');
            await $("a[name='metas']").click();
});

Given(/^o estudante "[^\"]*" tem conceito "[^\"]*" em "[^\"]*"$/,async (aluno,conceito,meta)=> {
var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
await allalunos;
var sameinformations= allalunos.filter(elem => sameName(elem,aluno) && sameGoal(elem,conceito, meta));
    await sameinformations;
await sameinformations.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
});

Given(/^o estudante "[^\"]*" se autoavaliou com "[^\"]*" em "[^\"]*"$/,async (aluno,conceito,autoavaliacao)=> {
var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
await allalunos;
var sameinformations= allalunos.filter(elem => sameName(elem,aluno) && sameEvaluation(elem,conceito,autoavaliacao) );
    await sameinformations;
await sameinformations.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
});

When(/^ eu for para a página de "Alunos discrepantes"$/, async () => {
           await browser.get("http://localhost:4200/");
           await expect(browser.getTitle()).to.eventually.equal('TaGui-Metas');
            await $("a[name='discrepantes']").click();
});

Then(/^eu verei o campo de quantidade de alunos com avaliação discrepante com "(\d*)"$/, async (quant) => {
           await expect($("p[name='quantDiscrepante']").getText()).to.eventually.equal(quant);
});

Then(/^eu verei o campo de porcentagem com"[^\"]*"$/, async (porc) => {
           await expect($("p[name='porcDiscrepante']").getText()).to.eventually.equal(porc);
});

Then(/^a lista de alunos discrepantes terá o nome "[^\"]*"$/, async (name) => {
var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
await allalunos;
var samename = allalunos.filter(elem =>elem.getText().then(text => text ===name));
await samename;
await samename.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
});

Then(/^a lista de alunos discrepantes estará vazia$/, async () => {
var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
await allalunos;
await allalunos.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
});
})