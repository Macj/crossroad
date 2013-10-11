class ChangeTypeStructure < ActiveRecord::Migration
  def change
    add_column :types, :category_id, :integer
    add_column :types, :section_type, :string
  end
end
