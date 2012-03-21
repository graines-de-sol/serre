class Survey < ActiveRecord::Base

  belongs_to :location
  serialize  :voters

  acts_as_tree :order => 'id', :dependent=>:destroy

  scope :questions, :conditions => "parent_id = 0"

  # Render survey's results as percents
  def self.results(survey)
    top = 0
    survey.children.each do |child|
      top += child.score
    end

    out = Hash.new
    survey.children.each do |child|
      top == 0 ? percents = 0 : percents = (child.score.to_f/top.to_f)*100
      out.update(child.id => percents.to_i)
    end

    return out
  end

  def self.vote(member_id, vote)

    answer = Survey.find(vote)

    answer.update_attributes(
      :score => answer.score += 1,
      :voters=> answer.voters.push(member_id)
    )

    answer.parent.update_attributes(
      :voters=> answer.parent.voters.push(member_id)
    )

  end
end

