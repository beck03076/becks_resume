module Resume

  def edit
    "<span class='pilled'>edit</span>".html_safe
  end
  
  def comp_link
    self.link.gsub('http://', '') rescue nil
  end
  # methods to be included 
  module ClassMethods   

  end
end


