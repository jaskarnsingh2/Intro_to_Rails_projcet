class Book < ApplicationRecord
    # Associations
    has_many :authors, through: :book_authors
    has_many :magazines
    has_and_belongs_to_many :authors
    belongs_to :publisher
    belongs_to :category
    has_many :reviews, dependent: :destroy
    # Validations
    validates :title, presence: true
    validates :authors, presence: true
    validates :published_date, presence: true
    validates :publisher, presence: true
end
