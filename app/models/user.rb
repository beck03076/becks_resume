class User < ActiveRecord::Base
  has_many :experiences
  has_many :highlights
  has_many :skills
  has_many :skill_topics
  has_many :languages
  has_many :frameworks 

  
  def self.from_omniauth(auth)
      check = where(auth.slice(:provider, :uid))
      if check.blank? 
        user = User.first.dup include: [:languages, :frameworks, :skills, :experiences, :highlights]
          user.first_name = "New"
          user.middle_name = "User"
          user.last_name = "Editable"
          user.email = auth.info.email
          user.provider = auth.provider
          user.uid = auth.uid
          user.provider_name = auth.info.name
          user.oauth_token = auth.credentials.token
          user.oauth_expires_at = Time.at(auth.credentials.expires_at)
          user.save!
          user
      else
        return check.first
      end
  end
  
  def name
    [first_name,middle_name,last_name].join(" ").titleize
  end
  
  def beck?
    self.email == "senthilkumar.hce@gmail.com"
  end
  
  def fname
    first_name.titleize
  end
  
  def mname
    middle_name.titleize
  end
  
  def lname
    last_name.titleize
  end
  
end
