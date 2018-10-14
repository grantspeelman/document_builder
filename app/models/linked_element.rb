class LinkedElement < ApplicationRecord
  belongs_to :element, polymorphic: true
end
