import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sameCPF = ((elem, cpf) => elem.element(by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(by.name('nomelist')).getText().then(text => text === name));

let pAND = ((p,q) => p.then(a => q.then(b => a && b)))

defineSupportCode(function ({ Given, When, Then }) {
    Given(/^I am at the students page$/, async () => {
        await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        await $("a[name='alunos']").click();
    })

    Given(/^I cannot see a student with CPF "(\d*)" in the students list$/, async (cpf) => {
        var allcpfs : ElementArrayFinder = element.all(by.name('cpflist'));
        var samecpfs = allcpfs.filter(elem =>
                                      elem.getText().then(text => text === cpf));
        await samecpfs.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    });

    When(/^I try to register the student "([^\"]*)" with CPF "(\d*)"$/, async (name, cpf) => {
        await $("input[name='namebox']").sendKeys(<string> name);
        await $("input[name='cpfbox']").sendKeys(<string> cpf);
        await element(by.buttonText('Adicionar')).click();
    });

    Then(/^I can see "([^\"]*)" with CPF "(\d*)" in the students list$/, async (name, cpf) => {
        var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
        await allalunos.filter(elem => pAND(sameCPF(elem,cpf),sameName(elem,name))).then
                   (elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    Given(/^I can see a student with CPF "(\d*)" in the students list$/, async (cpf) => {
        await $("input[name='namebox']").sendKeys(<string> "Clarissa");
        await $("input[name='cpfbox']").sendKeys(<string> cpf);
        await element(by.buttonText('Adicionar')).click();
        var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
        await allalunos.filter(elem => sameCPF(elem,cpf)).then
                   (elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    Then(/^I cannot see "([^\"]*)" with CPF "(\d*)" in the students list$/, async (name, cpf) => {
        var allcpfs : ElementArrayFinder = element.all(by.name('alunolist'));
        var samecpfs = allcpfs.filter(elem => pAND(sameCPF(elem,cpf),sameName(elem,name)));
        await samecpfs.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    });

    Then(/^I can see an error message$/, async () => {
        var allalunos : ElementArrayFinder = element.all(by.name('msgcpfexistente'));
        await allalunos.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });


    Given(/^I can see the student "([^\"]*)" with CPF "(\d*)" in the students list$/, async (name, cpf) => {
        await $("input[name='namebox']").sendKeys(<string> name);
        await $("input[name='cpfbox']").sendKeys(<string> cpf);
        await element(by.buttonText('Adicionar')).click();
        var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
        await allalunos.filter(elem => pAND(sameCPF(elem,cpf),sameName(elem,name))).then
                   (elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    When(/^I try to delete the student "([^\"]*)" with CPF "(\d*)"$/, async (name, cpf) => {
        await $(`button[name=delete_${cpf}_${name}]`).click();
    });

    Then(/^I cannot see the student "([^\"]*)" with CPF "(\d*)" in the students list$/, async (name, cpf) => {
        var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
        await allalunos.filter(elem => pAND(sameCPF(elem,cpf),sameName(elem,name))).then
                   (elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    });
})
