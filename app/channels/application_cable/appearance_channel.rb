class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    current_user.update(online: true)
  end

  def unsubscribed
    current_user.update(online: false)
  end

  def appear(data)
    current_user.update(online: true)
    Message.where(to: current_user, viewed: false).order('created_at desc').each do |msg|
      ChatChannel.broadcast_to(
        msg.to,
        from:  msg.from,
        body: 'test'
      )
    end
  end

  def away
    current_user.update(online: false)
  end
end
