class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :url
      t.string :shortUrl
      t.integer :status
      t.references :patterns, null: false, foreign_key: true

      t.timestamps
    end
  end
end
