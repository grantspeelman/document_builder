class CreateInputElements < ActiveRecord::Migration[5.2]
  def change
    create_table :input_elements do |t|
      t.string :label, null: false
      t.string :html_type, default: 'text', null: false

      t.timestamps
    end
  end
end
