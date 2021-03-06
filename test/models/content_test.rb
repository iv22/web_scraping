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
require 'test_helper'

class ContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
