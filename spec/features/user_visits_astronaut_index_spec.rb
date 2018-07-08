require 'rails_helper'

describe 'user' do
  describe 'visits astronauts index' do
    before(:each) do
      @astronaut1 = Astronaut.create!(name: 'Neil', age: '37', job: 'Commander')
      @astronaut2 = Astronaut.create!(name: 'Buzz', age: '33', job: 'MoonWalker')

      @space_mission_1 = @astronaut1.space_missions.create!(title: 'ZZZLunar Mission', trip_length: 100)
      @space_mission_2 = @astronaut1.space_missions.create!(title: 'Mars Mission', trip_length: 200)
      @space_mission_3 = @astronaut2.space_missions.create!(title: 'Neptune Mission', trip_length: 300)
      @space_mission_4 = @astronaut2.space_missions.create!(title: 'Pluto Mission', trip_length: 400)
    end

    it 'should see a list of astronauts, name, age, job' do

      visit astronauts_path

      expect(page).to have_content("Astronaut: #{@astronaut1.name}")
      expect(page).to have_content("Age: #{@astronaut1.age}")
      expect(page).to have_content("Job: #{@astronaut1.job}")
    end

    it 'should see the avg age of all astronauts' do

      visit astronauts_path

      expect(page).to have_content("Average Age of Astronauts: #{Astronaut.average_age}")
    end

    it "should see astronauts' missions listed alphabetically" do

      visit astronauts_path

      expect(page).to have_content(@space_mission_1.title)
      expect(page).to have_content(@space_mission_2.title)
      expect(page).to have_content(@space_mission_3.title)
      expect(page).to have_content(@space_mission_4.title)
      expect(@space_mission_2.title).to appear_before(@space_mission_1.title)
      expect(@space_mission_3.title).to appear_before(@space_mission_4.title)
    end

    it 'should see total time in space for each astronaut' do

      visit astronauts_path

      expect(page).to have_content("Total Space Time: #{@astronaut1.total_space_time}")
      expect(page).to have_content("Total Space Time: #{@astronaut2.total_space_time}")
    end
  end
end
