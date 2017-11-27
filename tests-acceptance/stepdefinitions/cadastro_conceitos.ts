import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));



//scenario cadastro de avaliacao
defineSupportCode(function ({ Given, When, Then }) {
    Given(/^Eu estou na pagina de "([^\"]*)"$/, async (pageName) => {

    	await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        var con = element(by.name("conceitos"));
        await expect(con.getText()).toEqual(pageName).click();
    })
})