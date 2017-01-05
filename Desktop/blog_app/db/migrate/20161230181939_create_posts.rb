class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :User
      t.text :blog
      t.text :comment

      t.timestamps
    end
  end
end
