require "legacy/models"
require 'rack/mime'

module Legacy
  DEFAULT_LANG = Country.where(code: "FR").first.id
  @@country_cache = Country.pluck(:code, :id).inject({}) { |acc, (code, id)| acc[code] = id; acc}
  DEFAULT_EDITOR_ID = 212
  def self.migrate_editors(with_image = true)
    LegacyEditor.all.each do |ed|
      e = Editor.find_or_initialize_by_old_id(ed.id)
      e.name = ed.name
      e.url = ed.homepage
      e.country_id = ed.lang ? @@country_cache[ed.lang.upcase].presence || DEFAULT_LANG : DEFAULT_LANG
      if with_image
        img = e.build_logo
        if ed.logo_file_name
          ext = Rack::Mime::MIME_TYPES.invert[ed.logo_content_type]
          filename = ed.name.downcase.parameterize.underscore
          filepath = Rails.root.join("tmp/legacy/system/logos/#{ed.id}/original/#{filename}#{ext}")
          img.image = File.open(filepath) if File.readable?(filepath)
        end
      end
      e.save
    end

  end

  def self.migrate_authors
    LegacyAuthor.all.each do |a|
      p = Person.find_or_initialize_by_old_id(a.id)
      p.first_name = a.name
      p.last_name = a.surname
      p.save
    end
  end


  def self.migrate_games(with_image = true)
    LegacyGame.find_each do |g|
      game = Game.find_or_initialize_by(old_id: g.id)
      game.name = g.name
      game.level = g.difficulty
      game.time = Game.time.values[g.time_category]
      game.target = Game.target.values[g.target]
      game.min = g.min_player
      game.max = g.max_player
      g.editions.order("created_at asc").each do |e|
        editor = Editor.where(old_id: e.editor_id).first
        if editor
          edition = game.editions.find_or_initialize_by(old_id: e.id)
          edition.game_id = game.id
          edition.editor_id = editor.id
          edition.kind = :primary
          edition.plateform = :board
          edition.out_date = e.published_at
          edition.country_ids = @@country_cache[e.lang.upcase].presence || [] if e.lang?
          if with_image && !edition.box_front
            if g.box_file_name
              img = edition.build_box_front
              filepath = Dir["#{Rails.root.join("tmp/legacy/system/boxes/#{g.id}/original")}/*.*"].first
              img.image = File.open(filepath) if filepath && File.readable?(filepath)
            else
              img = edition.build_box_front
            end
          end
        end
      end
      people = Person.where(old_id: LegacyAuthorship.where(game_id: g.id).pluck(:author_id))
      if people.any?
        game.authors = people
      end
      unless g.editions.any?
        edition = game.editions.find_or_initialize_by(editor_id: DEFAULT_EDITOR_ID)
        edition.game_id = game.id
        edition.editor_id = DEFAULT_EDITOR_ID
        edition.kind = :primary
        edition.plateform = :board
        edition.out_date = Time.zone.now
        edition.build_box_front
      end
      if game.save
        game.reload
        game.editions.reload
        game.update_attribute :active_edition_id, game.editions.first.id
      end
    end

  end
end
