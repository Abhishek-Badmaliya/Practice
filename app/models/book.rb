class Book < ApplicationRecord
  #add validations
  validates :book_title, presence: true
  validates :book_description, presence: true
  validates :author, presence: true

  #add association
  belongs_to :user
  belongs_to :category
end
