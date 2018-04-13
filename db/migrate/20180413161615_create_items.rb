class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :name
      t.text :description
      t.money :price
      t.text :category

      t.timestamps
    end
  end
end
