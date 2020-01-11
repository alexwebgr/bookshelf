class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.datetime :date_published
      t.string :unique_identifier
      t.string :publisher_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
