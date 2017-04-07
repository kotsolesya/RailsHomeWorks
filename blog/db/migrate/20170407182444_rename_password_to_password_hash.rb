class RenamePasswordToPasswordHash < ActiveRecord::Migration
  def up
    rename_column :users, :password, :password_hash
  end

  def down
    rename_column :users, :password_hash, :password
  end
end
