# -*- coding: utf-8 -*-
require "spec_helper"

describe ApplicationHelper do
  describe "#member_has_infos?" do
    before :each do
      @member = Member.new  organisation: "la cordée"
    end

    it "returns true if organisation is present" do
      helper.member_has_infos?(@member).should == true
    end
  end

  describe "hello" do

    it "should say Good Evening and not Good Morning" do
      Timecop.freeze(Time.local(2012, 9, 1, 19, 0, 0)) do
        hello.should == t(:good_evening)
      end
    end

    it "should say Good Morning Sunshine" do
      Timecop.freeze(Time.local(2012, 9, 1, 6, 0, 0)) do
        hello.should == t(:good_morning)
      end
    end
  end
  
  describe "is_admin" do
    let(:current_user) { @current_user }
    
    it "should not idenity a dumb user as an admin" do
      @current_user = Factory.build(:user)
      is_admin.should be_false
    end
    
    it "should identify an admin" do
      @current_user = Factory.build(:admin)
      is_admin.should be_true
    end
    
    it "should not identify an admin when view as user" do
      @current_user = Factory.build(:admin, view_as_user: true)
      is_admin.should be_false
    end
    
  end
end