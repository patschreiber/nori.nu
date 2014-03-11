module ApplicationHelper

  def body_class(class_name="default_class")
    content_for :body_class, class_name
  end

  def logo_image_path
    "nori_logo.svg"
  end

  def logo_light_image_path
    "nori_logo_light.svg"
  end

  def current_year
    DateTime.now.strftime("%Y")
  end

  def copyright
    "© #{current_year} nori.nu"
  end

  def admin_social_websites
    "http://www.twitter.com/patschreiber"
  end

end
