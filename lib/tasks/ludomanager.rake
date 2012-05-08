namespace :ludomanager do
  namespace :image do
    desc "Re process image to update versions and others"
    task :reprocess => [:environment] do
      Image.all.each do |i|
        unless i.image.blank?
          Rails.logger.warn "[Image:re process #{Time.zone.now.strftime("%d/%Y %H:%M:%s")}] : #{i.inspect}"
          i.image.recreate_versions!
        end
      end
    end
  end
end
