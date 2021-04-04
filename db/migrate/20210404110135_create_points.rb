class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.string :sender
      t.string :receiver
      t.string :mindtype
      t.string :comment
      t.string :reply
      t.integer :likes

      t.timestamps
    end
  end
end
