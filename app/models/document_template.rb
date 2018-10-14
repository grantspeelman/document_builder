class DocumentTemplate < ApplicationRecord
  belongs_to :account
  has_many :linked_elements

  validates :title, presence: true

  scope :for_account, ->(account) { where(account: account) }
end
