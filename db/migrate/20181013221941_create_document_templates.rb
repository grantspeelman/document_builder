class CreateDocumentTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :document_templates do |t|
      t.belongs_to :account

      t.string :title

      t.timestamps
    end
  end
end
