class CreateUsersAndPlatforms < ActiveRecord::Migration[7.0]
  def change
    create_table :platforms do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :platformings do |t|
      t.references :platform, null: false
      t.references :user, polymorphic: true, index: true, null: false
      t.bigint :external_user_id, null: false
      t.index %i[platform_id external_user_id]
    end

    create_table :clients do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :executors do |t|
      t.string :name, null: false
      t.boolean :is_admin, null: false, default: false
    end
  end
end
