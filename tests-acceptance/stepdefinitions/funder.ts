import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

let sameCPF = ((elem, cpf) => elem.element(by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(by.name('nomelist')).getText().then(text => text === name));

defineSupportCode(function ({ Given, When, Then }) {
    Given(/^I am at the Funders page$/, async () => {
        await browser.get("http://localhost:4200/funders");
        await expect(browser.getTitle()).to.eventually.equal('Funders');
    })

    Given(/^I cannot see a funder with code "(\d*)" in the funder list$/, async (code) => {
        var allcodes : ElementArrayFinder = element.all(by.name('codelist'));
        await allcodes;
        var samecodes = allcodes.filter(elem => elem.getText().then(text => text === code));
        await samecodes;
        await samecodes.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    });

    When(/^I try to register a funder with code "(\d*)"$/, async (code) => {
        await $("input[name='codebox']").sendKeys(<string> code);
        await element(by.buttonText('Adicionar')).click();
    });

    Then(/^I can see an ok message$/, async () => {
        await $("label[name='result']").getText().then(text => text = 'Ok');
    });
})
