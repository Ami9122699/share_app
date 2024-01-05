class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :room_id
      t.string :name
      t.text :introduction
      t.integer :price
      t.text :address

      t.timestamps
    end
  end
end
