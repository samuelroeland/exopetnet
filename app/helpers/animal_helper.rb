module AnimalHelper
  def cloudinary_image(animal, tagClass)
    if animal.images.attached?
      cl_image_tag animal.images[0].key, class: tagClass
    else
      image_tag "https://cdn.britannica.com/22/125622-050-E4DA94ED/Albino-axolotl.jpg", class: 'imageee'
    end
  end
end
