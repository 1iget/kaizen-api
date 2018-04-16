class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.text :name
      t.money :price
      t.integer :qty
      t.text :prep
      t.text :status

      t.timestamps
    end
  end
end
