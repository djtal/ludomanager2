module EditionsHelper
  PLATEFORM = {
    board: "cube",
    web: "html5",
    ios: "apple",
    window: "windows",
    android: "android"
  }

  def name_placeholder_for(edition)
    edition.game.present? ? edition.game.name : 'Laisser vide si identique'
  end

  def edition_status(edition)
   content_tag(:i, "", :class => "icon-ok") if edition.kind.primary?
  end

  def active_edition_tag(edition)
    if edition.active?
      content_tag(:span, "active", class: "label label-info")
    end
  end

  def plateform_icon(plateform, opts = {})
    icon = PLATEFORM[plateform]
    options = {
      "icon-set" => "moo"
    }.merge(opts)
    icon_tag(icon, options) if icon
  end

end
