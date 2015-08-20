class ChangeColumnTypeInThreadPosts < ActiveRecord::Migration
  def change
    rename_column :thread_posts, :thread_id, :topic_thread_id
  end
end
