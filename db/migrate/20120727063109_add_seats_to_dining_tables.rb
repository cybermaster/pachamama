class AddSeatsToDiningTables < ActiveRecord::Migration
  def change
    add_column :dining_tables, :seats, :integer
  end
end
