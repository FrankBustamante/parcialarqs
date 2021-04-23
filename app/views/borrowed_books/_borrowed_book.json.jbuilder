json.extract! borrowed_book, :id, :book_id, :user_id, :status, :limit_date, :return_date, :created_at, :updated_at
json.url borrowed_book_url(borrowed_book, format: :json)
