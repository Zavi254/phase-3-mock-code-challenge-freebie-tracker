class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebies(dev, item, value)
    Freebie.create(company_id: self.id,dev_id: dev, item_name: item,value: value)
    self
  end

  def self.oldest_company
    all.sort_by { |company| company.founding_year }.first
  end
end
