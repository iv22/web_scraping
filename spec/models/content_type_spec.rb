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
require 'rails_helper'

RSpec.describe ContentType, type: :model do  
  # Associations
  it { is_expected.to have_many :contents }

  # Columns
  it { is_expected.to have_db_column(:name).of_type(:string) }

  # Validations
  it { is_expected.to validate_presence_of :name }
end
