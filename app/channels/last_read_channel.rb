# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class LastReadChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  def update(data)
  	chatroomuser = current_user.chatroomusers.find_by(chatroom_id: data["chatroom_id"])
  	
  end
end
