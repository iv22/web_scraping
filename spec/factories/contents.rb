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
FactoryBot.define do
  factory :content do    
    transient do
      year { 2021 }
      mood { -4.53044300237 }
    end

    actual_date { Date.new(year, 1, 15) }
    resource  { Faker::Internet.domain_name }    
    url { Faker::Internet.url }
    association :content_type, factory: :content_type
   
    trait :onliner do      
      resource { "people.onliner.by" }      
      body {{\
        "author": "Анна Бонд",\
        "text_mood": mood,\
        "words_frequency":\
        {\
          "ruby": 2,\
          "on": 1,\
          "rails": 1,\
          "b1": 1,\
          "postgresql": 1,\
          "должен": 4,\
          "владеть": 3\
        }\
      }}
      association :content_type, factory: [:content_type, :article]
    end 

    trait :rabotaby do
      resource { "rabota.by" }
      body {{\
        "company": "Рога и копыта",\
        "words_frequency":\
        {\
          "ruby": 2,\
          "on": 1,\
          "rails": 1,\
          "b1": 1,\
          "postgresql": 1,\
          "должен": 4,\
          "владеть": 3\
        }\
      }}
      association :content_type, factory: [:content_type, :vacancy]
    end
  end
end
