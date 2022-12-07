class CreateShortlinks < ActiveRecord::Migration[7.0]
  def change
    create_table :shortlinks do |t|
      t.string :url
      t.string :shortUrl
      t.integer :status

      t.timestamps
    end
  end
end
