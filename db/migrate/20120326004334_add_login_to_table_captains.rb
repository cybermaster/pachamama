class AddLoginToTableCaptains < ActiveRecord::Migration
  def change
    add_column :table_captains, :login, :string

  end
end
