get '/' do
  # render home page
  @users = User.all

  erb :index
end

get '/skills/edit' do

  if logged_in?
    @skills = Skill.all
    @user_skills = current_user.skills
    @user_formal_proficiencies = current_user.proficiencies.select { |proficiency| proficiency.formal_education == true }
    erb :skills
  else
    redirect to('/sessions/new')
  end
end

post '/skills' do  
  years_of_experience = params[:years_of_experience]
  skill_ids = params[:proficiencies]
  formal_education = params[:formal_education]

  proficiency_data = skill_ids.zip(years_of_experience, formal_education)

  current_user.proficiencies.each do |proficiency|
    proficiency.destroy
  end

  proficiency_data.each do |data|
    current_user.proficiencies.create(skill_id: data[0], years_of_experience: data[1], formal_education: !data[2].nil?)
  end

  redirect to('/')

end

# {"years_of_experience"=>["", "", "", "", "", "", "", "", "", ""], "proficiencies"=>["4", "5"], "formal_education"=>["4"]}
