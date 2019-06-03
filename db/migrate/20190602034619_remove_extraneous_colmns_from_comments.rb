class RemoveExtraneousColmnsFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :musicarticle_id
    remove_column :comments, :geologyarticle_id
  end
end
