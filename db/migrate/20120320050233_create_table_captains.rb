class CreateTableCaptains < ActiveRecord::Migration
  def change
    create_table :table_captains do |t|
      t.string :login
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
