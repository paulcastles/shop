class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :email
      t.text :body
      t.integer :item_id

      t.timestamps
    end
  end
end
