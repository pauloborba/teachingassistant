import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

defineSupportCode(function ({ Given, When, Then }) {
    Given(/^eu estou na página "Autoavaliação"/,async () => {
        await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        await $("a[name='autoavaliacao']").click();
    });

    When(/^eu preencher o campo [^\"]* com [^\"]*"$/, async(conceito, meta) => {
           await $("tr[name='conceito']").$("input[name=meta]").click();
    });

    When(/^eu tentar enviar uma autoavaliação$/, async()=>{
           await $("input[name='enviarAutoavaliacao']").click();
    });

    Then(/^serei redirecionado para a página inicial$/, async()=>{
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
    });

    Then(/^aparecerá uma mensagem de confirmação$/, async()=>{
        browser.ignoreSynchronization = true
        browser.switchTo().alert().accept();

    });

Then(/^aparecerá uma mensagem de erro$/, async()=>{
        await expect($("p[name='errormessage']").getText()).to.eventually.equal("Falta campos.");
    });

})
