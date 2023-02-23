module IconsHelper
  def find_icon(category)
    case category
    when 'restaurant'
      'fa-utensils'
    when 'watch'
      'fa-video'
    when 'read'
      'fa-book-open'
    when 'podcast'
      'fa-microphone'
    when 'health'
      'fa-house-medical'
    when 'shop'
      'fa-cart-shopping'
    when 'trip'
      'fa-earth-americas'
    end
  end
end
