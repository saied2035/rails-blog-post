class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, :limit => 32
      t.string :photo, :limit => 2000
      t.text :bio
      t.timestamps
      t.bigint :posts_counter, default: 0
    end
  end
end
