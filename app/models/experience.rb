class Experience < ActiveRecord::Base
  include Resume
  belongs_to :user
  
  def from_txt
    self.from.strftime("%b-%Y")
  end
  
  def to_txt
    i = self.to.strftime("%b-%Y")
    out = (i == Date.today.strftime("%b-%Y") ? "Present" : i)
    out
  end
  
  def link
   self.company_link
  end
end
