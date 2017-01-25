# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'



get '/' do
  erb :index
  #erb :layout
end


get '/new' do
  erb :new_contact
end

get '/about' do
  erb :about
end

post '/' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end
