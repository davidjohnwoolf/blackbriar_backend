class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_hash, null: false
      t.string :password_salt, null: false
      t.integer :eft_percent
      t.string :profile_picture

      t.timestamps
    end

    add_index :users, :email
  end
end
