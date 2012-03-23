class CreateTableCaptains < ActiveRecord::Migration
  def change
    create_table :table_captains do |t|
      t.string :firsName
      t.string :lastName
      t.string :password
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
