class AddDateOfPostToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :blog_posts, :date_of_post, :date
    add_column :project_posts, :date_of_post, :date
  end
end
