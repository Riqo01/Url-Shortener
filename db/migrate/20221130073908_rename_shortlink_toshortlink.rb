class RenameShortlinkToshortlink < ActiveRecord::Migration[7.0]
  def change
    rename_column :shortlinks, :shortUrl, :shorturl
  end 
end
