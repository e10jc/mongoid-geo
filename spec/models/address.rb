puts "Address"

class Address
  include Mongoid::Document
  
  attr_accessor :mode

  field :address_type
  field :number, :type => Integer
  field :street
  field :city
  field :state
  field :post_code
  field :location, :type => Array, :geo => true

  field :pos, :type => Array, :geo => {:lat => :latitude, :lng => :longitude, :index => false}

  # key :street
end
