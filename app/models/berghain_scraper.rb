require 'open-uri'

class BerghainScraper

  @@base_url = "http://berghain.de/event/"
  attr_accessor :document

  def initialize(id)
    @document = Nokogiri::HTML open "#{@@base_url}#{id}"
    @start_date = start_date
  end

  def parse

  end 

  def start_date
    @document.css('.headline').text.split('/')[0].strip.to_date
  end

  def running_order_hash
  end



  def room_names
    @document.css('.col_context > .type_dancefloor_color').map do |node|
      node.text.sub('Running Order', '').strip
    end
  end

  def room_running_order(index)

  end

end