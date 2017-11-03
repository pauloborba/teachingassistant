import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sameCPF = ((elem, cpf) => elem.element(by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(by.name('nomelist')).getText().then(text => text === name));
let sameMeta = ((elem, metaname, meta) => elem.element(by.name(metaname)).getAttribute('ng-reflect-model').then(attr => attr === meta));
let emptyField = ((elem, field) => elem.element(by.name(field)).getAttribute('ng-reflect-model').then(attr => {//!attr));
    if (attr) {
	return attr.length === 0;
    } else {
	return true;
    }
}, function() {
    return true
}));

defineSupportCode(function ({ Given, When, Then }) {
    Given(/^I am at the discrepancias page$/, async() => {
	await browser.get("http://localhost:4200/");
	await expect(browser.getTitle()).to.eventually.equal('TaGui');
	await $("a[name='discrepancias']").click();
    })

    Given(/^I can see the student "(.*)" with goals "(.*)", "(.*)", "(.*)", "(.*)", "(.*)"$/, async(name, goal1, goal2, goal3, goal4, goal5) => {
	var arr = [];
	arr.push(goal1);
	arr.push(goal2);
	arr.push(goal3);
	arr.push(goal4);
	arr.push(goal5);
	var allnames : ElementArrayFinder = element.all(by.name('namelist'));
	await allnames;
	var samenames = allnames.filter(elem => elem.getText().then(text => text === name));
	await samenames;
	await samenames.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
	// garantindo que vejo as metas que devo ver em pedro
	for (var i = 0; i < 5; i+= 1) {
	    await expect(sameMeta(samenames.first(), 'goal' + i, arr[i])).to.eventually.equal(true);
	}
    });

    Given(/^"(.*)" has self-evaluated himself with "(.*)", "(.*)", "(.*)", "(.*)", "(.*)"$/, async(name, goal1, goal2, goal3, goal4, goal5) => {
	var arr = [];
	arr.push(goal1);
	arr.push(goal2);
	arr.push(goal3);
	arr.push(goal4);
	arr.push(goal5);

	var allnames : ElementArrayFinder = element.all(by.name('namelist'));
	await allnames;
	var samenames = allnames.filter(elem => elem.getText().then(text => text === name));
	await samenames;
	await samenames.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
	// garantindo que vejo as metas que devo ver em pedro auto-avaliado
	for (var i = 0; i < 5; i+= 1) {
	    await expect(sameMeta(samenames.first(), 'selfgoal' + i, arr[i])).to.eventually.equal(true);
	}
    });

    Then(/^I can see the list alunos discrepantes as empty$/, async() => {
	var discrepanteslist : ElementArrayFinder = element.all(by.name('discrepanteslist'));
	await discrepanteslist;

	await discrepanteslist.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    });

    Then(/^I can see "(\d*)" in total de alunos discrepantes$/, async(total) => {
	var tot = element(by.name('discrepantetotal'));
	await tot;

	await expect(tot.getText().then(text => text === total)).to.eventually.equal(true);
    });

    Then(/^I can see "(\d*)"% in porcentagem de alunos discrepantes$/, async(pctg) => {
	var pc = element(by.name('pctgtotal'));
	await pc;
	await expect(pc.getText().then(text => text === pctg)).to.eventually.equal(true);
    });

    Then (/^I can see the list alunos discrepantes with only "(.*)"$/, async(name) => {
	var discrepanteslist : ElementArrayFinder = element.all(by.name('discrepanteslist'));
	await discrepanteslist;

	await discrepanteslist.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));

	var samenames = discrepanteslist.filter(elem => elem.getText().then(text => text === name));
	await samenames;
	await samenames.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    });

    Then (/^I can see "(.*)" below the list.$/, async (msg) => {
	var mensagem = element(by.name('mensagem'));
	await mensagem;

	await expect(mensagem.getText().then(text => text === msg)).to.eventually.equal(true);
    });

})
