# == Schema Information
#
# Table name: platforms
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Platform < ApplicationRecord
  has_one :client
  has_one :executor
  has_many :orders

  validates_presence_of :name
  validates_uniqueness_of :name
end
