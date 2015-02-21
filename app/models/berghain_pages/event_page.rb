class EventPage
  include Scrapeable
  
  @@base_url = 'http://berghain.de/event/'

  def initialize(id)
    @document = Nokogiri::HTML open "#{@@base_url}#{id}"
    @start_date = start_date
  end

  def start_date
    @document.css('.headline').text.split('/')[0].strip.to_date
  end

  def times_are_set?
    !@document.css('.running_order .running_order_time').empty?
  end

  def running_order_by_room
    room_running_order_hash = {}
    room_names.each.with_index do |room_name, i|
      room_set_nodes = @document.css('.running_order')[i]
      room_running_order_hash[room_name] = room_running_order_raw(i)
    end
  end

  def room_running_order_raw(index)
    @document.css('.running_order')[index].children.map do |node|
      act = {}
      if (times_are_set)
        act[:raw_time] = node.children('.running_order_time').text.strip
      end
      act[:raw_artist] = node.children('.running_order_name').text.strip
      act
    end
  end

  def room_names
    @document.css('.col_context > .type_dancefloor_color').map do |node|
      node.text.sub('Running Order', '').strip
    end
  end

  def room_running_order(index)

  end
end