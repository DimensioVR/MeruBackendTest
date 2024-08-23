# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    include RackSessionFix
    respond_to :JSON
private
    #responder si hay un error
    def respond_with(resource, _opts = {})
    if request.method == 'POST' && resource.persisted?
      render json: {
        status: { message: 'Signed up sucessfully.'},
        data: resource
      }, status: :ok
    elsif request.method == 'DELETE'
      render json: {
        message: 'Account deleted successfully.'
      }, status: :ok
    else
      render json: {
        status: {message: "User couldn't be created successfully. ", 
    errors: resource.errors.full_messages.to_sentence}
      }, status: :unprocessable_entity
    end
  end   
end
