class AddPhoneNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phone_number, :string, unique: true, null: false
    add_index :users, :phone_number, unique: true
  end
end
