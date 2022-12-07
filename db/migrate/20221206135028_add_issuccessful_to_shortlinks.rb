class AddIssuccessfulToShortlinks < ActiveRecord::Migration[7.0]
  def change
    add_column :shortlinks, :expiry_date, :datetime
    add_column :shortlinks, :is_processed, :boolean
    add_column :shortlinks, :is_successful, :boolean
    add_column :shortlinks, :processing_notes, :string
  end
end
