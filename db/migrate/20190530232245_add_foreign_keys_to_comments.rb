class AddForeignKeysToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :musicarticle_id, :integer
    add_column :comments, :geologyarticle_id, :integer
  end
end
