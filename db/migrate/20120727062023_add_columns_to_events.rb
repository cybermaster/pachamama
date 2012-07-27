class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :dining_table_count, :integer
    add_column :events, :capacity, :integer
    add_column :events, :default_seats_per_table, :integer
  end
end
