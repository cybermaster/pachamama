class CreateDiningTables < ActiveRecord::Migration
  def change
    create_table :dining_tables do |t|
      t.integer :physical_number
      t.integer :group_number
      t.references :table_leader
      t.references :event
      t.references :user

      t.timestamps
    end
  end
end
