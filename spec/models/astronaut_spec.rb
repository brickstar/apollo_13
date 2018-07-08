require 'rails_helper'

describe Astronaut, type: :model do
  before(:each) do
    @astronaut1 = Astronaut.create!(name: 'Neil', age: '37', job: 'Commander')
    @astronaut2 = Astronaut.create!(name: 'Buzz', age: '33', job: 'MoonWalker')

    @space_mission_1 = @astronaut1.space_missions.create!(title: 'Lunar Mission', trip_length: 100)
    @space_mission_2 = @astronaut1.space_missions.create!(title: 'Mars Mission', trip_length: 200)
    @space_mission_3 = @astronaut2.space_missions.create!(title: 'Neptune Mission', trip_length: 300)
    @space_mission_4 = @astronaut2.space_missions.create!(title: 'Pluto Mission', trip_length: 400)
  end

  describe 'Class Methods' do
    describe '.average_age' do
      it 'should return avg age for all astronauts' do

        expect(Astronaut.average_age).to eq(35)
      end
    end

  describe 'Instance Methods' do
    describe '.total_space_time' do
      it 'should return a total time spent in space' do

          expect(@astronaut1.total_space_time).to eq(300)
        end
      end
    end
  end
end
