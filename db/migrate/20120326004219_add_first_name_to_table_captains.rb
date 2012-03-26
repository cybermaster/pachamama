class AddFirstNameToTableCaptains < ActiveRecord::Migration
  def change
    add_column :table_captains, :first_name, :string

  end
end
