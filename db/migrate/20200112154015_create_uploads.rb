class CreateUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :uploads do |t|
      t.string :filename
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
