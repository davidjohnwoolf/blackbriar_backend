class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :password_hash, null: false
      t.string :password_salt, null: false
      t.string :profile_picture
      t.integer :eft_stat
      t.integer :sixty_month_stat
      t.integer :activation_stat
      t.integer :takeover_stat
      t.decimal :mmr_stat
      t.integer :credit_score_stat
      t.integer :basic_stat
      t.integer :basic_image_stat
      t.integer :go_green_stat
      t.integer :basic_automation_stat
      t.integer :automation_plus_stat
      t.integer :fort_knox_stat
      t.integer :attrition
      t.integer :sales_year
      t.integer :sales_month

      t.timestamps
    end

    add_index :users, :email
  end
end
