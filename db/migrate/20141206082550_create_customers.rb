class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.belongs_to :user
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :phone, null: false
      t.integer :credit_score, null: false
      t.string :tech_name, null: false
      t.string :package, null: false
      t.decimal :mmr, null: false
      t.date :date_sold, null: false
      t.date :date_installed, null: false
      t.boolean :sixty_month, default: false
      t.boolean :eft, default: false
      t.boolean :activation, default: false
      t.boolean :takeover, default: false
      t.boolean :canceled, default: false
      t.string :contract_ama
      t.string :contract_sop

      t.timestamps
    end

    add_index :customers, :name
    add_index :customers, :user_id
  end
end
