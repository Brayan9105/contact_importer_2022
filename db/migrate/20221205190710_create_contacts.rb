class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :date_of_birth
      t.string :phone
      t.string :address
      t.string :credit_card_number
      t.string :credit_card_network
      t.string :credit_card_last_four_digits
      t.string :email

      t.references :user, null: false, foreign_key: true
      t.references :contact_file, null: false, foreign_key: true

      t.timestamps
    end

    add_index :contacts, [:email, :user_id], unique: true
  end
end
