class EventPage
  include Scrapeable

  @@base_url = 'http://berghain.de/event/'

  def initialize(id)
    @document = Nokogiri::HTML open "#{@@base_url}#{id}"
  end

  def lineup_by_room
    room_names.map.with_index do |room_name, i|
      room_node = @document.css('.running_order')[i]
      raw_room_lineup(room_node)
    end
  end

  def raw_room_lineup(room_node)
    room_node.css('li').map do |node|
      act = {}
      if (times_are_set?)
        act[:raw_time] = node.at_css('.running_order_time').text.strip
      end
      act[:raw_artist] = node.at_css('.running_order_name').text.strip
      act
    end
  end
  def times_are_set?
    !@document.css('.running_order .running_order_time').empty?
  end

  private

  def start_date
    @document.css('.headline').text.split('/')[0].strip.to_date
  end

  def room_names
    @document.css('.col_context > .type_dancefloor_color').map do |node|
      node.text.sub('Running Order', '').strip
    end
  end

end