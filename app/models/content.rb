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
  belongs_to :content_type

  scope :onliner, -> { where(resource: 'people.onliner.by') }
  scope :rabotaby, -> { where(resource: 'rabota.by') }

  def self.onliner_mood_by_year
    data = [["Год", "Коэффициент"]]
    Content.onliner.select("actual_year, avg((body -> 'text_mood')::numeric) as mood").
      group("actual_year").order(:actual_year).
      each { |row| data << [row["actual_year"].to_s, Float(row["mood"])] }
    data  
  end  
end
