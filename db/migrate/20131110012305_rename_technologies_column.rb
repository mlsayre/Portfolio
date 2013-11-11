class RenameTechnologiesColumn < ActiveRecord::Migration
  def change
    rename_column :projects, :technologies_used, :short_desc
    add_column :projects, :long_desc, :string
    add_column :projects, :projectpic_url, :string
  end

end
