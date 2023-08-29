# == Schema Information
#
# Table name: executors
#
#  id       :bigint           not null, primary key
#  is_admin :boolean          default(FALSE), not null
#  name     :string           not null
#
class Executor < ApplicationRecord
  has_many :platformings, as: :platformable
  has_many :platforms, through: :platformings
  has_many :orders

  validates_presence_of :name
end
