import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
import { async } from 'q';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

defineSupportCode(function ({ Given, When, Then }) {
    Given('estou na página de metas', async() => {
        await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        await $("a[name='metas']").click();
    });

    Given('não posso ver a meta de nome {stringInDoubleQuotes}', async (nomeDaMeta) => {
        var metas: ElementArrayFinder = element.all(by.name('metas'));
        await metas;
        var metasEncontradas = metas.filter(elem => elem.getText().then(text => text === nomeDaMeta));
        await metasEncontradas;
        await metasEncontradas.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    });

    Given('não posso ver a meta de nome ""', async () => {
        var metas: ElementArrayFinder = element.all(by.name('metas'));
        await metas;
        var metasEncontradas = metas.filter(elem => elem.getText().then(text => text === ""));
        await metasEncontradas;
        await metasEncontradas.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    });

    When('preencho o nome da meta com ""', async () => {
        await $("input[name='nomeDaMeta']").sendKeys(<string>"");
    });

    When('preencho o nome da meta com {stringInDoubleQuotes}', async (nomeDaMeta) => {
        await $("input[name='nomeDaMeta']").sendKeys(<string>nomeDaMeta);
    });

    Then('posso ver a meta de nome {stringInDoubleQuotes} listada apenas {int} vez', async (nomeDaMeta, qtdMeta) => {
        var metas: ElementArrayFinder = element.all(by.name('metas'));
        var qtdStr = <string>qtdMeta;
        await metas;
        var metasEncontradas = metas.filter(elem => elem.getText().then(text => text === nomeDaMeta));
        await metasEncontradas;
        await metasEncontradas.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(+qtdStr));
    });

    When('confirmo a criação', async () => {
        await element(by.buttonText('Criar')).click();
    });

    When('seleciono a opção {stringInDoubleQuotes} da meta de nome {stringInDoubleQuotes}', async (acao, nomeDaMeta) => {
        var el = element(by.cssContainingText('.meta', <string>nomeDaMeta));
        await el;
        await el.element(by.buttonText(<string>acao)).click();
        // await element(by.buttonText(<string>acao)).click();
    });

});