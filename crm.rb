# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'

## Temporary fake data so that we always find contact with id 1.
Contact.create('Betty', 'Maker', 'betty@bitmakerlabs.com', 'Developer')

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

get '/contacts/1' do
  @contact = Contact.find(1)
  erb :show_contact
end

post '/' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end
