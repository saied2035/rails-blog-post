class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comment do |t|
      t.bigint :AuthorId
      t.bigint :PostId
      t.text :Text
      t.timestamps
      add_foreign_key :comment, :user, column: :AuthorId, primary_key: "id"
      add_foreign_key :comment, :post, column: :PostId, primary_key: "id"
      add_index :comment, :AuthorId
      add_index :comment, :PostId      
    end

  end
end
