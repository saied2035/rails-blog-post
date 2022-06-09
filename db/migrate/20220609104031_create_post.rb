class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :post do |t|
      t.bigint :AuthorId
      t.string :Title, :limit => 32
      t.text :Text
      t.timestamps
      t.bigint :CommentsCounter
      t.bigint :LikesCounter
      add_foreign_key :post, :user, column: :AuthorId, primary_key: "id"
      add_index :post, :AuthorId
    end
  end
end
