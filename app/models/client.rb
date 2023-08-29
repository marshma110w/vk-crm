# frozen_string_literal: true

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
  has_many :platformings, as: :platformable
  has_many :platforms, through: :platformings
  has_many :orders

  validates_presence_of :name
end
