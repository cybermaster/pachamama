class RemoveFirsNameFromTableCaptains < ActiveRecord::Migration
  def up
    remove_column :table_captains, :firs_name
      end

  def down
    add_column :table_captains, :firs_name, :string
  end
end
