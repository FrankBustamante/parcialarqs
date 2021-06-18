module ViewsDecorator
  def short_description(short_description)
    short_description || '...'
  end

  def content_description(content_description)
    content_description || "Sin descripcion"
  end

  def title_description(title)
    title || "...."
  end

  def full_description(full_d)
    full_d || "...."
  end

  def other_description(o_d)
    o_d || '...'
  end

  def get_image(image)
    image || "#{self.class.to_s.downcase}_default.png"
  end
end
