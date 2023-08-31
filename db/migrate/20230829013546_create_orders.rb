class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :client
      t.references :executor
      t.references :subject
      t.references :platform
      t.string :title
      t.text :description
      t.decimal :price
      t.datetime :deadline
      t.timestamps
    end
  end
end
