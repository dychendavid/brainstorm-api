class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.text "name", null: true
      t.text "usage", null: true
      t.text "target_audience", null: true
      t.text "difference", null: true
      t.text "highlight", null: true
      t.text "style", null: true
      t.text "guidance", null: true
      t.text "competitor", null: true
      t.text "length", null: true
      t.text "extra", null: true
      t.text "intro", null: true
      t.timestamps
    end
  end
end
