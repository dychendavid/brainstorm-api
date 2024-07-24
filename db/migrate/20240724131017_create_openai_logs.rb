class CreateOpenaiLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :openai_logs do |t|
      t.text "api", null: true
      t.text "params", null: true
      t.text "model", null: true
      t.text "response", null: true

      t.timestamps
    end
  end
end
