# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  body       :text
#  user_type  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chat_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_chat_id  (chat_id)
#  index_messages_on_user     (user_type,user_id)
#
class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user, polymorphic: true

  validates_presence_of :user_id

  # TODO: Расскомментить когда начнем создавать чат и заказ при получении нового сообщения

  # validates_presence_of :chat_id
  # validate :user_belongs_to_chat

  # private

  # def user_belongs_to_chat
  #   errors.add(:user, 'must belong to order') if user != chat.order.client && user != chat.order.executor
  # end
end
