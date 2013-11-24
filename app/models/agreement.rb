class Agreement < ActiveRecord::Base

  belongs_to :users
  serialize :consent

  def self.to(user, consent, action, action_id)
    this_agreement = self.current(user.id, action, action_id)

#raise this_agreement.inspect
    if(this_agreement && this_agreement.consent.include?(consent.to_s))
      return true
    else
      return false
    end
  end

  def self.current(user_id, action, action_id)
    self.where(['user_id = ? AND action = ? AND action_id = ?', user_id, action, action_id]).order('created_at DESC').first
  end

  def self.add(user_id, consent, action, action_id)

    this_agreement = self.current(user_id, action, action_id)
    consent = consent.split(', ')

    if this_agreement == nil
      self.create(:user_id => user_id, :action => action, :action_id => action_id, :consent => consent)
    else
      this_agreement.update_attributes(:consent => this_agreement.consent.concat(consent))
    end
  end

  def self.remove(user_id, consent, action, action_id)

    this_agreement = self.current(user_id, action, action_id)
    consent = consent.split(',')

    if this_agreement != nil
      consent.each do |c|
        this_agreement.consent.delete(c)
      end

      this_agreement.update_attributes(:consent => this_agreement.consent)
    end
  end

  def self.update_all_agreements(action_id, action, agreement)  
    
    self.transaction do
      self.delete_all(["action_id = ? AND action = ?", action_id, action])

      if agreement
        agreement.each do |a|     

          consent = ''
          separator = ''
          a[1].each do |key, value|
            consent << "#{separator}#{key.to_s}"
            separator = ', '
          end

          self.add(a[0], consent, action, action_id)
        end
      end
    end

  end


end
