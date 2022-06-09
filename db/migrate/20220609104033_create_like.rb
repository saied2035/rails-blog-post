class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :like do |t|
      t.bigint :AuthorId
      t.bigint :PostId
      t.timestamps
      add_foreign_key :like, :user, column: :AuthorId, primary_key: "id"
      add_foreign_key :like, :post, column: :PostId, primary_key: "id"
      add_index :like, :AuthorId
      add_index :like, :PostId
    end

  end
end
