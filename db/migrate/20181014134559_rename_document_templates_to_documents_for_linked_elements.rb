class RenameDocumentTemplatesToDocumentsForLinkedElements < ActiveRecord::Migration[5.2]
  def change
    rename_column :linked_elements, :document_template_id, :document_id
  end
end
