class Survey < ActiveRecord::Base

  belongs_to :location
  serialize  :voters

  acts_as_tree :order => 'id', :dependent=>:destroy

  scope :questions, :conditions => "parent_id = 0", :order => 'created_at DESC'
  scope :surveys_for_location, lambda {|location_id|
    self.where(['location_id = ? AND parent_id = 0', location_id]).order('created_at DESC')
  }

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

    answer.score += 1
    answer.voters << member_id

    answer.parent.voters << member_id

    answer.save
    answer.parent.save
  end
end

