# == Schema Information
#
# Table name: content_types
#
#  id         :bigint           not null, primary key
#  name       :string(50)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_content_types_on_name  (name) UNIQUE
#
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
