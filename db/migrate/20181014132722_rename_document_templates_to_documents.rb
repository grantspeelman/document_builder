class RenameDocumentTemplatesToDocuments < ActiveRecord::Migration[5.2]
  def change
    rename_table :document_templates, :documents
  end
end
