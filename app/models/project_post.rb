class ProjectPost < ApplicationRecord
  has_one_attached :main_image
  has_many_attached :secondary_images

  before_save :apply_cloudinary_transformation


  def plain_text_description
    # Assuming 'description' is the attribute containing HTML text
    ActionView::Base.full_sanitizer.sanitize(description)
  end
  
  private

  def apply_cloudinary_transformation
    # Check if the main_image is attached and apply the transformation
    if main_image.attached?
      # Get the image dimensions
      width = main_image.metadata[:width]
      height = main_image.metadata[:height]

      # Check if either width or height exceeds the specified limits
      if width && height && (width > 950 || height > 650)
        main_image.variant(
          resize_to_limit: [950, 650],
          quality: 'auto'
        )
      end
    end
  end
end

