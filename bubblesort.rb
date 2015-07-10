def bubble_sort (arr)
  count = arr.size

  loop do
    swapped = false

    (count-1).times do |i|

      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swapped = true
      end
    end

    count -=1
    break if not swapped
  end 

  arr
end


def bubble_sort_by (arr)
  count = arr.size

  loop do
    swapped = false

    (count-1).times do |i|

      if yield(arr[i], arr[i+1]) > 0
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swapped = true
      end

    end

    count -=1
    break if not swapped
  end 

  arr
end


puts bubble_sort_by(["hi","smog","super drugs", "hello","hey"]) { |left, right| left.length - right.length }