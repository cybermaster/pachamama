class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.decimal :tableNumber

      t.timestamps
    end
  end
end
