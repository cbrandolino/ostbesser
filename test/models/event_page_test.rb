require 'test_helper'

class EventPageTest < ActiveSupport::TestCase

  def setup
    stub_from_html_fixture 'http://berghain.de/event/1249'  # Times are not there
    stub_from_html_fixture 'http://berghain.de/event/1249_short'
    stub_from_html_fixture 'http://berghain.de/event/1243'  # Times are there
    stub_from_html_fixture 'http://berghain.de/event/1243_short'
    stub_from_html_fixture 'http://berghain.de/event/680'   # Summer

  end

  test 'should initialize correctly' do
    scraper = EventPage.new(1243)
    assert_instance_of Nokogiri::HTML::Document, scraper.document
  end

  test 'should return name of rooms' do
    scraper = EventPage.new(1243)
    assert_equal scraper.send(:room_names), ['Berghain', 'Panorama Bar']
    scraper = EventPage.new(680)
    assert_equal scraper.send(:room_names), ['Berghain', 'Panorama Bar', 'Sonntags']
  end

  test 'should return event start date' do
    scraper = EventPage.new(1243)
    assert_equal scraper.send(:start_date), '2015-02-07'.to_date
    scraper = EventPage.new(680)
    assert_equal scraper.send(:start_date), '2013-05-04'.to_date
  end

  test 'should detect whether set times are there' do
    scraper = EventPage.new(1243)
    assert scraper.times_are_set?
    scraper = EventPage.new(680)
    assert scraper.times_are_set?
    scraper = EventPage.new(1249)
    refute scraper.times_are_set?
  end

  test 'should return raw lineup by room, with times' do
    scraper = EventPage.new('1243_short')
    result = scraper.lineup_by_room
    assert_equal scraper.lineup_by_room, [
      [{:raw_time=>"23:59 h - 04:00 h", :raw_artist=>"Monoloc"}], 
      [{:raw_time=>"23:59 h - 04:00 h", :raw_artist=>"Albrecht Wassersleben"}]
    ]
  end

  test 'should return raw lineup by room, without times' do  
    scraper = EventPage.new('1249_short')
    result = scraper.lineup_by_room
    assert_equal scraper.lineup_by_room, [
      [{:raw_artist=>"Answer Code Request"}], 
      [{:raw_artist=>"Eamon Harkin & Justin Carter: Mister Saturday Night"}]
    ]
  end

end
