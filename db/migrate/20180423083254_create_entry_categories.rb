class CreateEntryCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :entry_categories do |t|
      t.integer :entry_id
      t.integer :category_id

      t.timestamps
    end
  end
end
