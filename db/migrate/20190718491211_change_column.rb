class ChangeColumn < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :lists, :nome, :name
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
