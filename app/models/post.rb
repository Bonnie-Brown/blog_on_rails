class Post < ApplicationRecord

    validates :title, presence: true, uniqueness: true
    validates :body, presence: true, numericality: {greater_or_equal_to: 50}


end
