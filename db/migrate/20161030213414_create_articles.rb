class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string      :title,     null: false
      t.text        :content,   null: false
      t.integer     :author_id, null: false
      t.timestamps              null: false
    end

    add_index :articles, :author_id
  end
end
