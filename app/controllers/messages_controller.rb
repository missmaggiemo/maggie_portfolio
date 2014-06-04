class MessagesController < ApplicationController
  
  def new
    message = { 
      name: params[:name], 
      email: params[:email], 
      content: params[:content] 
    }
    
    if message.values.any?(&:blank?)
      render json: "Content can't be blank.", status: 400
    else
      MyMailer.visitor_email(message).deliver
      render json: message.to_json
    end
  end
  
end