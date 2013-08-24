module EditorsHelper
  # Generate popover for edititor link if format is allowed and editions present
  # *editions* : all editions of one game for one editor
  #
  def options_for_editor_popover(format, editor, editions, opts = {}, &block)
    options = {
      title: editor.name,
      id: dom_id(editor)
    }.merge(opts)
    if :thumb == format && editions.any?
      editions = (editions || []).select { |e| e.editor_id == editor.id }
      options["rel"] = "popover"
      options["data-trigger"] = "hover"
      options["data-placement"] = "right"
      options["data-html"] =  true
      options["data-content"] = capture(editions,&block)
    end
    options
  end
end
