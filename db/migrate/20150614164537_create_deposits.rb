class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.string :title
      t.text :metadata
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
