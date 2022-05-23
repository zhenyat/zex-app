module ZexHelper
  ##############################################################################
  #   Hides secret values 
  ##############################################################################
  def key_tail value
    "#{'*'*50} #{value.last(4)}"
  end

  ##############################################################################
  #   Merges images
  ##############################################################################
  def images_tag(array_of_images, options={})
    images = []
    if array_of_images.is_a? Array and array_of_images.length >= 2
      array_of_images.each do |image|
        images << image_tag(image, size: options[:size], class: options[:class])
      end
    end
    content_tag :span, images.join("\n").html_safe, class: "img-circle"
    # content_tag :div, images.join("\n").html_safe, class: "img-circle"
  end
end
