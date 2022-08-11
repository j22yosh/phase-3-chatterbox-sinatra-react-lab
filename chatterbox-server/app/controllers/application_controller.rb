class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    msg = Message.all.order(:created_at)
    msg.to_json
  end
  post '/messages' do
    msg = Message.create(
      body: params[:body],
      username: params[:username]
      )
    msg.to_json
  end
  patch '/messages/:id' do
  msg = Message.find(params[:id])
  msg.update(
    body: params[:body],
    username: params[:username]
  )
  msg.to_json
  end
  delete '/messages/:id' do
    msg = Message.find(params[:id])
    msg.destroy
    msg.to_json
  end

  
end
