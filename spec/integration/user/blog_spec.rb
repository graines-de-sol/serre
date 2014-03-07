require 'spec_helper'

describe 'Blog', :js => true do

  before :each do
    factories_for_blog_section

    @user = FactoryGirl.create :user, :role => 'admin'
    login_as @user, :scope => :user
       
    @post = Post.first
  end

  it "shows all last posts in index" do
    visit '/blog'

    page.should have_content('post number 1')
    page.should have_content('post number 2')

    page.should_not have_content(I18n.t('blog.create_post'))
  end

  it "shows a detailed blog post" do
    visit "/blog/#{@post.id}"

    page.should have_content(@post.title)
  end

  it "lists all posts in a category" do
    visit '/blog'
    click_link @post.blog_category.name

    page.should have_content(@post.title)
  end

  it "lists all archived posts in a given month" do
    visit '/blog'

    click_link "#{I18n.l(Time.now - 1.month, :format => :archives_month)}"

    page.should have_content('last month post')
  end

end

