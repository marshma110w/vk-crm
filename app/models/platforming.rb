# == Schema Information
#
# Table name: platformings
#
#  id                :bigint           not null, primary key
#  platformable_type :string           not null
#  external_user_id  :bigint           not null
#  platform_id       :bigint           not null
#  platformable_id   :bigint           not null
#
# Indexes
#
#  index_platformings_on_platform_id                       (platform_id)
#  index_platformings_on_platform_id_and_external_user_id  (platform_id,external_user_id)
#  index_platformings_on_platformable                      (platformable_type,platformable_id)
#
class Platforming < ApplicationRecord
  belongs_to :platform
  belongs_to :platformable, polymorphic: true

  validates_presence_of :external_user_id
end
