require 'spec_helper'

describe Member do
  subject { FactoryGirl.create(:member) }

  after(:all) do
    DatabaseCleaner.clean
  end

  describe "a user trying to edit things" do
    before do
      @user = FactoryGirl.create :user
    end

    context "has privilege" do
      before do
        #TODO admin role
        @user
      end

      it "should edit himself" do
        Member.can_edit?(@user, @user.member.id).should be_true
      end

      it "should edit someone else's profile" do
        @user2 = FactoryGirl.create :user
        Member.can_edit?(@user, @user2.member.id).should be_false
      end

    end
    context "has no privilege" do
      it "shouldn't edit someone else's profile" do
        @user2 = FactoryGirl.create :user
        Member.can_edit?(@user, @user2.id).should be_false
      end

      it "should edit himself" do
        Member.can_edit?(@user, @user.id).should be_true
      end

    end
  end

end

