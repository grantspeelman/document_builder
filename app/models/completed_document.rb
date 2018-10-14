class CompletedDocument < Document
  accepts_nested_attributes_for :linked_elements

  scope :for_account, ->(account) { includes(:linked_elements).where(account: account) }

  # @param [Account] account
  # @param [String] template_id
  def self.new_for(account:, template_id:)
    template = DocumentTemplate.for_account(account).find(template_id)
    new(account: account,
        title: template.title,
        linked_elements: template.linked_elements.map(&:dup))
  end
end
