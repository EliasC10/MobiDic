class CreateEntryCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :entry_categories do |t|
      t.integer :entry_id
      t.integer :category_id

      add_foreign_key :entry_categories, :entries, column: :entry_id, primary_key: "lng_id"
      add_foreign_key :entry_categories, :categories, column: :category_id, primary_key: "lng_id"

      t.timestamps
    end
  end
end
