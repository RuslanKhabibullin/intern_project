class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :article_id, null: false
    end

    add_index :likes, [:user_id, :article_id], unique: true
  end
end
