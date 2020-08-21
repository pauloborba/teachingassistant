import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sameCPF = ((elem, cpf) => elem.element(by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(by.name('nomelist')).getText().then(text => text === name));
let sameEmail = ((elem, email) => elem.element(by.name('emaillist')).getText().then(text => text === email));

let pAND = ((p,q) => p.then(a => q.then(b => a && b)))

interface IStudent {
    name?: string;
    cpf: string;
    email?: string;
}

async function goToPage(page: string): Promise<void>{
    await browser.get("http://localhost:4200/");
    await expect(browser.getTitle()).to.eventually.equal('TaGui');
    switch(page){
        case 'Students':{
            await $("a[name='alunos']").click();
            break;
        }
        case 'Metas':{
            await $("a[name='metas']").click();
            break;
        }
        default:{
            break;
        }
    }
}

async function registerStudent({name = "Victor", cpf, email = "victor@email.com"}: IStudent): Promise<void>{
    await $("input[name='namebox']").sendKeys(name);
    await $("input[name='cpfbox']").sendKeys(cpf);
    await $("input[name='emailbox']").sendKeys(email);
    await $("button[name='addStudentButton']").click();
}

async function removeStudent({name = "Victor", cpf, email = "victor@email.com"}: IStudent): Promise<void>{
    const allStudents = element.all(by.name("alunolist"));
    const student = allStudents.filter(elem => pAND(sameCPF(elem, cpf), sameName(elem, name)));
    const webElements = await student.getWebElements();
    const removeButton = await webElements[0].findElement(by.tagName('button'));
    await removeButton.click();
}

async function assertTamanhoEqual(set,qtt) {
    await set.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(qtt));
}

async function assertElementsWithSameCPFAndName(qtt,cpf,name) { 
    var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
    var samecpfsandname = allalunos.filter(elem => pAND(sameCPF(elem,cpf),sameName(elem,name)));
    await assertTamanhoEqual(samecpfsandname,qtt);
}

async function assertElementsWithSameCPF(qtt,cpf) {
    var allalunos : ElementArrayFinder = element.all(by.name('alunolist'));
    var samecpfs = allalunos.filter(elem => sameCPF(elem,cpf));
    await assertTamanhoEqual(samecpfs,qtt); 
}

defineSupportCode(function ({ Given, When, Then }) {
    Given(/^I am at the "([^\"]*)" page$/, async (page) => {
        page = page.toString();
        await goToPage(page);
    })

    Given(/^I cannot see a student with CPF "(\d*)" in the students list$/, async (cpf) => {
        await assertElementsWithSameCPF(0, cpf);    
    }); 

    Given(/^I can see the student "([^\"]*)" with CPF "(\d*)" in the students list$/, async (name, cpf) => {
        await registerStudent({name: name.toString(), cpf: cpf.toString()});
        await assertElementsWithSameCPFAndName(1, cpf, name);
    });

    When(/^I try to register the student "([^\"]*)" with CPF "(\d*)"$/, async (name, cpf) => {
        name = name.toString();
        cpf = cpf.toString();
        await registerStudent({name,cpf});
    });

    When(/^I try to remove the student "([^\"]*)" with CPF "(\d*)"$/, async (name, cpf) => {
        name = name.toString();
        cpf = cpf.toString();
        await removeStudent({name, cpf});
    });
    
    Then(/^I can see "([^\"]*)" with CPF "(\d*)" in the students list$/, async (name, cpf) => {
        await assertElementsWithSameCPFAndName(1, cpf, name);
    });

    Then(/^I cannot see a student with CPF "(\d*)" registered$/, async (cpf) => {
        await assertElementsWithSameCPF(0, cpf);
    });
})
