class BookSearch

  attr_reader :destination, :forecast, :total_books_found, :books

  def initialize(location, quantity, book_results, forecast)
    @destination = location
    @forecast = filter_forecast(location, forecast)
    @total_books_found = book_results[:numFound]
    @books = filter_books(quantity, book_results[:docs])
  end
  #write unit test
  def filter_forecast(location, forecast)
    output = {
      summary: forecast.current_weather[:conditions],
      temperature: forecast.current_weather[:temp]
    }
  end
  #write unit test
  def filter_books(quantity, books)
    selected = books.take(quantity)
    output = []

    selected.each do |book|
      container = Hash.new
      container[:isbn] = book[:isbn]
      container[:title] = book[:title]
      container[:publisher] = book[:publisher]
      output << container
    end

    output
  end

end
