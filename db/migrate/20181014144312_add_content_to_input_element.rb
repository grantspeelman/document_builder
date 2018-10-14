class AddContentToInputElement < ActiveRecord::Migration[5.2]
  def change
    add_column :input_elements, :content, :string, null: false, default: ''
  end
end
