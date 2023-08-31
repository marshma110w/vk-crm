# == Schema Information
#
# Table name: chats
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :bigint           not null
#
# Indexes
#
#  index_chats_on_order_id  (order_id)
#
class Chat < ApplicationRecord
  belongs_to :order
end
