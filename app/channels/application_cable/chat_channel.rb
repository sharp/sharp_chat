class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end

  def receive(data)
    recipients = data['recipients']
    users = User.where(username: recipients)
    for user in users
      if user.online
        ChatChannel.broadcast_to(user, data)
      else
        Message.create(from: data['from'], to: user.username, content: data['content'])
      end
  end
end
