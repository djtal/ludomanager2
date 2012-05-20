module ApplicationHelper
  def menu_item(text, url, menu,  opts = {}, &block)
    cls = %W(#{opts.delete(:class)}) if opts[:class].present?
    split = opts.delete(:split)
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


  def dropdown_button_for(text, *args, &block)
    opts = args.extract_options!
    url = args[0] || ""
    cls = %W(#{opts.delete(:class)}) if opts[:class].present?
    return link_to(text, "#", :class => "btn #{cls * ' '}") unless block_given?
    cls ||= []
    split = opts.delete(:split)
    options = {
      "link" => {
        "data-toggle" => "dropdown"
      },
      "class" => (cls + ["btn"]) * ' '
    }.merge(opts).with_indifferent_access
    options["link"]["class"] = (%w(dropdown-toggle btn) + cls).join(' ')
    partial = split ? "shared/button_dropdown_split" : "shared/button_dropdown"
    render partial: partial , locals:  {body: capture(&block), title: text, url: url, opts: options}
  end

  def icon_tag(icon, opts = {})
    icon = icon.gsub(/^icon-/, '')
    set = opts.delete("icon-set") || ""
    classes = opts.delete(:class) || ""
    classes = classes.split(" ")
    classes << "icon#{set}-#{icon}"
    content_tag(:i, "",  :class => classes)
  end

  def link_to_button(name, url, opts = {})
    icon = opts.delete(:icon)
    disabled = opts.delete(:disabled)
    classes = %w(btn)
    classes << opts.delete(:class).split(' ') if opts[:class]
    classes << "disabled" if disabled
    opts[:class] = classes.uniq * ' '
    url = "#" if disabled
    opts.delete(:method) if disabled
    link_to url, opts do
      concat(icon_tag(icon)) if icon
      concat(" #{name}".html_safe)
    end
  end

  class Tabs
    def initialize(context)
      @context = context
      @tabs = []
      @tabs_body = {}
      yield self
    end

    def add(name,  url, opts = {}, &block)
      sym = name.downcase.parameterize
      tab = {
        :url => url,
        :sym => sym,
        :name => name,
        :active => false
      }.merge(opts)
      @tabs << tab
      @tabs_body[sym] = @context.capture(&block) if block_given?
      ""
    end

    def render
     content = ActiveSupport::SafeBuffer.new
     content << header
     content << body
     content
    end

    private

    def header
      content = @tabs.inject(ActiveSupport::SafeBuffer.new) do |buffer, tab|
        opts = {
          :'data-toggle' => "tab",
          :'data-target' => "##{tab[:sym]}"
        }
        opts[:class] = tab[:class] if tab[:class]
        opts[:id] = tab[:id] if tab[:id]
        buffer << content_tag(:li, link_to(tab[:name], tab[:url], opts), :class => tab[:active] ? "active" : "")
        buffer
      end
      content_tag(:ul, content, :class => "nav nav-tabs")
    end

    def body
      content = @tabs.inject(ActiveSupport::SafeBuffer.new) do |buffer, tab|
        classes = %w(tab-pane)
        classes << "active" if tab[:active]
        buffer << content_tag(:div, @tabs_body[tab[:sym]], :class => classes * ' ', :id => tab[:sym])
        buffer
      end
      content_tag(:div, content, :class => "tab-content")
    end

    def method_missing(method, *args, &block)
      @context.send(method, *args, &block)
    end

  end

  def tabs(&block)
    Tabs.new(self, &block).render
  end

  def tab_status_class(tab)
    "active" if tab == @active_tag
  end
end
