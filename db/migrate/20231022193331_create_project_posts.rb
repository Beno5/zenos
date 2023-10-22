class CreateProjectPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :project_posts do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
