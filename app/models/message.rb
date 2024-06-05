class Message < ApplicationRecord
  after_create_commit :broadcast_message
  after_update_commit :broadcast_updated_message
  after_destroy_commit :broadcast_deleted_message


  private

    def broadcast_message
      ActionCable.server.broadcast('MessagesChannel', {
        body: body,
        user_created: user_created,
        name: name,
        email: email,
        image: image,
        create_message: true
      })
    end

    def broadcast_deleted_message
      ActionCable.server.broadcast('MessagesChannel', {
        body: body,
        user_created: user_created,
        name: name,
        email: email,
        image: image,
        id: id,
        delete_message: true
      })
    end

    def broadcast_updated_message
      ActionCable.server.broadcast('MessagesChannel', {
        body: body,
        user_created: user_created,
        name: name,
        email: email,
        image: image,
        id: id,
        update_message: true
      })
    end
  
  
  end