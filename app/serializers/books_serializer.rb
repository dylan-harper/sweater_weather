class BooksSerializer
  include JSONAPI::Serializer
  attributes :id, :destination, :forecast, :total_books_found, :books
end
