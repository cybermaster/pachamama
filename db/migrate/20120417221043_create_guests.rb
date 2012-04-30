class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.text :note
      t.references :dining_table

      t.timestamps
    end
  end
end
