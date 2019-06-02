class AddCategoriesToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :music_article, :boolean, default: false
    add_column :articles, :geology_article, :boolean, default: false
  end
end
