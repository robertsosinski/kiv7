module Root::NamespaceHelper
  def translate(key, options = {})
    if key.to_s =~ /(\b|_|\.)markdown$/
      Markdown.render(super).html_safe
    else
      super
    end
  end
  
  alias t translate
  
  def flag_tag(locale = I18n.locale)
    image_tag "flags/#{locale}.png", :alt => locale
  end
end
