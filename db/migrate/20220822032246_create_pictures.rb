class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end
