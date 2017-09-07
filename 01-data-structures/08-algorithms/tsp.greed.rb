class City
  attr_accessor :seen
  attr_accessor :connected_cities
  attr_accessor :name

  def initialize(name, *connected_cities)
    self.name = name
    self.connected_cities = connected_cities
    self.seen = false
  end
  
  def add_connected_city(city)
    self.connected_cities.push(city)
  end
end

class Map
  def initialize(*cities)
    @cities = {}
    cities.each do |city|
      @cities[city.name]= city
    end
  end
  
  def nearest_city(current_city)
    if current_city.seen
      return 
    end
    
    closest_neighbor = current_city.connected_cities[0]
    least_distance = 0
    closest_neighbor.each do |key, value|
      least_distance = value
    end
    
    current_city.connected_cities.each do |neighbor|
      neighbor.each do |key, value|
        if value <= least_distance
          least_distance = value
          closest_neighbor = key
        end
      end
    end
    current_city.seen = true
    puts current_city.name
    nearest_city(@cities["#{closest_neighbor}"])
  end
  
  def find(target_city)
    @cities.each do |city|
      if city.name == target_city
        return city
      end
    end
    false
  end
end


city = City.new("new york", { "miami" => 600 })
city2 = City.new("miami", { "new york" => 600 }, { "houston" => 1000 })
city3 = City.new("dallas", { "houston" => 100 })
city4 = City.new("houston", { "dallas" => 100 }, { "miami" => 1000}, { "las vegas" => 700})
city5 = City.new("las vegas", { "houston" => 700 })

map = Map.new(city, city2, city3, city4, city5)
map.nearest_city(city5)
