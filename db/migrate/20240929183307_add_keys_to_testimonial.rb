class AddKeysToTestimonial < ActiveRecord::Migration[7.0]
  def change
    add_column :testimonials, :profile_image_key, :string
    add_column :testimonials, :logo_image_key, :string
  end
end
