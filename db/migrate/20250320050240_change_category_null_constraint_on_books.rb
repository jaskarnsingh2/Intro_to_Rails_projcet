class ChangeCategoryNullConstraintOnBooks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :books, :category_id, false
  end
end
