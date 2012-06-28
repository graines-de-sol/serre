require 'spec_helper'

describe PhoneHelper do

  describe "phone_number" do

    it "should return a well formated phone number" do
      phone_number("0601020304").should == "06 01 02 03 04"
    end

    it "should not return a well formated phone number when phone number is a random string" do
      phone_number("hello world").should == "hello world"
    end

    it "should return a well formated phone number when int format provided" do
      phone_number("+33601020304").should == "+33 6 01 02 03 04"
    end

    it "should return a well formated phone number when int format provided with spaces" do
      phone_number("+33 6 01 02 03 04").should == "+33 6 01 02 03 04"
    end

    it "should return a well formated phone number when int format provided with spaces" do
      phone_number("+44 6 01 02 03 04").should == "+44 6 01 02 03 04"
    end
  end
end