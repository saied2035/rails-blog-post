class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :user do |t|
      t.string :Name, :limit => 32
      t.string :Photo, :limit => 2000
      t.text :Bio
      t.timestamps
      t.bigint :PostsCounter
    end
  end
end
