class DocumentTemplate < ApplicationRecord
  belongs_to :account
  validates :title, presence: true

  scope :for_account, ->(account) { where(account: account) }
end
