# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  address_id :integer
#  remark     :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
