require 'faker'

puts "Deleting everything"
Task.destroy_all

puts "Creating 5 random tasks"
5.times do 
    Task.create(title: "#{Faker::Verb.base} #{Faker::House.furniture} in the #{Faker::House.room}", details: Faker::TvShows::BojackHorseman.quote, completed: false )
end

puts "Complete"