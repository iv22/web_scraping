Given("I have few Content Types") do
  FactoryBot.create(:content_type, :article)
  FactoryBot.create(:content_type, :vacancy)
end

Given( "I select the 'Onliner' option") do
  choose('onliner')
end

When("I fill 'Onliner' form") do
  click_button 'Собрать данные' 
end
   
Then("I should start 'Onliner' scraping process") do
  expect(page).to have_content('Onliner process is running at')
end

Given( "I select the 'RabotaBy' option") do
  choose('rabotaby')
end

When("I fill 'RabotaBy' form") do
  fill_in 'rabotaby_keyword', with: 'ruby'
  click_button 'Собрать данные' 
end
   
Then("I should start 'RabotaBy' scraping process") do
  expect(page).to have_content('RabotaBy process is running at')
end