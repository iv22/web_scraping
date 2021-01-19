# == Schema Information
#
# Table name: contents
#
#  id              :bigint           not null, primary key
#  actual_date     :date             not null
#  actual_year     :integer
#  body            :jsonb
#  resource        :string(60)
#  url             :string(500)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  content_type_id :bigint
#
# Indexes
#
#  index_contents_on_body             (body) USING gin
#  index_contents_on_content_type_id  (content_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_type_id => content_types.id)
#
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
