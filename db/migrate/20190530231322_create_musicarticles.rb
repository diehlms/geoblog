class CreateMusicarticles < ActiveRecord::Migration[5.2]
  def change
    create_table :musicarticles do |t|
      t.string :title
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
