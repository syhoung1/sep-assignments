class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  
  def initialize(name)
    self.name = name
    self.film_actor_hash = Hash.new { |h, k| h[k] = [] }
  end
  
  def add_film_hash(film_name, *actors)
    if !self.film_actor_hash.has_key?(film_name)
      self.film_actor_hash[film_name] = actors.to_a
    else
      self.film_actor_hash[film_name].push(actors)
    end
  end
  
  def find_kevin_bacon(start_node)
    seen = []
    possible = []
    
    dfs_find(start_node, seen, possible)
    puts "#{start_node.name} was in "
    possible.each_with_index do |item, index|
      if index % 2 == 1 && index == possible.length - 1
        print item
      elsif index % 2 == 0
        print "#{item} with "
      else
        print "#{item}, who was also in "
      end
    end
  end
  
  def dfs_find(node, seen, possible)
    if possible.uniq.length > 12
      return false
    end
    
    node.film_actor_hash.each do |film, actors|
      if !seen.include?(film)
        seen.push(film)
        
        actors.each do |actor|
          if actor.name == "kevin bacon"
            possible.push(film)
            possible.push(actor.name)
            puts "Found kevin bacon!"
            return true
          else
            possible.push(film)
            possible.push(actor.name)
            dfs_find(actor, seen, possible)
          end
        end
      end
    end
  end
end

kevin_bacon = Node.new("kevin bacon")
kevin_spacey = Node.new("kevin spacey")
person = Node.new("person")
thing = Node.new("thing")
guy = Node.new("guy")
dude = Node.new("dude")
gal = Node.new("gal")

kevin_bacon.add_film_hash("footloose", kevin_spacey)
person.add_film_hash("footloose", kevin_bacon, thing, dude)
dude.add_film_hash("footloose", kevin_bacon, thing, person)
dude.add_film_hash("neckloose", guy, kevin_spacey)
guy.add_film_hash("neckloose", kevin_spacey, dude)
kevin_spacey.add_film_hash("neckloose", guy, dude)
kevin_spacey.add_film_hash("handloose", gal)
gal.add_film_hash("handloose", kevin_spacey)

kevin_bacon.find_kevin_bacon(gal)
