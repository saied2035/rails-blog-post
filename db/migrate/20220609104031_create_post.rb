class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :post do |t|
      t.references :Author, index: true, foreign_key: {to_table: :user}
      t.string :Title, :limit => 32
      t.text :Text
      t.timestamps
      t.bigint :CommentsCounter
      t.bigint :LikesCounter
    end
  end
end
