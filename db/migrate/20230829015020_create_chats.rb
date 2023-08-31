class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.references :order, null: false
      t.timestamps
    end
  end
end
