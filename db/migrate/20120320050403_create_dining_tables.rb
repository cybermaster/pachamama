class CreateDiningTables < ActiveRecord::Migration
  def change
    create_table :dining_tables do |t|
      t.integer :tableNumber
      t.integer :groupNumber
      t.references :admin
      t.references :tableCaptain

      t.timestamps
    end
    add_index :dining_tables, :admin_id
    add_index :dining_tables, :tableCaptain_id
  end
end
