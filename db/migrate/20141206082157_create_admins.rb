class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_hash, null: false
      t.string :password_salt, null: false
      
      t.timestamps
    end
  end
end
