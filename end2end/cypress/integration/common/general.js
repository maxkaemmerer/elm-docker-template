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

When(/^I open tab "([^"]*)"$/, function (tab) {
    cy.get('#' + tab).click();
});