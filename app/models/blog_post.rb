class BlogPost < ApplicationRecord
  has_one_attached :main_image
  has_many_attached :secondary_images

  def plain_text_description
    # Assuming 'description' is the attribute containing HTML text
    return ActionView::Base.full_sanitizer.sanitize(description)
  end
end
