class AboutController < ApplicationController
    def index
        @data_sources = [
          { name: 'Books CSV', description: 'CSV file containing book data.' },
          { name: 'Faker Gem', description: 'Gem used to generate fake data for magazines.' }
        ]
      end
end
