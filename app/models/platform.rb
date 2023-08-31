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
  has_many :platformings
  has_many :clients, through: :platformings, source: :user, source_type: 'Client'
  has_many :executors, through: :platformings, source: :user, source_type: 'Executor'

  has_many :orders

  validates_presence_of :name
  validates_uniqueness_of :name
end
