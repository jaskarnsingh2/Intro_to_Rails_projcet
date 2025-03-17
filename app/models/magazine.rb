class Magazine < ApplicationRecord
    # Associations
    belongs_to :book
    
    # Validations
    validates :title, presence: true
    validates :author, presence: true
    validates :published_date, presence: true
    validates :publisher, presence: true
end
