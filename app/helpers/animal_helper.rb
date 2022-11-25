module AnimalHelper
  def cloudinary_image(animal, tagclass)
    if animal.images.attached?
      cl_image_tag animal.images[0].key, class: tagclass
    else
      image_tag "https://cdn.britannica.com/22/125622-050-E4DA94ED/Albino-axolotl.jpg", class: 'card-img-top animal-photo'
    end
  end
end
