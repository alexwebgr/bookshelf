json.extract! book, :id, :title, :author, :date_published, :unique_identifier, :publisher_name, :user_id, :created_at, :updated_at
json.url book_url(book, format: :json)
