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

class Order < ActiveRecord::Base
  belongs_to :address
  belongs_to :user

  validates :address_id,:user_id,presence: true
end
