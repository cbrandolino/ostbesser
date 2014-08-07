class ProgramController < ApplicationController
  def index
    @dates = [
      {
        date: Date.new(2014, 10, 10),
        time_start: DateTime.new(2014, 10, 10, 23, 59, 00, '+2'),
        time_end: DateTime.new(2014, 10, 12, 12, 00, 00, '+2'),
        name: 'Klubnacht',
        events: [
          location: 'Panorama Bar',
          sets: [
            {
              dj: "the black madonna",
              time_start: DateTime.new(2014, 10, 10, 23, 59, 00, '+2'),
              time_start: DateTime.new(2014, 10, 11, 2, 00, 00, '+2')
            }
          ]
        ]
      },
      {
        date: Date.new(2014, 10, 10),
        time_start: DateTime.new(2014, 10, 10, 23, 59, 00, '+2'),
        time_end: DateTime.new(2014, 10, 12, 12, 00, 00, '+2'),
        name: 'Klubnacht',
        events: [
          location: 'Panorama Bar',
          sets: [
            {
              dj: "the black madonna",
              time_start: DateTime.new(2014, 10, 10, 23, 59, 00, '+2'),
              time_start: DateTime.new(2014, 10, 11, 2, 00, 00, '+2')
            }
          ]
        ]
      }
    ]
    @dates.map! { |el| OpenStruct.new el } 
  end
end