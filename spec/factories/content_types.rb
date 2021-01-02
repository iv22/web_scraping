FactoryBot.define do
  factory :content_type do    
    name { Faker::Job.field }

    trait :article do
      name { "article" }
    end

    trait :vacancy do
      name { "job vacancy" }
    end
  end
end