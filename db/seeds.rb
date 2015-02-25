 require 'faker'
 
 # Create Posts
 50.times do
   Wiki.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 wikis = Wiki.all

 50.times do
  collaborator = Collaborator.create(
    user: users.sample,
    wiki: wikis.sample,
    )
end
 

 
 puts "Seed finished"
 puts "#{Wiki.count} posts created"
 puts "#{Collaborator.count} collaborators created"
