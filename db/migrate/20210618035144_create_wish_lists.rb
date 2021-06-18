class CreateWishLists < ActiveRecord::Migration[6.1]
  def change
    create_table :wish_lists do |t|
      t.references :book, null: false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
