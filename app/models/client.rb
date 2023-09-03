# == Schema Information
#
# Table name: clients
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  external_id :bigint           not null
#  platform_id :bigint           not null
#
# Indexes
#
#  index_clients_on_platform_id                  (platform_id)
#  index_clients_on_platform_id_and_external_id  (platform_id,external_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (platform_id => platforms.id)
#
class Client < ApplicationRecord
  belongs_to :platform
  has_many :orders
  has_many :messages, as: :user

  validates_presence_of :name
  validates_presence_of :platform
  validates_presence_of :external_id
  validates_uniqueness_of :external_id, scope: :platform
end
