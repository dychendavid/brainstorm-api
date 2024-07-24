class CreateAuthorizationLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :authorization_logs do |t|
      t.text "ip", null: false
      t.integer "token_type", null: false, default: 0
      t.text "token", null: false
      t.timestamp "expired_at", null: false
      t.timestamps
    end
  end
end
