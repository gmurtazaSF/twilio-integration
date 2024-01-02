class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :recipient_phone, null: false
      t.text :message, null: false

      t.timestamps
    end
  end
end
