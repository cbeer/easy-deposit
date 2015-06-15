class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.references :deposit
      t.references :user

      t.string :file_id

      t.string :file_filename, :string
      t.string :file_size, :integer
      t.string :file_content_type, :string

      t.string :file_hash
      t.text :metadata

      t.timestamps null: false
    end
  end
end
