class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author, null:false, index: true, foreign_key: {to_table: :users}
      t.string :title, :limit => 32
      t.text :text
      t.timestamps
      t.bigint :comments_counter, default: 0
      t.bigint :likes_counter, default: 0
    end
  end
end
