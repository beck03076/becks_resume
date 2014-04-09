require 'spec_helper'

describe "LoginWithGoogle" do

  it "should have a sign in button" do
      visit root_path
      page.should have_css('header a#sign_in')
  end
  
  it "should login with gmail", js: true do
      login
  end


end

