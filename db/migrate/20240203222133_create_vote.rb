class CreateVote < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.references :account
      t.references :post
      t.boolean :upvote
      t.timestamps
    end
  end
end
