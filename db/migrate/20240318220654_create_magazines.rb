class CreateMagazines < ActiveRecord::Migration[7.1]
  def change
    create_table :magazines do |t|
      t.string :title
      t.string :author
      t.string :published_date
      t.string :publisher

      t.timestamps
    end
  end
end
