class Book < ApplicationRecord
    # Associations
    has_many :authors, through: :book_authors
    has_many :magazines
    belongs_to :publisher
    belongs_to :category
    has_many :reviews, dependent: :destroy
    # Validations
    validates :title, presence: true
    validates :authors, presence: true
    validates :published_date, presence: true
    validates :publisher, presence: true
end
