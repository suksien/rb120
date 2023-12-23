=begin

enqueue to add an object to the queue
  - add the object to the position immediately following the most recently added object
  - if queue is full, need to remove oldest object first, then add the object

dequeue to remove (and return) the oldest object in the queue. 
  - It should return nil if the queue is empty.

You may assume that none of the values stored in the queue are nil 
(however, nil may be used to designate empty spots in the buffer).

=end

# first solution
# class CircularQueue
#   attr_reader :arr, :size, :insertion_order

#   def initialize(n)
#     @arr = Array.new(n)
#     @size = n
#     @insertion_order = []
#   end

#   def enqueue(item)
#     if empty?
#       slot_num = 0
#     else
#       dequeue if full?
#       slot_num = insertion_order.last + 1
#       slot_num -= size if slot_num >= size
#     end

#     insertion_order << slot_num
#     arr[slot_num] = item
#   end

#   def dequeue
#     return nil if empty?

#     oldest_index = insertion_order.shift
#     oldest_item = arr[oldest_index]
#     arr[oldest_index] = nil
#     oldest_item
#   end

#   private
#   def empty?
#     arr.all?(&:nil?)
#   end

#   def full?
#     arr.all? { |elem| !elem.nil? }
#   end
# end

# FE
class CircularQueue
  attr_accessor :arr, :size
  def initialize(n)
    @arr = Array.new()
    @size = n
  end

  def enqueue(item)
    if arr.size < size
      arr << item
    else
      dequeue
      arr << item
    end
  end

  def dequeue
    arr.shift # returns `nil` if `arr` is empty
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
puts "========"

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil


=begin

P1	P2	P3	Comments
            All positions are initially empty []
1			      Add 1 to the queue [0]
1	   2		  Add 2 to the queue [0, 1]
     2		  Remove oldest item from the queue (1) -> shift, [1]
     2	 3	Add 3 to the queue [1, 2]
4	   2	 3	Add 4 to the queue, queue is now full [1, 2, 0]
4		     3	Remove oldest item from the queue (2) -> shift, [2, 0]
4	   5	 3	Add 5 to the queue, queue is full again -> [2, 0, 1]
4	   5	 6	Add 6 to the queue, replaces oldest element (3) -> shift, [0, 1], [0, 1, 2]
7	   5	 6	Add 7 to the queue, replaces oldest element (4) -> shift, [1, 2] -> [1, 2, 0]
7		     6	Remove oldest item from the queue (5) -> shift, [2, 0]
7			      Remove oldest item from the queue (6) -> shift, [0]
            Remove oldest item from the queue (7) -> shift, []
            Remove non-existent item from the queue (nil)

=end