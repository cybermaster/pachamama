class RemoveEmailFromTableCaptains < ActiveRecord::Migration
  def up
    remove_column :table_captains, :email
      end

  def down
    add_column :table_captains, :email, :string
  end
end
