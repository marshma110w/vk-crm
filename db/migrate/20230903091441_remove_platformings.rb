class RemovePlatformings < ActiveRecord::Migration[7.0]
  def change
    add_reference :clients, :platform, null: false
    add_foreign_key :clients, :platforms
    add_column :clients, :external_id, :bigint, null: false
    add_index :clients, %i[platform_id external_id], unique: true

    add_reference :executors, :platform, null: false
    add_foreign_key :executors, :platforms
    add_column :executors, :external_id, :bigint, null: false
    add_index :executors, %i[platform_id external_id], unique: true

    drop_table :platformings
  end
end
