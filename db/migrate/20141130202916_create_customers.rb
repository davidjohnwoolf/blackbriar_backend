class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.belongs_to :user
      t.string :name, null: false
      t.date :install_date, null: false
      t.decimal :mmr, null: false
      t.boolean :sixty_month, default: false
      t.boolean :eft, default: false
      t.boolean :activation, default: false

      t.timestamps
    end

    add_index :customers, :user_id
  end
end
