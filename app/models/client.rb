# == Schema Information
#
# Table name: clients
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Client < ApplicationRecord
  has_many :platformings, as: :user
  has_many :platforms, through: :platformings
  has_many :orders
  has_many :messages, as: :user

  validates_presence_of :name
end
