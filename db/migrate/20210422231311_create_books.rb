class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :description
      t.string :isbn
      t.float :price
      t.integer :stock
      t.float :book_score
      t.float :score
      t.string :photo
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
