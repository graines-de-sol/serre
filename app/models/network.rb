class Network < ActiveRecord::Base

  has_many :members
  has_many :members, :through=>:profiles

  scope :is_pro,  :conditions => {:is_pro => true}, :order=>'name ASC'
  scope :is_perso,  :conditions => {:is_pro => false}, :order=>'name ASC'

  # Intersect all available networks with user's own social profiles
  def self.with_urls(profiles, usage)

    usage == :pro ? networks = self.is_pro : networks = self.is_perso

    a = Array.new
    networks.each do |network|
      out = Hash.new
      network.attributes.each do |k, v|
        out.update(k.to_sym => v)
      end

      profiles.each do |p|
        out.update(:url=>p[network.id]) if p[network.id]
      end
      a.push(out)
    end

    return a
  end

end

