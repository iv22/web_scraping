When ('I visit chart page') do
  visit onliner_mood_index_path
end

Then ('I should see histogram chart') do
  expect(page).to have_content('Результаты анализа')
end
