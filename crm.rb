# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.

require_relative 'contact'
require 'sinatra'

get "/" do
  @num_contacts = Contact.all.count
  erb :contacts
end

get "/contacts/new" do
  erb :new_contact
end

get "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get "/contacts" do
  @num_contacts = Contact.all.count
  erb :contacts
end

post "/contacts" do
  contact = Contact.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    note: params[:note]
  )
  redirect to ("/contacts")
  # The Contact class method of creating instance variables and storing them
  # Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  # redirect to("/")
end

get "/contacts/:id/edit" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact = Contact.update(
    @contact.id,
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    note: params[:note]
    )

    redirect to("/contacts")
  else
    raise Sintra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
