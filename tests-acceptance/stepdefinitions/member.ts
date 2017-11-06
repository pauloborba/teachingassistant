import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

let sameCPF = ((elem, cpf) => elem.element(by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(by.name('nomelist')).getText().then(text => text === name));

defineSupportCode(function ({ Given, When, Then }) {
    Given(/^I am at the Members page$/, async () => {
        await browser.get("http://localhost:4200/members");
        await expect(browser.getTitle()).to.eventually.equal('Members');
    })

    Given(/^I cannot see a member with username "([^\"]*)"$/, async (name) => {
        await expect($("label[name='name']").getText()).to.eventually.not.equal(name);
    });

    When(/^I click to view the member list$/, async () => {
        await element(by.buttonText('Ver')).click();
    });

    Then(/^My member list contains member "([^\"]*)"$/, async (name) => {
        var allnames : ElementArrayFinder = element.all(by.name('namelist'));
        await allnames;
        var samenames = allnames.filter(elem => elem.getText().then(text => text === name));
        await samenames;
        await samenames.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });
})