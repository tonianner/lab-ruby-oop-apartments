# class Building
#   attr_accessor :address
#   # attr_reader :appartments

#   def initializer (address)
#     @address = address
#   end

#   def add_appartnment(new_address)
#     @address = new_address
#     ::Appartment << @address #add index
#   end

#   def remove_apparment(index)
#     @appartments.delete(index) #index of @appartment
#   end

# end

# #-----------------------

class Appartment
  attr_accessor :number, :rent, :square_foot, :num_bedroom, :num_bathroom, :all_tenants

  def initialize(number, rent, square_foot, num_bedroom, num_bathroom)
    @number = number
    @rent = rent
    @square_foot = square_foot
    @num_bedroom = num_bedroom
    @num_bathroom = num_bathroom
  end

  def appartment_info
    puts "Number: #{number}"
    puts"Rent: $ #{rent}"
    puts"Square foot: #{square_foot} "
    puts "Bedrooms: #{num_bedroom}"
    puts "Bathrooms: #{num_bathroom}"
  end
end

appartment1 = Appartment.new(1,2400,800,2,1)
appartment1.appartment_info

#-----------------------

class Tenant
  attr_accessor :name, :age, :credit_score

  def initialize(name, age, credit_score)
    @name = name
    @age = age
    @credit_score = rating(credit_score)
  end

  def rating(value)
    if value >= 760
       "Credit rating: Excellent!"
    elsif value >= 725
      "Credit rating: Great!"
    elsif value >= 660
      "Credit rating: Good!"
    elsif value >= 560
      "Credit rating: Mediocre!"
    else
      "Credit rating: bad!"
    end
  end

  def profile
    puts "Tenant name: #{@name}"
    puts "Tenant age: #{@age}"
    puts "Credit Score: #{@credit_score}"
  end
end

tenant1 = Tenant.new("Toni",24, 900).profile
tenant1.profile


