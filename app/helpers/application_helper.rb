module ApplicationHelper
  def tym(i)
    i.strftime("%b-%d")
  end
  
  def titled(i)
    i.titleize    
  end
  
  def bip_name_link(i,name = nil ,link = nil)
    @tour = {ruby_on_rails: "r-o-r", pl_sql: "p-s", :'beck03076@so' => "s-o"}
    name = name || :name
    link = link || :link
    html = ""    
    html += best_in_place i,
                          name,
                          activator: "." + h_this(name, i),
                          display_with: lambda { |url| link_to i.send(name).titleize, 
                                                               i.send(link), 
                                                               {target: "_blank",
                                                                data: {id: i.id},
                                                                class: "bip-link-skill" } },
                          classes: tour_cl(i,name)
    html += best_in_place i,
                          link,
                          activator: "." + h_this(link, i),
                          classes: "hidable hide"
                          
    html.html_safe
  end
  
  def tour_cl(i,name)
    n = i.send(name).titleize.downcase.tr(" ","_").to_sym
    (@tour.keys.include?(n) ? @tour[n] : "")
    
  end
  
  def bip_activators(i,flag = nil,name = nil ,link = nil)
     name = name || :name
     link = link || :link
     html = ""
     html += link_to "name".html_safe,"#", {class: h_this(name, i)}
     html += " | "
     html += link_to "link","#", {class: h_this(link, i)}
    
     ((flag.nil? ? "" : "Edit #{i.name.titleize} - ") + html).html_safe
  end
  
  def h_this(i,j)
     "#{i.to_s}-#{j.class.name.downcase}-#{j.id}"
  end
  
  def figure_out(l)
    if l == "so"
      out = "StackOverFlow"
    elsif l == "fb"
      out = "Facebook"
    else
      out = l
    end    
    out 
  end
end
