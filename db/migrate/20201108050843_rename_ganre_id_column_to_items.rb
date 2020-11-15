class RenameGanreIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
  	rename_column :items, :ganre_id, :genre_id
  end
end
