import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';

Given(/^I am on page "([^"]*)"$/, function (page) {
    return cy.visit(page);
});

Then(/^I see text "([^"]*)" in body$/, function (text) {
    cy.get('body').contains(text);
    cy.screenshot();
});

Then(/^I see img with src "([^"]*)" in body$/, function (src) {
    cy.request({
        url: src,
        failOnStatusCode: false,
    }).then((resp) => {
        expect(resp.status).to.eq(200);
    });

    cy.get('body ')
        .find(`img[src="${src}"]`)
        .should('have.length', 1)
        .should('be.visible');
    cy.screenshot();
});

Then(/^I do not see text "([^"]*)" in body$/, function (text) {
    cy.get('body').contains(text).should('not.exist');
    cy.screenshot();
});

When(/^I open tab "([^"]*)"$/, function (tab) {
    cy.get('#' + tab).click();
});