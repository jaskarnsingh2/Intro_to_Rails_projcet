class AddPublisherIdToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :publisher_id, :integer
    remove_column :books, :publisher, :string
    add_foreign_key :books, :publishers, column: :publisher_id
  end
end
