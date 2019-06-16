import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;


defineSupportCode(function ({ Given, When, Then}) {

Given(/^estou no menu de "([^\"]*)"$/, async (menu) => {
    	await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        await $("a[name='metas']").click();
       });

Given(/^o aluno "([^\"]*)" está registrado no sistema com o login"([^\"]*)", CPF  "(\d*)" e email "([^\"]*)"$/, async(aluno, login, CPF, email) => {
         
       });

Given(/^esse email é inválido $/, async() => {
         
       });

When(/^eu altero o conceito para "([^\"]*)" da meta "([^\"]*)"$/, async(conceito, meta) => {
         
       });

When(/^seleciono a opção de "([^\"]*)"$/, async(opcao) => {
         await element(by.buttonText("Notificar")).click();
       });

Then(/^não é enviado um email para "([^\"]*)" notificando sobre seu conceito na meta "([^\"]*)"$/, async(email, meta) => {
         
       });

Then(/^posso visualizar uma mensagem de "([^\"]*)" sinalizando um email inválido$/, async(mensagem) => {
         
       });
});