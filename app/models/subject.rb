# == Schema Information
#
# Table name: subjects
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Subject < ApplicationRecord
  has_many :orders

  validates_presence_of :name
  validates_uniqueness_of :name
end
