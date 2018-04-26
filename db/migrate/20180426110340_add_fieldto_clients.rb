class AddFieldtoClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :is_female, :boolean
  end
end
