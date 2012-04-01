module Root::NamespaceHelper
  def markdown(input)
    Markdown.render(input).html_safe
  end
  
  alias m :markdown
  
  def flag_tag(locale = I18n.locale)
    image_tag "flags/#{locale}.png", :alt => locale
  end
end
