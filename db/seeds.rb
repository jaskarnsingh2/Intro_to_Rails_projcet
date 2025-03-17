require 'csv'

# Seed data from books.csv
CSV.foreach(Rails.root.join('db', 'books.csv'), headers: true) do |row|
  # Parse the published date string (it's an array-like string)
  published_dates = eval(row['Published Date']) rescue nil
  first_date = published_dates.is_a?(Array) ? published_dates.first : row['Published Date']
  
  # Use the publisher from the CSV if available
  Book.create!(
    title: row['Title'],
    authors: row['Author(s)'],
    published_date: first_date,
    publisher: row['Publisher'] # Ensure publisher is being passed
  )
end

# Seed data from Faker for Magazines
Book.all.each do |book|
  5.times do
    Magazine.create!(
      title: Faker::Book.title,
      author: Faker::Book.author,
      # Random date within the last 5 years
      published_date: Faker::Date.backward(days: 365 * 5), 
      publisher: Faker::Book.publisher,
      book: book
    )
  end
end
