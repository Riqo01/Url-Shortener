class CreateShortUrlProcessors < ActiveRecord::Migration[7.0]
  def change
    create_table :short_url_processors do |t|
      t.string :url
      t.string :shortUrl
      t.integer :status

      t.timestamps
    end
  end
end
