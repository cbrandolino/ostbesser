require 'open-uri'

class BerghainScraper

  @@base_url = "http://berghain.de/event/"
  attr_accessor :document

  def initialize(id)
    @document = Nokogiri::HTML open "#{@@base_url}#{id}"
  end

  def room_names
    @document.css('.col_context > .type_dancefloor_color').map do |node|
      node.text.sub('Running Order', '').strip
    end
  end

  def room_running_order(room)

  end

end