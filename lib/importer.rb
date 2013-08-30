require "legacy/models"
require 'rack/mime'

module Legacy
  DEFAULT_LANG = Country.where(code: "FR").first.id
  @@country_cache = Country.pluck(:code, :id).inject({}) { |acc, (code, id)| acc[code] = id; acc}
  def self.migrate_editors(with_image = true)
    LegacyEditor.all.each do |ed|
      e = Editor.find_or_initialize_by_old_id(ed.id)
      e.name = ed.name
      e.url = ed.homepage
      e.country_id = ed.lang ? @@country_cache[ed.lang.upcase].presence || DEFAULT_LANG : DEFAULT_LANG
      if with_image
        img = editor.build_logo
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
      person = Person.new do |p|
        p.first_name = a.name
        p.last_name = a.surname
      end
      person.save
    end
  end
end
