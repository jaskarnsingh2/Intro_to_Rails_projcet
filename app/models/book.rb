class Book < ApplicationRecord
    # Associations
    has_many :magazines
    
    # Validations
    validates :title, presence: true
    validates :authors, presence: true
    validates :published_date, presence: true
    validates :publisher, presence: true
end
