json.extract! author, :id, :full_name, :description, :photo, :created_at, :updated_at
json.url author_url(author, format: :json)
