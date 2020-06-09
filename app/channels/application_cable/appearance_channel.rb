class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    current_user.appear
  end

  def unsubscribed
    current_user.disappear
  end

  def appear(data)
    current_user.update(online: true)
    Message.where(to: current_user, viewed: false).each do |msg|
      ChatChannel.broadcast_to(
        msg.to,
        from:  msg.from,
        body: 'test'
      )
    end
  end

  def away
    current_user.away
  end
end
