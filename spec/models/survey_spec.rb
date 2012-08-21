require 'spec_helper'

describe Survey do

  after(:each) do
    DatabaseCleaner.clean
  end

	before :all do
		@member = Member.new(first_name: "Bobby", user_id: 1)
		@answer = FactoryGirl.create(:answer)

	end


	describe "when voting an answer" do

		describe "vote on survey" do
			it "should increment score" do
				existing_score = @answer.score
		    Survey.vote(@member.id, @answer.id)

				@answer.reload
				@answer.score.should == existing_score + 1
				@answer.voters.should include @member.id
				@answer.parent.voters.should include @member.id
			end
		end
	end
end

