class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.string :sender
      t.string :receiver
      t.string :mindType
      t.string :sender_comment
      t.string :recever_comment
      t.integer :likes

      t.timestamps
    end
  end
end
