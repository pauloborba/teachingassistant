import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

defineSupportCode(function ({ Given, When, Then }) {
    
    Given(/^I'm at the Discrepancy page$/, async () => {
        await browser.get("http://localhost:4200/discrepancy");
        await expect(browser.getTitle()).to.eventually.equal('Discrepancy');
    })

    Given(/^The student "([^\"]*)" has submitted his self assessment$/, async (name) => {
        var allnames : ElementArrayFinder = element.all(by.name('studentlist'));
        await allnames;
        var samenames = allnames.filter(elem => elem.getText().then(text => text === name));
        await samenames;
        await samenames.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    Given(/^The student "([^\"]*)" has 20% discrepancy$/, async (name) => {
        await browser.get("http://localhost:4200/discrepancy/" + name);
        await expect($("label[name='name']").getText()).to.eventually.equal(name);
        await expect($("label[name='discrepancy']").getText()).to.eventually.equal('20%');
    });

    Given(/^The student "([^\"]*)" has 30% discrepancy$/, async (name) => {
        await browser.get("http://localhost:4200/discrepancy/" + name);
        await expect($("label[name='name']").getText()).to.eventually.equal(name);
        await expect($("label[name='discrepancy']").getText()).to.eventually.equal('30%');
    });

    When(/^I press the button to show the discrepancies$/, async () => {
        await element(by.buttonText('Mostrar')).click();
    });

    Then(/^I can see an error message$/, async () => {
        await $("label[name='result']").getText().then(text => text = 'Error');
    });

    Then(/^I see a the name "([^\"]*)"$/, async (name) => {
        await expect($("label[name='result']").getText()).to.eventually.equal(name);
    });
})