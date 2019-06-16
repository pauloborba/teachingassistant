import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by, protractor } from 'protractor';
import { async } from 'q';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));
var EC = protractor.ExpectedConditions;

let sameCPF = ((elem, cpf) => elem.element(by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(by.name('nomelist')).getText().then(text => text === name));

let pAND = ((p,q) => p.then(a => q.then(b => a && b)))

var path = require('path');

defineSupportCode(function ({ Given, When, Then}) {
    Given(/^estou na pagina de alunos$/, async () => {
        await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        await $("a[name='alunos']").click();
    });
    
    When(/^eu escolho o arquivo "([^\"]*)"$/, async (arquivoName) => {
        const arquivo = './' + arquivoName;
        var ele = element(by.id('file-upload'));
        await browser.wait(EC.presenceOf(ele), 5000)
        const absolutePath = path.resolve(__dirname, arquivo);
        await ele.sendKeys(absolutePath);
        //await $("a[name='cadastrarCSV']").click();
    });

    When(/^eu escolho o arquivo "([^\"]*)" que contém o aluno "([^\"]*)" de CPF "(\d*)" já cadastrado$/, async (arquivoName, nome, cpf) => {
        const arquivo = './' + arquivoName;
        var ele = element(by.id('file-upload'));
        await browser.wait(EC.presenceOf(ele), 5000)
        const absolutePath = path.resolve(__dirname, arquivo);
        await ele.sendKeys(absolutePath);
        //await $("a[name='cadastrarCSV']").click();
    });

    Then(/^eu vejo o aluno "([^\"]*)" com seu CPF "(\d*)" na lista de alunos$/, async (name, cpf) => {
        var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
        allalunos.filter(elem => pAND(sameCPF(elem,cpf),sameName(elem,name))).then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    Then(/^eu vejo uma mensagem de erro$/, async () => {
        browser.wait(EC.alertIsPresent(), 1000);
            let ale = browser.switchTo().alert();
            ale.accept();
            ale.dismiss();
    });

})