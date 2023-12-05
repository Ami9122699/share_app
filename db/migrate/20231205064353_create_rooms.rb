class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :introduction
      t.string :price
      t.string :address

      t.timestamps
    end
  end
end
