class CreateCsvuploads < ActiveRecord::Migration[7.0]
  def change
    create_table :csvuploads do |t|
      t.string :name
      t.string :path
      t.integer :rowcount
      t.boolean :processed

      t.timestamps
    end
  end
end
