RSpec.shared_context 'shared content data', shared_context: :metadata do
  let(:data_headers) { ['Год', 'Коэффициент'] }
  let(:data_expected) { ['2021', -4.53044300237] }

  def create_onliner_content
    FactoryBot.create(:content, :onliner, year: Integer(data_expected[0]), mood: data_expected[1])
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'shared content data', include_shared: true
end
