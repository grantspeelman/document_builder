class AddTypeToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :type, :string, null: false, default: 'document_template'
  end
end
