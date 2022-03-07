class BookFacade

  def self.search_books_about(location)
    results = BookService.search(location)
  end

end
