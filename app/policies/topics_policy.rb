class TopicPolicy   
   def show?
     record.public? || user.present?
   end
end