desc "This task is called by the Heroku scheduler add-on"
task :get_updates => :environment do
  Extension.all.each do |extension|
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
  end
end