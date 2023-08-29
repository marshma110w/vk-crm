# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  body            :text
#  messagable_type :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  chat_id         :bigint           not null
#  messagable_id   :bigint           not null
#
# Indexes
#
#  index_messages_on_chat_id     (chat_id)
#  index_messages_on_messagable  (messagable_type,messagable_id)
#
class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :messagable, polymorphic: true

  validates_presence_of :chat_id
  validates_presence_of :messagable_id
end
