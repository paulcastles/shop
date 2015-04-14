class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :manufacturer
      t.decimal :price
      t.string :category
      t.string :picture

      t.timestamps
    end
  end
end
