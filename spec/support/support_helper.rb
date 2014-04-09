module SupportHelper

  $clean_except = %w[skills skill_topics languages frameworks experiences highlights]

  def ready_user
    
    DatabaseCleaner.strategy = :truncation, {except: $clean_except}
    
    User.create!(first_name: "senthil", middle_name: "kumar", last_name: "muthamizhan", summary: "4 years of programming experience through all the phases of software development. And a really happy rails developer!", email: "senthilkumar.hce@gmail.com", mobile: "+91 98439 03076", address: "F4, Mahalakshmi Flats, VijayaNagar 8 Main Road, Velachery", github_text: "beck03076@gh", github_link: "https://github.com/beck03076", twitter_text: "beck03076@tw", twitter_link: "https://twitter.com/beck03076", fb_link: "https://www.facebook.com/beck03076", fb_text: "beck03076@fb", so_text: "beck03076@so1", so_link: "http://stackoverflow.com/users/522899/beck03076")
    
    resources = %w(language framework skill experience highlight)
    
    resources.each do |i|
      User.first.send(i.pluralize) << i.camelize.constantize.all
    end
    
  end
  
  def clean_db
    DatabaseCleaner.strategy = :truncation,{except: $clean_except}
  end
  
  def login
    visit root_path
    page.driver.browser.manage.window.maximize
    page.first("a#sign_in").click
    if !page.first('input#Email').blank?
      fill_in 'Email', :with => 'senthilkumar.hce@gmail.com'
      fill_in 'Passwd', :with => 'Agentap1'
      page.first("input#signIn").click
      sleep(inspection_time=10)
      page.first("button#submit_approve_access").click    
      p "========= FRESH LOGIN ========="
    else
      p "========= ALREADY LOGGED IN ========="
    end
      page.should have_content('Hello!')
  end
  
  def update_and_check(field,value)
    span = "span[id^='best_in_place_#{field}_']"
    page.all(:css, span).each do |el|
      el.click
      fill_blur(value)
      el.text.should == value
    end
  end
  
  def update_and_check_user(field,value)
    span = "span#best_in_place_user_1_" + field
    page.first(span).click  
    fill_blur(value)
    page.first(span).text.should == value
  end
  
  def update_and_check_activators(field,value)
    span = "span[id^='best_in_place_#{field}_']"
    page.all(:css, span).each do |el|
      page.first(el["data-activator"]).click
      fill_blur(value)
      el.text.should == value
    end
  end
  

  
  def fill_blur(val)
    find(:css, "form[class$='form_in_place'] input").set(val)
    page.driver.browser.execute_script("$('.form_in_place input').blur();") 
  end

end
