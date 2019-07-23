class ChangeNullColumn < ActiveRecord::Migration[5.2]
  def self.up
    change_column_null :lists, :title, false
    change_column_null :cards, :title, false
  end

  def self.down
  end
end
