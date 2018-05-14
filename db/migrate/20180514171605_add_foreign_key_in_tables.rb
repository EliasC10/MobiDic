# frozen_string_literal: true

class AddForeignKeyInTables < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :supervisors, :institutions, column: :institution_id
    add_foreign_key :clients, :institutions, column: :institution_id
    add_foreign_key :client_entries, :clients, column: :client_id
    add_foreign_key :client_entries, :entries, column: :entry_id
    add_foreign_key :entries, :supervisors, column: :supervisor_id
    add_foreign_key :entry_categories, :entries, column: :entry_id
    add_foreign_key :entry_categories, :categories, column: :category_id
  end
end
