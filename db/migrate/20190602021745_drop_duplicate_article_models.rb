class DropDuplicateArticleModels < ActiveRecord::Migration[5.2]
  def change
    drop_table :geologyarticles
    drop_table :musicarticles
  end
end
