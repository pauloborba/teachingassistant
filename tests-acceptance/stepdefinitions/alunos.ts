import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
import { async } from 'q';
import {HttpClient} from "protractor-http-client"

let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

let sameCPF = ((elem, cpf) => elem.element(by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(by.name('nomelist')).getText().then(text => text === name));

let pAND = ((p,q) => p.then(a => q.then(b => a && b)))

let serverURL = "http://localhost:3000";
let guiURL = "http://localhost:4200/";
const http = new HttpClient(serverURL);


defineSupportCode(function ({ Given, When, Then }) {
    Given(/^I am at the "([^\"]*)" page$/, async (page) => {
        await browser.get(guiURL + page);
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
    })

    Given(/^I cannot see a student with CPF "(\d*)" in the students list$/, async (cpf) => {
        var allcpfs : ElementArrayFinder = element.all(by.name('cpflist'));
        await allcpfs;
        
        var samecpfs = allcpfs.filter(elem => elem.getText().then(text => text === cpf));
        await samecpfs;
        
        await samecpfs.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    });

    Given(/^I can see a student with CPF "(\d*)" in the students list$/, async (cpf) => {
        var allcpfs : ElementArrayFinder = element.all(by.name('cpflist'));
        await allcpfs;

        var samecpfs = allcpfs.filter(elem => elem.getText().then(text => text === cpf));
        await samecpfs;
        
        await samecpfs.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    Given(/^The student with CPF "(\d*)" is in the students list$/, async (cpfAluno) => {    
        var cpfAlunoOnly;

        // Get student list
        await browser.get(serverURL + "/alunos");     
       
        // Get page source and retrieves aluno list from html body
        await browser.getPageSource().then(function(res) {        
            var bodyHtml = /<body.*?>([\s\S]*)<\/body>/.exec(res)[1];
            cpfAlunoOnly = JSON.parse(bodyHtml).filter(({cpf}) => cpf == cpfAluno);
        });

        // There should be one student with the given cpf
        await expect(cpfAlunoOnly.length).equal(1);
    });

    Given(/^The student with CPF "([^\"]*)" is not in the students list$/, async (cpfAluno) => {
        var cpfAlunoOnly;

        // Get student list
        await browser.get(serverURL + "/alunos");     
       
        // Get page source and retrieves aluno list from html body
        await browser.getPageSource().then(function(res) {        
            var bodyHtml = /<body.*?>([\s\S]*)<\/body>/.exec(res)[1];
            cpfAlunoOnly = JSON.parse(bodyHtml).filter(({cpf}) => cpf == cpfAluno);
        });

        // There should be one student with the given cpf
        await expect(cpfAlunoOnly.length).equal(0);
    });

    When(/^I try to register the student "([^\"]*)" with CPF "(\d*)"$/, async (name, cpf) => {
        await $("input[name='namebox']").sendKeys(<string> name);
        await $("input[name='cpfbox']").sendKeys(<string> cpf);
        await $("button[name='BtnAdicionar']").click();
    });

    When(/^I try to remove the student with CPF "([^\"]*)" from the students list$/, async(cpfAluno) => {
        // Delete student with "cpfAluno" cpf
        await browser.get(serverURL + "/aluno/delete/" + cpfAluno);
    });

    When(/^I grade the student with CPF "([^\"]*)" with "([^\"]*)" at "([^\"]*)" and "([^\"]*)" at "([^\"]*)"$/, async (cpf, grade1, meta1, grade2, meta2) => {
        await $("input[ng-reflect-name='" + meta1 + cpf + "']").sendKeys(<string> grade1);
        await $("input[ng-reflect-name='" + meta2 + cpf + "']").sendKeys(<string> grade2);
        await $("input[ng-reflect-name='" + meta1 + cpf + "']").sendKeys(<string> grade1);
    });

    When(/^Reload the "([^\"]*)" page$/, async (page) => {
        await browser.get(guiURL + page);
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
    });

    Then(/^I try to remove the student "([^\"]*)" with CPF "(\d*)"$/, async (name, cpf) => {
        var elem = "button[name='" + cpf + "']";
        await $(elem).click();
    });

    Then(/^I can see "([^\"]*)" with CPF "(\d*)" in the students list$/, async (name, cpf) => {
        var allcpfs : ElementArrayFinder = element.all(by.name('cpflist'));
        await allcpfs;
        
        var samecpfs = allcpfs.filter(elem => elem.getText().then(text => text === cpf));
        await samecpfs;
        
        await samecpfs.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });
    
    Then(/^I cannot see "([^\"]*)" with CPF "(\d*)" in the students list$/, async (name, cpf) => {
        var allcpfs : ElementArrayFinder = element.all(by.name('cpflist'));
        await allcpfs;
        
        var samecpfs = allcpfs.filter(elem => elem.getText().then(text => text === cpf));
        await samecpfs;
        
        await samecpfs.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    });

    Then(/^The system erases the student with CPF "([^\"]*)" from the students list$/, async (cpfAluno) => {
        var cpfAlunoOnly;

        // Get student list
        await browser.get(serverURL + "/alunos");

        // Get page source and retrieves aluno list from html body
        await browser.getPageSource().then(function(res) {        
            var bodyHtml = /<body.*?>([\s\S]*)<\/body>/.exec(res)[1];
            cpfAlunoOnly = JSON.parse(bodyHtml).filter(({cpf}) => cpf == cpfAluno);
        });

        // There should be no student with the given cpf
        await expect(cpfAlunoOnly.length).equal(0);
    });

    Then(/^The system does not add the student with CPF "([^\"]*)" to the students list$/, async (cpfAluno) => {
        var cpfAlunoOnly;

        // Get student list
        await browser.get(serverURL + "/alunos");

        // Get page source and retrieves aluno list from html body
        await browser.getPageSource().then(function(res) {        
            var bodyHtml = /<body.*?>([\s\S]*)<\/body>/.exec(res)[1];
            cpfAlunoOnly = JSON.parse(bodyHtml).filter(({cpf}) => cpf == cpfAluno);
        });

        // There should be no student with the given cpf
        await expect(cpfAlunoOnly.length).equal(0);
    });

    Then(/^I can still see "([^\"]*)" at "([^\"]*)" and "([^\"]*)" at "([^\"]*)" of the student with CPF "([^\"]*)"$/, async (grade1, meta1, grade2, meta2, cpf) => {
        await $("input[ng-reflect-name='" + meta1 + cpf + "']").getAttribute('value').then(function(res) {
            expect(res).equal(grade1);
        });
        await $("input[ng-reflect-name='" + meta2 + cpf + "']").getAttribute('value').then(function(res) {
            expect(res).equal(grade2);
        });

    });
})
