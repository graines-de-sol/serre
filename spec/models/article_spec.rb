require 'spec_helper'

describe Article do

  after(:each) do
    DatabaseCleaner.clean
  end

  describe "strip Google calendar snippet" do
    it "should success with original snippet" do
      article = FactoryGirl.create(:article)

      article.calendar = '<iframe src="https://www.google.com/calendar/embed?src=gbarillot%40gmail.com&ctz=Europe/Paris" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>'
      article.save.should be_true

      article.calendar.should == 'https://www.google.com/calendar/embed?src=gbarillot%40gmail.com&ctz=Europe/Paris'

    end
  end

end

