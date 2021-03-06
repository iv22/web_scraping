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
class Content < ApplicationRecord
  JSON_SCHEMA = Rails.root.join('db', 'schemas', 'content_json.schema').to_s

  belongs_to :content_type

  validates :resource, presence: true
  validates :actual_date, presence: true
  validates :url, presence: true, url: true
  validates :body, presence: true, json: { schema: JSON_SCHEMA }

  scope :onliner, -> { where(resource: 'people.onliner.by') }
  scope :rabotaby, -> { where(resource: 'rabota.by') }

  def self.onliner_mood_by_year
    data = [['Год', 'Коэффициент', 'Самая негативная', 'Самая позитивная']]
    Content.onliner.select("actual_year, avg((body -> 'text_mood')::numeric) as mood, 
        min((body -> 'text_mood')::numeric) as worst, max((body -> 'text_mood')::numeric) as better").
      group('actual_year').order(:actual_year).
      each { |row| data << [row['actual_year'].to_s, 
        Float(row['mood']).round(2),
        Float(row['worst']).round(2),
        Float(row['better']).round(2)] }
    data
  end
end
