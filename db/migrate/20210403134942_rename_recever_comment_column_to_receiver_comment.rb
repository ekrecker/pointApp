class RenameReceverCommentColumnToReceiverComment < ActiveRecord::Migration[6.1]
  def change
    rename_column :points, :recever_comment, :receiver_comment
  end
end
