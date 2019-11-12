desc "Crawls updates for Chrome extensions."
task :get_updates => :environment do
  Extension.all.each do |extension|
    begin
      uri = extension.url
      page = Nokogiri.HTML(open(uri))
      version = page.at_css("span.C-b-p-D-Xe.h-C-b-p-D-md").inner_text
      date = page.at_css("span.C-b-p-D-Xe.h-C-b-p-D-xh-hh").inner_text.to_date
      overview = page.at_css("pre").inner_text
      Update.create({
        :extension => extension,
        :version => version,
        :date => date,
        :overview => overview,
        :reviewed => false
        })
    rescue
      Update.create({
        :extension => extension,
        :version => "Failed to get latest version",
        :date => Date.today,
        :overview => "Failed to get latest version",
        :reviewed => false
        })
    end
  end
end