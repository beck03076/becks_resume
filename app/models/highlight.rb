class Highlight < ActiveRecord::Base
  include Resume
  
  belongs_to :user  
end
