import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';

Given(/^I am on page "([^"]*)"$/, function (page) {
    return cy.visit(page);
});

Then(/^I see text "([^"]*)" in body$/, function (text) {
    cy.get('body').contains(text);
    cy.screenshot();
});

Then(/^I do not see text "([^"]*)" in body$/, function (text) {
    cy.get('body').contains(text).should('not.exist');
    cy.screenshot();
});

When(/^I click increment$/, function () {
    cy.get('button:nth-of-type(1)').click();
});

When(/^I click decrement$/, function () {
    cy.get('button:nth-of-type(2)').click();
});