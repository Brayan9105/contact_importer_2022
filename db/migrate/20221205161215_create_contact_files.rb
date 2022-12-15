class CreateContactFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_files do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.jsonb :contact_columns, null: false, default: {}
      t.text :errors_log

      t.timestamps
    end
  end
end
