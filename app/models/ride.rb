class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction

  def take_ride
    if enough_tickets_and_tall_enough != nil
      enough_tickets_and_tall_enough
    elsif enough_tickets != nil
      enough_tickets
    elsif tall_enough != nil
      tall_enough
    else
      ticket_update
      happiness_update
      nausea_update
    end
  end

  def find_user
    User.find(self.user_id)
  end

  def find_attraction
    Attraction.find(self.attraction_id)
  end

  def enough_tickets
    if find_user.tickets < find_attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end
  end

  def tall_enough
    if find_user.height < find_attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def enough_tickets_and_tall_enough
    if tall_enough != nil && enough_tickets != nil
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def ticket_update
    user_tickets = find_user.tickets - find_attraction.tickets
    find_user.update(tickets: user_tickets)
  end

  def happiness_update
    user_happiness = find_user.happiness + find_attraction.happiness_rating
    find_user.update(happiness: user_happiness)
  end

  def nausea_update
    user_nausea = find_user.nausea + find_attraction.nausea_rating
    find_user.update(nausea: user_nausea)
  end

end
