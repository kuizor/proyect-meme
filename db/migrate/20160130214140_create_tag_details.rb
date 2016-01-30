class CreateTagDetails < ActiveRecord::Migration
  def change
    create_table :tag_details do |t|
      t.references :meme, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
