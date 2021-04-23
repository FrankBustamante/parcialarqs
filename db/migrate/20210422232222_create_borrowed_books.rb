class CreateBorrowedBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :borrowed_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status, default: '0-', index: true
      t.date :limit_date
      t.date :return_date

      t.timestamps
    end
  end
end
