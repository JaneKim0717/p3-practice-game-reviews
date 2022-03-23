class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.integer :user_id
      t.integer :game_id
    end
  end
end
