class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.text :note
      t.references :dining_table

      t.timestamps
    end
  end
end
