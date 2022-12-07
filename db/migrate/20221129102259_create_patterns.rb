class CreatePatterns < ActiveRecord::Migration[7.0]
  def change
    create_table :patterns do |t|
      t.string :format
      t.string :lastPatternUsed

      t.timestamps
    end
  end
end
