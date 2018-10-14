class CreateLinkedElements < ActiveRecord::Migration[5.2]
  def change
    create_table :linked_elements do |t|
      t.belongs_to :document_template, foreign_key: true
      t.integer :element_id
      t.string  :element_type

      t.timestamps
    end

    add_index :linked_elements, [:element_type, :element_id]
  end
end
