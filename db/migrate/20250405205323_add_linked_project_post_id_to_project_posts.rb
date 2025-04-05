class AddLinkedProjectPostIdToProjectPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :project_posts, :linked_project_post_id, :integer
  end
end
