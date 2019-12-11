desc "Crawls updates for Chrome extensions."
task :get_updates => :environment do
  Extension.all.each do |extension|
    begin
      last_update = extension.updates.last
      if last_update.present?
        last_major_version = last_update.version.split(".").first(2).join(".").to_f
      else
        last_major_version = "0.0".to_f
      end
      uri = extension.url
      page = Nokogiri.HTML(open(uri))
      version = page.at_css("span.C-b-p-D-Xe.h-C-b-p-D-md").inner_text
      major_version = version.split(".").first(2).join(".").to_f
      date = page.at_css("span.C-b-p-D-Xe.h-C-b-p-D-xh-hh").inner_text.to_date
      overview = page.at_css("pre").inner_text
      if major_version > last_major_version
        major = true
      else
        major = false
      end
      Update.create({
        :extension => extension,
        :version => version,
        :date => date,
        :overview => overview,
        :reviewed => false,
        :major => major
        })
    rescue
      puts "Failed to get latest version of #{extension.name}."
    end
  end
end