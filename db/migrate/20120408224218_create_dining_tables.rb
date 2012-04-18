class CreateDiningTables < ActiveRecord::Migration
  def change
    create_table :dining_tables do |t|
      t.integer :physical_number
      t.integer :group_number
      #t.references :guest
      t.references :event

      t.timestamps
    end
  end
end
