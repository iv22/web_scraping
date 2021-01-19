require 'rails_helper'
require 'shared_content'

RSpec.describe Content, type: :model do
  include_context 'shared content data'

  # Associations
  it { is_expected.to belong_to :content_type }

  # Columns
  it { is_expected.to have_db_column(:url).of_type(:string) }
  it { is_expected.to have_db_column(:resource).of_type(:string) }
  it { is_expected.to have_db_column(:body).of_type(:jsonb) }
  it { is_expected.to have_db_column(:actual_date).of_type(:date) }
  it { is_expected.to have_db_column(:actual_year).of_type(:integer) }

  # Validations
  it { is_expected.to validate_presence_of :url }
  it { is_expected.to validate_presence_of :resource }
  it { is_expected.to validate_presence_of :body }
  it { is_expected.to validate_presence_of :actual_date }

  before do
    create_onliner_content
  end

  it '::onliner_mood_by_year' do
    expect(Content.onliner_mood_by_year).to eq([data_headers, data_expected])
  end
end
