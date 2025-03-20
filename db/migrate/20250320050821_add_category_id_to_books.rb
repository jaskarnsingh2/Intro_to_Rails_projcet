class AddCategoryIdToBooks < ActiveRecord::Migration[7.1]
  def change
    # Remove the line below since category_id already exists
    # add_reference :books, :category, null: false, foreign_key: true
  end

end
