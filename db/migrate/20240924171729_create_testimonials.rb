class CreateTestimonials < ActiveRecord::Migration[7.0]
  def change
    create_table :testimonials do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :web_link
      t.text :text_ba
      t.text :text_en
      t.integer :order
      t.string :profile_image_key
      t.string :logo_image_key

      t.timestamps
    end
  end
end
