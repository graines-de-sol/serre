require 'spec_helper'

describe 'Blog', :js => true do

  before(:all) do
    FactoryGirl.create :conf
    FactoryGirl.create :user, :role => 'user'
    (1..3).each do |i|
      FactoryGirl.create :blog_category
    end

    (1..3).each do
      FactoryGirl.create :post
    end

    FactoryGirl.create :post, :blog_category_id => 1, :published_at => Time.now - 1.month
  end

  before (:each) do
    visit '/users/sign_in'
    fill_in('user_email', :with => 'testing1@example.com')
    fill_in('user_password', :with => 'testing')
    click_button I18n.t('devise.common.sign_in')
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  it "visit blog index" do
    visit '/blog'

    page.should have_content('Post number 1')
    page.should have_content('Post number 2')
    page.should have_content('Post number 4')

    page.should_not have_content(I18n.t('blog.create_post'))
    page.should_not have_content('Post number 3')
  end

  it "visit blog show" do
    visit '/blog/1'

    page.should have_content('Post number 1')
    page.should have_content('category 1')

    page.should_not have_content(I18n.t('blog.edit_this_post'))
    page.should_not have_content('Post number 2')
    page.should_not have_content('Post number 3')
    page.should_not have_content('Post number 4')
  end

  it "visit blog category" do
    visit '/blog'
    click_link 'category 1'

    page.should have_content('Post number 1')
    page.should have_content('Post number 4')

    page.should_not have_content('Post number 2')
    page.should_not have_content('Post number 3')
  end

  it "visit blog archives" do
    visit '/blog'
    click_link "#{I18n.l(Time.now - 1.month, :format => :archives_month)}"

    page.should have_content('Post number 1')
    page.should have_content('Post number 4')

    page.should_not have_content('Post number 2')
    page.should_not have_content('Post number 3')
  end

end

