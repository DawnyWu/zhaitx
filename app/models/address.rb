# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  university   :string(255)
#  campus       :string(255)
#  location     :string(255)
#  user_name    :string(255)
#  phone_number :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Address < ActiveRecord::Base
end
