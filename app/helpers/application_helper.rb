module ApplicationHelper
  def menu_item(text, url, menu,  opts = {})
    cls = %W(#{opts.delete(:class)}) if opts[:class].present?
    classes = cls || []
    classes << "active" if menu.to_sym ==  params[:controller].to_sym
    content_tag(:li, link_to(text, url), :class => classes * ' ')
  end
end
