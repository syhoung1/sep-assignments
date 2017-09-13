
class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    if @queue.empty?
      @queue[0] = element
      self.head = @queue[0]
      self.tail = @queue[0]
    else
      @queue[@queue.length] = element
      self.tail = @queue[@queue.length - 1]
    end
  end

  def dequeue
    @queue.delete_at(@queue.length - 1)
  end

  def empty?
    return @queue.length === 0
  end
end

def bucket_sort(arr, n)
  queues = []
  
  while arr.length > 0
    temp = arr.shift
    if queues[temp].nil?
     queues[temp] = MyQueue.new
    end
    queues[temp].enqueue(temp)
  end
  
  queues.each do |queue|
    while !queue.empty?
      arr.push(queue.dequeue)
    end
  end
end 
