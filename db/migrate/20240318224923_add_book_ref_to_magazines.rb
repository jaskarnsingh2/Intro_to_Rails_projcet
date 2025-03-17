class AddBookRefToMagazines < ActiveRecord::Migration[7.1]
  def change
    add_reference :magazines, :book, null: false, foreign_key: true
  end
end
