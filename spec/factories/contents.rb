FactoryBot.define do
  factory :content do    
    actual_date { Date.new(2021,1,15) }
    resource  { Faker::Internet.domain_name }    
    url { Faker::Internet.url }
    association :content_type, factory: :content_type
   
    trait :onliner do
      resource { "people.onliner.by" }      
      association :content_type, factory: [:content_type, :article]
    end 

    trait :rabotaby do
      resource { "rabota.by" }
      association :content_type, factory: [:content_type, :vacancy]
    end
  end
end