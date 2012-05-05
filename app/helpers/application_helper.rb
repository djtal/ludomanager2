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
      @tabs_body[sym] = @context.capture(&block)
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
