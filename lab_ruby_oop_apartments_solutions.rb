#SOLUTION FROM CLASS... Just added my own notes as well
class Tenant
  attr_accessor :name, :age, :credit_score

  def initialize(name, age, credit_score)
    @name = name
    @age = age
    @credit_score = credit_score
  end

  def credit_rating
    case @credit_score
      when 0..559
        "bad"
      when 560..659
        "mediocre"
      when 660..724
        "good"
      when 725..759
        "great"
      else
        "excellent"
    end
  end
end
=begin
   t1 = Tenant.new("toni", 20, 700)
=> #<Context::Tenant:0x00000001a43098 @name="toni", @age=20, @credit_score=700>
   t1.name
=> "toni"
   t1.age
=> 20
   t1.credit_score
=> 700
   t1.credit_rating
=> "good"
=end



class Apartment
  attr_accessor :number, :rent, :sqr_feet, :num_bedrooms, :num_bathrooms
  attr_reader :tenants

  def initialize(number, rent, sqr_feet, num_bedrooms, num_bathrooms)
    @number = number
    @rent = rent
    @sqr_feet = sqr_feet
    @num_bedrooms = num_bedrooms
    @num_bathrooms = num_bathrooms
    @tenants = []
  end

  def add_tenant(tenant)
    #tenent.credit_rating => t1.credit_rating
    #@tenants.size => length of array
    #push in t1

    #(@tenants.size + 1) ????
    if (tenant.credit_rating != "bad" && (@tenants.size + 1) < @num_bedrooms)
      @tenants.push tenant
    else
      raise "Tenant #{tenant.name} has a BAD Credit Score or not enough rooms"
    end
   end

  def remove_tenant(tenant)
    #check array
    puts "#{@tenants[0].name}"
    #is_a? Returns true if class is the class of obj
    #Tenant is the Class
    #name_to_match => if true returns t1.name
    name_to_match = tenant.is_a?(Tenant) ? tenant.name : tenant
    #t => item in array
    if not @tenants.delete_if {|t| t.name == name_to_match}
      raise "tenant not found"
    end
  end

  def remove_all_tenants
    @tenants.delete_if { true }
  end

  def average_credit_score
    #to_f => get decimals
    @tenants.inject{ |sum, t| sum + t.credit_score }.to_f / @tenants.size
  end
end

class Building
  attr_accessor :address
  attr_reader :apartments
  def initialize(address)
    @address = address
    @apartments = []
  end

  def add_apartment(apartment)
    @apartments.push apartment
  end

  def remove_apartment(apartment_number)
    index = @apartments.index {|apt| apt.number == apartment_number}
    if index
      @apartments.delete_at(index)
    else
      raise "apartment not found"
    end
  end

  def total_square_footage
    @apartments.inject { |sqr_total, apt|
      sqr_total + apt.sqr_feet
    }
  end

  def total_monthly_revenue
    @apartments.inject { |revenue, apt|
      revenue + apt.rent
    }
  end

  def tenants
    master_tenant_list = []
    @apartments.each do |apt|
      apt.tenants.each do |tenant|
        master_tenant_list.push tenant
      end
    end
    master_tenant_list
  end

  def apartments_by_credit_score
    apartment_rating_distribution = {bad: [], mediocre: [], good: [], great: [], excellent: []}

    @apartments.each do |apt|
      case apt.average_credit_score
        when 0..559
          rating = "bad"
        when 560..659
          rating = "mediocre"
        when 660..724
          rating = "good"
        when 725..759
          rating = "great"
        else
          rating = "excellent"
      end
      #to_sym to change to : so the hash can accept it
      #pushing the value of apt into the array =>:apt
      apartment_rating_distribution[rating.to_sym].push apt
    end
  end
end

 t1 = Tenant.new("toni", 20, 700)
 apt1 = Apartment.new(108, 1500, 2000, 5, 1)
 apt1.add_tenant(t1)
 apt1.remove_tenant(t1)
 blg1 = Building.new("33 Des Voeux")
 blg1.add_apartment(apt1)