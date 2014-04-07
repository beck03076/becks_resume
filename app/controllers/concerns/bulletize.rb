module Bulletize
  # ===========
  # = Methods =
  # ===========

       def bullet(i)
         (" &#8226;&nbsp;&nbsp;" + i.gsub(/\|/,"<br/> &#8226;&nbsp;&nbsp;"))
       end
      

end
