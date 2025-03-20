require 'csv'

# Seed data from books.csv
CSV.foreach(Rails.root.join('db', 'books.csv'), headers: true) do |row|
  # Attempt to parse the published date string (may contain multiple dates)
  published_dates = row['Published Date'].split(',').map(&:strip)  # Split by commas to handle multiple dates
  first_date = published_dates.first  # Take the first date in the array

  # Check if the first date is valid, else set it to nil
  begin
    parsed_date = Date.parse(first_date)
  rescue ArgumentError
    parsed_date = nil  # If date is invalid, set to nil
  end

  # Check if author(s) is present
  if row['Author(s)'].present?
    # Create authors first
    authors = row['Author(s)'].split(',').map do |author_name|
      Author.find_or_create_by(name: author_name.strip)
    end

    # Now create the book with associated authors
    book = Book.create!(
      title: row['Title'],
      published_date: parsed_date,
      publisher: row['Publisher'],
      authors: authors  # Assign authors at creation
    )
  else
    puts "Skipping book with no authors: #{row['Title']}"
  end
end

# Seed data from Faker for Magazines
Book.all.each do |book|
  5.times do
    Magazine.create!(
      title: Faker::Book.title,
      author: Faker::Book.author,
      published_date: Faker::Date.backward(days: 365 * 5), 
      publisher: Faker::Book.publisher,
      book: book
    )
  end
end
