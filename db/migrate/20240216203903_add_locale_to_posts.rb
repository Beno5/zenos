class AddLocaleToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :blog_posts, :locale, :string
    add_column :project_posts, :locale, :string
  end
end
