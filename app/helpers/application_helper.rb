module ApplicationHelper
  def menu_item(text, url, menu,  opts = {}, &block)
    cls = %W(#{opts.delete(:class)}) if opts[:class].present?
    dropdown = opts.delete(:dropdown)
    classes = cls || []
    classes << "active" if menu.to_sym ==  params[:controller].to_sym
    classes << "dropdown" if dropdown
    a_opts = {}
    a_opts["class"] = "dropdown-toggle" if dropdown
    a_opts["data-toggle"] = "dropdown" if dropdown
    a_opts["data-target"] = "#" if dropdown
    content = ActiveSupport::SafeBuffer.new
    content << text
    content << content_tag(:b, "", :class => "caret") if dropdown
    content_tag(:li, :class => classes * ' ') do
      concat(link_to(content, url, a_opts))
      concat(capture(&block)) if block_given?
    end
  end


  def dropdown_button_for(text, opts = {}, &block)
    cls = %W(#{opts.delete(:class)}) if opts[:class].present?
    return link_to(text, "#", :class => "btn #{cls * ' '}") unless block_given?
    cls ||= []
    options = {
      "link" => {
        "data-toggle" => "dropdown"
      }
    }.merge(opts).with_indifferent_access
    options["link"]["class"] = (%w(dropdown-toggle btn) + cls).join(' ')
    render :partial => "shared/button_dropdown", :locals => {:body => capture(&block), :title => text, :opts  => options}
  end
end
