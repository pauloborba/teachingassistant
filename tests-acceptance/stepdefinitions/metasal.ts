import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

defineSupportCode(function ({ Given, When, Then }) {
    Given(/^eu estou na página autoavaliação$/,async () => {
        await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        await $("a[name='autoavaliacao']").click();
    });

    When(/^eu estiver logado com cpf "(\d*)"$/,async (cpf) => {
        await $("input[id='cpfbox']").sendKeys(<string> cpf);
    });

    When(/^eu preencher o campo "([^\"]*)" com "([^\"]*)"$/, async(conceito, meta) => {
           await element(by.name(<string> conceito)).element(by.id(<string> meta)).click();
    });

    When(/^eu tentar enviar a autoavaliação$/, async()=>{
           await element(by.name('enviarAutoavaliacao')).click();
    });

    Then(/^aparecerá uma mensagem de confirmação$/, async()=>{
        browser.ignoreSynchronization = true;
        browser.switchTo().alert().accept();

    });

Then(/^aparecerá uma mensagem de erro$/, async()=>{
        browser.ignoreSynchronization = true;
        browser.get('URL');
        browser.switchTo().alert().accept();
    });

})
