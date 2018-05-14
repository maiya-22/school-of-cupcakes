# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "time"
# @student_educations = ['kintergarden', 'first grade', 'second grade', 'third grade']
# pics = ['https://robohash.org/jenni', 'https://robohash.org/joe', 'https://robohash.org/charlie', 'https://robohash.org/alice']

# index = 0
# 20.times do 
#     @random_name = Faker::Name.first_name
#     Student.create([{
#         first_name: @random_name,
#         last_name: Faker::Name.last_name,
#         age: Random.new.rand(5) + 4,  
#         profile: Faker::HowIMetYourMother.quote,
#         pic: "https://robohash.org/#{@random_name}",
#         education: @student_educations[Random.new.rand(@student_educations.length)],
#         person_type: "student"
#         }])
#         index+=1
# end


# @teacher_educations = ['burns cookies','junior baker', 'apprenctice baker', 'master baker']
# index = 0
# 10.times do 
#     @random_name = Faker::Name.first_name
#     Teacher.create([{
#         first_name: @random_name,
#         last_name: Faker::Name.last_name,
#         pic: "https://robohash.org/#{@random_name}",
#         profile: Faker::HowIMetYourMother.quote,
#         age: Random.new.rand(20) + 20,  
#         education: @teacher_educations[Random.new.rand(@teacher_educations.length)],
#         salary: Random.new.rand(1000000) + 1,
#         person_type: "teacher"
#         }])
#         index+=1
# end


# 10.times do 
#     @random_name = Faker::Name.first_name
#     Course.create([{
#         name: Faker::Dessert.flavor + " " + Faker::Dessert.variety + "s with " +Faker::Dessert.topping,
#         description: Faker::Lorem.sentence(5),
#         pic: "https://media.istockphoto.com/photos/scoop-of-vanilla-ice-cream-isolated-on-white-background-picture-id522386716?k=6&m=522386716&s=612x612&w=0&h=P4D36niylqS4cOKAXc3r7BZ1DOz5A6F0deGXRjd7tvM=",
#         hours: Random.new.rand(5) + 1
#     }])
# end

Time.new(2002, 10, 31)

@teacher_id = 0
@day = Random.new.rand(20) + 1
@month = Random.new.rand(12) + 1
@year = Random.new.rand(1) + 2017 
20.times do
    @start = Time.new(@year, @month, @day)
    @month = @month + 6;
    if(@month > 12) 
        @month -= 12
        @year += 1
    end
    @end = Time.new(@year, @month, @day)
    Cohort.create([{
        name: Faker::Dessert.flavor + " " + Faker::Dessert.variety + " Cohort",
        start:@start,
        end:@end,
        teacher_id: @teacher_id
    }])

    @teacher_id += 1
end

