# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :chat, null: false, index: true
      t.references :user, polymorphic: true, null: false, index: true
      t.text :body
      t.timestamps
    end
  end
end
