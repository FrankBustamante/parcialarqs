class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :full_name
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
