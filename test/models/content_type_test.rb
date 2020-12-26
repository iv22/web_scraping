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
require 'test_helper'

class ContentTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
