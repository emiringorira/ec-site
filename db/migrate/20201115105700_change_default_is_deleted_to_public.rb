class ChangeDefaultIsDeletedToPublic < ActiveRecord::Migration[6.0]
  def up
  	  change_column :publics, :is_deleted, :boolean, default: false
  end
  def down
  	  change_column :publics, :is_deleted, :boolean
  end
end
