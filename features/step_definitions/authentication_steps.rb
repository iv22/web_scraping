def fill_log_in_form
  fill_in 'admin_email', with: 'admin@mail.ru'
  fill_in 'admin_password', with: 'qwerty'
end

Given("I am a registered Admin") do
  @registered_admin = FactoryBot.create(:admin)
end 

Given("I visit the admin page") do
  visit admin_root_path
end

Given("I am logged in") do
  visit admin_root_path
  fill_log_in_form
  click_button 'Log in'
end

When("I fill login form") do
  fill_log_in_form
  click_button 'Log in'
end

Then("I should be logged in") do
  expect(page).to have_button(value: 'Собрать данные') 
end