class MessagesController < ApplicationController
  
  def new
    robot_box = params[:robot]
    message = {
      name: params[:name],
      email: params[:email],
      content: params[:message]
    }

    if robot_box
      render json: "Robot alert!", status: 400
    elsif message.values.any?(&:blank?)
      render json: "Content can't be blank.", status: 400
    else
      MyMailer.visitor_email(message).deliver
      render json: message.to_json
    end
  end
  
end