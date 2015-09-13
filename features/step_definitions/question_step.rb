Given(/^App installed$/) do
  FactoryGirl.create(:user)
end

Given(/^I am logged as admin$/) do
  visit root_path
  fill_in 'user_email', with: 'admin@example.org'
  fill_in 'user_password', with: 'password'
  click_button 'Log in'
  page.has_content?('Signed in successfully')
end

Given(/^I am on "(.*?)" page$/) do |page|
  visit "/#{page.tr(' ', '/')}"
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field, with: value
end

When(/^I choose "(.*?)"$/) do |field|
  choose field
end

When(/^I check "(.*?)"$/) do |field|
  find(:css, "##{field}").set(true)
end

When(/^I press "(.*?)"$/) do |button|
  click_button button
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end
