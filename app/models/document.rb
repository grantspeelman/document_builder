class Document < ApplicationRecord
  belongs_to :account
  has_many :linked_elements
end
