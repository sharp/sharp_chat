class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end

  def receive(data)
    recipient = data['recipient']
    user = User.where(username: recipient).first
    ChatChannel.broadcast_to(recipient, data) if user.present? && user.online
  end
end
