class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_hash, null: false
      t.string :password_salt, null: false
      t.decimal :eft_percent
      t.decimal :sixty_month_percent
      t.decimal :activation_percent

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
