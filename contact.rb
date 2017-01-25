class Contact

  #This makes these instance variables accessible outside of class definition
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id
    @@contacts = []
    @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end


  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = self.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)

   case attribute
     when "first_name"
       self.first_name = value
     when "last_name"
       self.last_name = value
     when "email"
       self.email = value
     when "note"
       self.note = value
     end
   end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
      @@contacts.each do |contact|
        case attribute
          when "id"
            if contact.id == value
              return contact
            end
          when "first_name"
            if contact.first_name == value
              return contact
            end
          when "last_name"
              if contact.last_name == value
                return contact
              end
            when"email"
              if contact.email == value
                return contact
              end
            when "note"
              if contact.note == value
                return contact
              end
          end
      end
    end

  # This method should delete all of the contacts
  def self.delete_all
      @@contacts = []
    end

    def full_name
        "#{self.first_name} #{self.last_name}"
      end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
      @@contacts.delete(self)
    end

  # Feel free to add other methods here, if you need them.

end



#tests
# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
