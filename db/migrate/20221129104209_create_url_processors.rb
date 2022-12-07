class CreateUrlProcessors < ActiveRecord::Migration[7.0]
  def change
    create_table :url_processors do |t|
      t.string :url
      t.string :shortUrl
      t.integer :status
      t.references :patterns, null: true, foreign_key: true

      t.timestamps
    end
  end
end
