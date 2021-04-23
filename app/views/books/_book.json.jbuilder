json.extract! book, :id, :name, :description, :isbn, :price, :stock, :book_score, :score, :photo, :author_id, :created_at, :updated_at
json.url book_url(book, format: :json)
