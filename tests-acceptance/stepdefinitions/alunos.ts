import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

let sameCPF = ((elem, cpf) => elem.element(by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(by.name('nomelist')).getText().then(text => text === name));

let pAND = ((p,q) => p.then(a => q.then(b => a && b)))

defineSupportCode(function ({ Given, When, Then }) {
    Given(/^I am at the students page$/, async () => {
        await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('TaGui');
        await $("a[name='alunos']").click();
    })

    Given(/^I cannot see a student with CPF "(\d*)" in the students list$/, async (cpf) => {
        var allcpfs : ElementArrayFinder = element.all(by.name('cpflist'));
        await allcpfs;
        var samecpfs = allcpfs.filter(elem =>
                                      elem.getText().then(text => text === cpf));
        await samecpfs;
        await samecpfs.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    });

    When(/^I try to register the student "([^\"]*)" with CPF "(\d*)"$/, async (name, cpf) => {
        await $("input[name='namebox']").sendKeys(<string> name);
        await $("input[name='cpfbox']").sendKeys(<string> cpf);
        await element(by.buttonText('Adicionar')).click();
    });

    Then(/^I can see "([^\"]*)" with CPF "(\d*)" in the students list$/, async (name, cpf) => {
        var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
        allalunos.filter(elem => pAND(sameCPF(elem,cpf),sameName(elem,name))).then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    Given(/^I am at the register students page$/, async () => {
        await browser.get("http://localhost:4200/");
        await expect(browser.getTitle()).to.eventually.equal('NASE');
        await $("a[name='Registrar alunos']").click();
    })

    Given(/^"([^\"]*)" already had an appointment before$/, async (name) => {
        var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
        allalunos.filter(elem => sameName(elem,name)).then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    Given(/^"([^\"]*)"´s course is "([^\"]*)"$/, async (name, course) => {
        var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
        allalunos.filter(elem => pAND(sameCourse(elem,course),sameName(elem,name))).then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    Given(/^"([^\"]*)"´s CPF is "([^\"]*)"$/, async (name, cpf) => {
        var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
        allalunos.filter(elem => pAND(sameCPF(elem,cpf),sameName(elem,name))).then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    Given(/^"([^\"]*)"´s gender is "([^\"]*)"$/, async (name, gender) => {
        var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
        allalunos.filter(elem => pAND(sameGender(elem,gender),sameName(elem,name))).then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    Given(/^"([^\"]*)"´s telephone number is "([^\"]*)"$/, async (name, tnumber) => {
        var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
        allalunos.filter(elem => pAND(sameTnumber(elem,tnumber),sameName(elem,name))).then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    When(/^I select the "([^\"]*)" option$/, async (buttonName) => {
        await element(by.buttonText(<string> buttonName)).click();
    });

    When(/^I select "([^\"]*)" at the students database page$/, async (studentName) => {
        await element(by.buttonText(<string> studentName)).click();
    });

    Then(/^I can see the name "([^\"]*)", course "([^\"]*)", CPF "([^\"]*)", gender "([^\"]*)" and telephone number "([^\"]*)" at the register student page$/, async (name, course, cpf, gender, tnumber) => {
        var allappointment : ElementArrayFinder = element.all(by.name('appointmentlist'));
        allappointment.filter(elem => pAND(sameCPF(elem,cpf),sameName(elem,name),sameTnumber(elem,tnumber),sameGender(elem,gender),sameCourse(elem,course))).then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    Given(/^No professional has been chosen$/, async () => {
        var professional : ElementArrayFinder = element.all(by.name('professional'));
        professional.filter(elem => sameName(elem,'Selecione o profissional')).then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });
    
    When(/^I ask the system to register$/, async () => {
        await request.post(base_url + "agendamento").then(body =>
        expect(body).to.include('failure')).catch(e =>
        expect(e).equal(null));
    });

    Then(/^I can see the error message$/, async () => {
        var errorMessage : ElementArrayFinder = element.all(by.name('errorMessage'));
        errorMessage.filter(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });
})
