class AddReferencesToShortlinks < ActiveRecord::Migration[7.0]
  def change
    add_reference :shortlinks, :csvuploads, null: true, foreign_key: true
  end
end
