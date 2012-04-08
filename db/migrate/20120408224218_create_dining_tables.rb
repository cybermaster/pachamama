class CreateDiningTables < ActiveRecord::Migration
  def change
    create_table :dining_tables do |t|
      t.integer :physicalNumber
      t.integer :groupNumber
      t.references :user
      t.references :event

      t.timestamps
    end
  end
end
