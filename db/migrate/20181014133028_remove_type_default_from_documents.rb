class RemoveTypeDefaultFromDocuments < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:documents, :type, nil)
  end
end
