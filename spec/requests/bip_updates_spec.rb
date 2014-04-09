require 'spec_helper'

describe "LoginUpdateWithBestInPlace" do

  before(:each) do
    login
  end
  
    it "update name and summary", js: true do 
      @user = FactoryGirl.build(:user)
      %w(first_name middle_name last_name).each do |i|
        update_and_check_user(i,@user.send(i.to_sym))
      end
      
      span = "span#best_in_place_user_1_summary"
      page.first(span).click 
      find(:css, "textarea").set(@user.summary)
      page.driver.browser.execute_script("$('textarea').blur();") 
      page.first(span).text.should == @user.summary
    end
    
    it "update activatored links", js: true do     
      %w(language framework skill_topic ).each do |i|
        update_and_check_activators(i,"Mozart")
      end
    end
    
    it "update regular links", js: true do     
        update_and_check(skill_topic,"Mozart")
      end
    end
end
