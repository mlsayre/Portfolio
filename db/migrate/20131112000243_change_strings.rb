class ChangeStrings < ActiveRecord::Migration
  def change
    change_column :projects, :long_desc, :text
  end
end
