require 'csv'

# Seed data from books.csv
CSV.foreach(Rails.root.join('db', 'books.csv'), headers: true) do |row|
  published_dates = row['Published Date'].split(',').map(&:strip)
  first_date = published_dates.first
  
  begin
    parsed_date = Date.parse(first_date)
  rescue ArgumentError
    parsed_date = nil
  end

  if row['Author(s)'].present?
    authors = row['Author(s)'].split(',').map do |author_name|
      Author.find_or_create_by(name: author_name.strip)
    end

    # Create or find publisher
    publisher = Publisher.find_or_create_by(name: row['Publisher'])

    # Create or find category (adjust based on your categories data)
    category = Category.find_or_create_by(name: row['Category'])  # Assuming 'Category' exists in your CSV

    book = Book.create!(
      title: row['Title'],
      published_date: parsed_date,
      publisher: publisher,
      authors: authors,
      category: category  # Assign the category
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

User.create!(
  email: 'your_email@example.com',
  encrypted_password: Devise::Encryptor.digest(User, 'yourpassword')
)