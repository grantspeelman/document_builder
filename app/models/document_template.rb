class DocumentTemplate < Document
  belongs_to :account
  has_many :linked_elements

  validates :title, presence: true

  scope :for_account, ->(account) { where(account: account) }

  def add_element(element)
    linked_elements.create!(element: element)
  end

  # @return [LinkedElement]
  def find_linked_element(id)
    linked_elements.find(id)
  end
end
