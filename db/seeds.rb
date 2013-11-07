require 'faker'



# create a few technical skills
computer_skills = %w(Ruby Sinatra Rails JavaScript jQuery HTML CSS)
computer_skills.each do |skill|
  Skill.create :name => skill, :context => 'technical'
end

# create a few creative skills
design_skills = %w(Photoshop Illustrator Responsive-Design)
design_skills.each do |skill|
  Skill.create :name => skill, :context => 'creative'
end

# create a few users
User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
5.times do
  user = User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password'
  2.times do
    user.proficiencies.create(skill_id: rand(1..10), years_of_experience: rand(1..10), formal_education: [true, false].sample)
  end
end
