import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

defineSupportCode(function ({ Given, When, Then }) {
    Given(/^estou na página Planilha de Avaliacao$/, async () => {
        await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        await $("a[name='auto-avaliacao']").click();
    });

    Given(/^as metas cadastradas são "([^0-9]*)", "([^0-9]*)", "([^0-9]*)" e "([^0-9]*)"$/, async (meta1, meta2, meta3, meta4) => {
        var allmetas = element.all(by.binding('metas'));
        await allmetas;
        await expect(allmetas.count()).toBe(4);
    });

    When(/^preencho a coluna "([^0-9]*)" com o conceito "([^0-9]*)" para a meta "([^0-9]*)"$/, async (coluna, conceito, meta) =>{
        await $("input[name = meta]").sendKeys(<string> conceito);
    });

    When(/^salvo a Planilha de Avaliacao$/, async () =>{
        await element(by.name('buttonSalvar')).click();
    });

    Then(/^uma mensagem de confirmação é exibida$/, async() => {
        await expect(element(by.binding('metaCadastrada')).isPresent()).toBe(true);
    });

    Then(/^vejo a célula correspondente a linha de "([^0-9]*)" e a coluna de "([^0-9]*)" destacada$/, async(meta) => {
        await expect($("input[name=meta]").getCssValue('color')).to.eventually.equal('red');
    });

    Then(/^um aviso sobre campo obrigatório é exibido$/, async() => {
        await expect(element(by.binding('campoObrigatorio')).isPresent()).toBe(true);
    });
    
    Given(/^estou na página dos professores$/, async () => {
        await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        await $("a[name='professor']").click();
    });
    Given(/^aluno de nome "([^0-9]*)" tirou "([^0-9]*)", "([^0-9]*)", "([^0-9]*)", "([^0-9]*)" e "([^0-9]*)" nas metas "([^0-9]*)", "([^0-9]*)", "([^0-9]*)", "([^0-9]*)”, "([^0-9]*)”$/, async (nome, conceito1, conceito2, conceito3, conceito4, conceito5, meta1, meta2, meta3, meta4, meta5) => {
        var allmetas = element.all(by.binding('metas'));
        await allmetas;
        await expect(allmetas.count()).toBe(5);
        var allconceitos = element.all(by.binding('conceitosProfessor'));
        await allconceitos;
        await expect(allconceitos.count()).toBe(5);
    });

    Given(/^aluno de nome "([^0-9]*)" se auto-avaliou com  "([^0-9]*)", "([^0-9]*)", "([^0-9]*)", "([^0-9]*)" e "([^0-9]*)" nas metas "([^0-9]*)", "([^0-9]*)", "([^0-9]*)", "([^0-9]*)”, "([^0-9]*)”$/, async (nome, conceito1, conceito2, conceito3, conceito4, conceito5, meta1, meta2, meta3, meta4, meta5) => {
        var allmetas = element.all(by.binding('metas'));
        await allmetas;
        await expect(allmetas.count()).toBe(5);
        var allconceitos = element.all(by.binding('conceitosAuto'));
        await allconceitos;
        await expect(allconceitos.count()).toBe(5);
    });

      When(/^vou para a página Estatísticas Auto-avaliação$/, async () =>{
      await $("a[name='estatisticas']").click();
    });

     Then(/^vejo "([0-9]*)" em quantidade de alunos com auto-avaliações discrepantes$/, async(qnt) => {
        await expect($("td[name=quantidade]").getText()).to.eventually.equal(qnt);
    });
    Then(/^vejo "([0-9]*)"% em percentual$/, async(number) => {
        await expect($("td[name=percentual]").getText()).to.eventually.equal(number);
    });
     Then(/^vejo a lista de alunos vazia$/, async() => {
        var allalunos = element.all(by.binding('discrepantes'));
        await allalunos;
        await expect(allalunos.count()).toBe(0);
    });
    Then(/^vejo o nome do aluno “([^0-9]*)” na lista de alunos$/, async() => {
        var allalunos = element.all(by.binding('discrepantes'));
        await allalunos;
        await expect(allalunos.count()).toBe(1);
    });


})
