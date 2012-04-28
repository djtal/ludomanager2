module EditionsHelper
  def name_placeholder_for(edition)
    edition.game.present? ? edition.game.name : 'Laisser vide si identique'
  end
end
