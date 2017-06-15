# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  url_id     :string           not null
#  topic_id   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
