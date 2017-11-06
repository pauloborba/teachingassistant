import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

defineSupportCode(function ({ Given, When, Then }) {
    
    Given(/^I am at the Autoavaliacao page$/, async () => {
        await browser.get("http://localhost:4200/autoavaliacao");
        await expect(browser.getTitle()).to.eventually.equal('Autoavaliacao');
    })

    Given(/^I have completed my self assessment for the goals Entender conceitos de requisitos, Especificar requisitos com qualidade, and Entender conceitos de gerencia de configuracao with the concepts MA, MPA, and MANA respectively$/, async () => {
        await $("input[name='entenderRequisitos']").sendKeys(<string> 'MA');
        await $("input[name='qualidadeRequisitos']").sendKeys(<string> 'MPA');
        await $("input[name='entenderGerenciamento']").sendKeys(<string> 'MANA');
    });

    Given(/^I have completed my self assessment for the goals Entender conceitos de requisitos and Especificar requisitos com qualidade with the concepts MA and MPA respectively$/, async () => {
        await $("input[name='entenderRequisitos']").sendKeys(<string> 'MA');
        await $("input[name='qualidadeRequisitos']").sendKeys(<string> 'MPA');
    });

    When(/^I press the submit button$/, async () => {
        await element(by.buttonText('Enviar')).click();
    });

    Then(/^I can see a confirmation message$/, async () => {
        await $("label[name='result']").getText().then(text => text = 'Ok');
    });

    Then(/^I can see an error message$/, async () => {
        await $("label[name='result']").getText().then(text => text = 'Error');
    });
})