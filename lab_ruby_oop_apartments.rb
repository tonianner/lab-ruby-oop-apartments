class Building
  attr_accessor :address

  def initializer (address)
    @address = address
  end

  def add_appartnment(new_address)
    @address = new_address
    ::Appartment << @address #add index
  end

  def remove_apparment(index)
    @appartments.delete(index) #index of @appartment
  end

end


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
       "Excellent"
    elsif value >= 725
      "Great"
    elsif value >= 660
      "Good"
    elsif value >= 560
      "Mediocre"
    else
      "Bad"
    end
  end

  def profile
    puts "Tenant name: #{@name}"
    puts "Tenant age: #{@age}"
    puts "Credit Score: #{@credit_score}"
  end
end


#-----------------------

class Appartment
  attr_accessor :number, :rent, :square_foot, :num_bedroom, :num_bathroom
  attr_reader :tenants

  def initialize(number, rent, square_foot, num_bedroom, num_bathroom, tenants)
    @number = number
    @rent = rent
    @square_foot = square_foot
    @num_bedroom = num_bedroom
    @num_bathroom = num_bathroom
    @tenants = []
  end

  def add_tenant(tenants)
    if (tenant.credit_score != "Bad") && (@tenants.size +1) < @num_bedroom
      @tenants.push tenant
    else
      raise "tenant #{tenant.name} has a bad score or not enough rooms"
    end
  end

  def remove_all_tenants
    @tenants.delete_if{ true }
  end

  def average_score
    @tenants.inject{|sum, t| sum + t.credit_score}.to_f / @tenants.size
  end

  def remove_tenant(tenant)
    name = tenant.class == Tenant ? tenant.name : tenant1
    if not @tenants.delete_if {|t|t.name == name}
      raise "appartment not found"
    end
  end
end

tenant1 = Tenant.new("Toni",24, 900)
tenant2 = Tenant.new("Anne",89, 900)


appt1 = Appartment.new(1,2400,800,2,1,4)
appt2 = Appartment.new(2,3400,1200,3,2,5)

# appt1.add_tenant(tenant1)

puts appt1.tenants