class Category < ApplicationRecord
  #add association
  has_many :books
end
