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
end