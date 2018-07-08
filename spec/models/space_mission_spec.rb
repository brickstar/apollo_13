require 'rails_helper'

describe SpaceMission, type: :model do
  before(:each) do
    @astronaut1 = Astronaut.create!(name: 'Neil', age: '37', job: 'Commander')
    @astronaut2 = Astronaut.create!(name: 'Buzz', age: '33', job: 'MoonWalker')

    @space_mission_1 = @astronaut1.space_missions.create!(title: 'ZLunar Mission', trip_length: 100)
    @space_mission_2 = @astronaut1.space_missions.create!(title: 'Mars Mission', trip_length: 200)
    @space_mission_3 = @astronaut2.space_missions.create!(title: 'Neptune Mission', trip_length: 300)
    @space_mission_4 = @astronaut2.space_missions.create!(title: 'Pluto Mission', trip_length: 400)
  end

  describe 'Class Methods' do
    describe '.alpabetize' do
      it 'should return sorted space missions' do

        expect(SpaceMission.alphabetize).to eq([@space_mission_2,
                                                @space_mission_3,
                                                @space_mission_4,
                                                @space_mission_1])
      end
    end
  end
end
