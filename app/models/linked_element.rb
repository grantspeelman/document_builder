class LinkedElement < ApplicationRecord
  ALLOW_ELEMENT_TYPES = [HTMLElement, InputElement].map(&:to_s).freeze

  belongs_to :element, polymorphic: true, dependent: :destroy

  validates :element_type, presence: true, inclusion: { in: ALLOW_ELEMENT_TYPES }

  def self.all_types
    ALLOW_ELEMENT_TYPES.map(&:underscore)
  end
end
