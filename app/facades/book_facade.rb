class BookFacade

  def self.search_books_about(location)
    BookService.search(location)
  end

  def self.get_results_for(location, quantity)
    book_results = search_books_about(location)
    forecast = ForecastFacade.get_forecast_for(location)
    BookSearch.new(book_results, quantity, forecast)
  end

  # def self.get_forecast_for(location)
  #   ForecastFacade.
  # end
end
