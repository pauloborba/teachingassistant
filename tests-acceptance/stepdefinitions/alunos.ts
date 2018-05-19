import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

let sameCPF = ((elem, cpf) => elem.element(by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(by.name('nomelist')).getText().then(text => text === name));

let sameMeta = ((elem, meta) => elem.element(by.name('metalist')).getText().then(text => text === meta));
let sameDiscrepancia = ((elem, meta) => elem.element(by.name('discrepancias')).getText().then(text => text === meta));


defineSupportCode(function ({ Given, When, Then }) {
    Given(/^I am at the students page$/, async () => {
        await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        await $("a[name='alunos']").click();
    })

    Given(/^I cannot see a student with CPF "(\d*)" in the students list$/, async (cpf) => {
        var allcpfs : ElementArrayFinder = element.all(by.name('cpflist'));
        await allcpfs;
        var samecpfs = allcpfs.filter(elem =>
                                      elem.getText().then(text => text === cpf));
        await samecpfs;
        await samecpfs.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    });

    When(/^I try to register the student "([^\"]*)" with CPF "(\d*)"$/, async (name, cpf) => {
        await $("input[name='namebox']").sendKeys(<string> name);
        await $("input[name='cpfbox']").sendKeys(<string> cpf);
        await element(by.buttonText('Adicionar')).click();
    });

    Then(/^I can see "([^\"]*)" with CPF "(\d*)" in the students list$/, async (name, cpf) => {
        var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
        await allalunos;
        var samenamecpf = allalunos.filter(elem => sameCPF(elem,cpf) && sameName(elem,name));
        await samenamecpf;
        await samenamecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
});
})

defineSupportCode(function ({ Given, When, Then }) {
    Given(/^estou na página de autoavaliacao$/, async () => {
        await browser.get("http://localhost:4200/autoavaliacao");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
    })

    Given(/^consigo ver o nome "([^\"]*)" na lista de nomes$/, async (name) => {
        var allalunos : ElementArrayFinder = element.all(by.name('alunolist2'));
        await allalunos;
        var samename = allalunos.filter(elem => sameName(elem,name));
        await samename;
        await samename.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });
    
    Given(/^a meta “([^\"]*)” esta com valor “([^\"]*)”$/, async (goal, value) => {
        var allmetas : ElementArrayFinder = element.all(by.name('"'+goal+'"'));
        await allmetas;
        var metas = allmetas.filter(elem =>
                                      elem.getText().then(text => text === value));
        await metas;
        await metas.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    When(/^mudo o valor do conceito “([^\"]*)” para “([^\"]*)”$/, async (goal, value) => {
        await $("input[name='"+goal+"']").sendKeys(<string> value);
    });

    When(/^salvo as mudancas realizadas$/, async () => {
        await element(by.buttonText('Salvar')).click();
    });

    Then(/^eu recebo uma mensagem de confirmação$/, async () => {
        var confirmationMessege : ElementArrayFinder = element.all(by.name('confirmationMessege'));
        await confirmationMessege;
        await confirmationMessege.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });
})

defineSupportCode(function ({ Given, When, Then }) {
    Given(/^estou na página do professor$/, async () => {
        await browser.get("http://localhost:4200/teacher");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        await $("a[name='alunos']").click();
    })

    When(/^vou para a pagina de auto avaliações discrepantes”$/, async (goal, value) => {
        await $("input[name='"+goal+"']").sendKeys(<string> value);
        await element(by.buttonText('discrepancias')).click();
    });

    Then(/^Then consigo ver que a “quantidade de alunos” tem valor “1(33% do total de alunos)”$/, async (tagName, value) => {
        var quantidadeAlunos : ElementArrayFinder = element.all(by.name("'"+tagName+"'"));
        await quantidadeAlunos.filter(elem =>
                                      elem.getText().then(text => text === value));
        await quantidadeAlunos.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

})

