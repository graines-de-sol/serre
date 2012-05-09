# -*- coding: utf-8 -*-
require "spec_helper"

describe ApplicationHelper do
  before :each do
    @member = Member.new  organisation: "la cordée"
  end

  describe "#member_has_infos?" do
    it "returns true if organisation is present" do
      helper.member_has_infos?(@member).should == true
    end
  end
end
