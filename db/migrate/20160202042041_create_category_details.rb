class CreateCategoryDetails < ActiveRecord::Migration
  def change
    create_table :category_details do |t|
      t.references :category, index: true, foreign_key: true
      t.references :meme, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
