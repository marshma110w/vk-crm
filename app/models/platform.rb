# frozen_string_literal: true

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
  has_many :clients, through: :platformings, source: :platformable, source_type: 'Client'
  has_many :executors, through: :platformings, source: :platformable, source_type: 'Executor'

  validates_presence_of :name
end