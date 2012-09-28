require 'spec_helper'

describe 'Ads', :js => true do

  before (:each) do
    visit '/users/sign_in'
    fill_in('user_email', :with => 'testing1@example.com')
    fill_in('user_password', :with => 'testing')
    click_button I18n.t('devise.common.sign_in')
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  it "visit ads home page" do
    visit '/ads'

    page.should have_content(I18n.t('create_ad'))
  end

end

