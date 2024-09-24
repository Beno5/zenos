class CreateTestimonials < ActiveRecord::Migration[7.0]
  def change
    create_table :testimonials do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :web_link
      t.text :text_ba
      t.text :text_en

      t.timestamps
    end
  end
end
