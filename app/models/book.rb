class Book < ApplicationRecord
    # Associations
    has_many :magazines
    has_and_belongs_to_many :authors
    belongs_to :category
    has_many :reviews
    belongs_to :publisher, optional: true
    # Validations
    validates :title, presence: true
    validates :authors, presence: true
    validates :published_date, presence: true
    validates :publisher, presence: true
end
