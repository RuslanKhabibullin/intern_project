class AddIndexToArticles < ActiveRecord::Migration[5.0]
  def change
    add_index :articles, :title, unique: true
  end
end
