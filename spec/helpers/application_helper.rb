require 'spec_helper'

describe ApplicationHelper do

  describe '#member_has_profile?' do
  
    it "should return false if there is no network" do
      networks = []
      ApplicationHelper.member_has_profile?(networks).should be_false
    end
    
    it "should return false if there is no valid network" do 
      networks = [{}]
      ApplicationHelper.member_has_profile?(networks).should be_false
    end
    
    it "sould return true if there is at least one valid network" do 
      networks = [{},{url: 'toto'}]
      ApplicationHelper.member_has_profile?(networks).should be_true
    end
    
  end
end
