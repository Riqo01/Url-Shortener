class AddVisitsToShortlinks < ActiveRecord::Migration[7.0]
  def change
    add_column :shortlinks, :visit_count, :integer
  end
end
