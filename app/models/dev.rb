class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def recieved_one?(item)
    freebies.all.find do |freebie|
      freebie.item_name.include?(item)
    end
  end

  def give_away(dev, freebie)
    gift = freebies.find do |item|
      item.item_name == freebie
    end
    if gift.dev_id == self.id
      gift.dev_id = dev
      gift.save
    end
  end
end
