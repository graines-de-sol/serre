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
end
