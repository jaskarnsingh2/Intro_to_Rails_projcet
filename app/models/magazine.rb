class Magazine < ApplicationRecord
    # Associations
    belongs_to :book
    has_many :reviews, dependent: :destroy
    # Validations
    validates :title, presence: true
    validates :author, presence: true
    validates :published_date, presence: true
    validates :publisher, presence: true
end
