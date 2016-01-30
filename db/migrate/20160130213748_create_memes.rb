class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.string :id_img
      t.string :text_top
      t.string :text_buttom
      t.string :link
      t.string :type
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :votes
      t.string :type

      t.timestamps null: false
    end
  end
end
