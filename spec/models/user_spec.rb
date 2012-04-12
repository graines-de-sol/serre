require 'spec_helper'

describe User do
  subject { FactoryGirl.create(:user) }

  describe "build default member" do
    it "should build a member with the user" do
      subject.member.should be_a(Member)
      subject.member.should be_persisted
    end
  end
end
