class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.string :id_img
      t.string :text_top
      t.string :text_buttom
      t.string :link
      t.string :type_meme
      t.integer :vote

      t.timestamps null: false
    end
  end
end
