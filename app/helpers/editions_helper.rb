module EditionsHelper
  def name_placeholder_for(edition)
    edition.game.present? ? edition.game.name : 'Laisser vide si identique'
  end

  def edition_status(edition)
   content_tag(:i, "", :class => "icon-ok") if edition.kind.primary?
  end
end
