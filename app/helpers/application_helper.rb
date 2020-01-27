module ApplicationHelper
  def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-success"
      when :info then "alert alert-info"
      when :alert then "alert alert-danger"
      when :warning then "alert alert-warning"
    end
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end

  def card_fields_class
    "hidden" if current_user.card_last4?
  end


  # Meta tags helper methods
  def meta_title(title)
    content_for(:title, title)
  end

  def meta_description(description)
    content_for(:meta_description, description)
  end

  def meta_keywords(keywords)
    content_for(:meta_keywords, keywords)
  end

  def meta_author(author)
    content_for(:meta_author, author)
  end
  
  def meta_image(image)
    content_for(:meta_image, image)
  end

end