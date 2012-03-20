class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :lastName
      t.string :firstName
      t.string :email
      t.string :phone
      t.boolean :confirm
      t.text :notes
      t.references :diningTable
      t.references :tableCaptain

      t.timestamps
    end
    add_index :guests, :diningTable_id
    add_index :guests, :tableCaptain_id
  end
end
