class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :article_id,    null: false
      t.integer :user_id,       null: false
      t.string  :text,          null: false
      t.datetime :created_at,   null: false
    end

    add_index :comments, :article_id
  end
end
