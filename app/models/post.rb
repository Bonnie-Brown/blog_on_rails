class Post < ApplicationRecord


    has_many :comments, dependent: :destroy


    # validates :title, presence: true, uniqueness: true
    # validates :body, presence: true, numericality: {greater_than_or_equal_to: 50}


end
