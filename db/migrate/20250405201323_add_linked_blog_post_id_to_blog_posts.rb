class AddLinkedBlogPostIdToBlogPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :blog_posts, :linked_blog_post_id, :integer
  end
end
