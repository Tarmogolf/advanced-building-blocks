module Enumerable

	def my_each
		for i in self
			yield(i) if block_given?
		end
	end

	def my_each_with_index
		array = self.to_a

		for i in 0..array.size
			yield(array[i], i)
		end
		return array
	end

	def my_select

		selected = []

		self.my_each do |i|
			is_good = yield(i)

			if is_good
				selected.push(i)
			end
		end

		return selected
	end

	def my_all?
		all_true = true

		self.my_each do |i|
			return false if not all_true = yield(i)
		end

		return true
	end

	def my_any?
		any_true = false

		self.my_each do |i|
			return true if all_true = yield(i)
		end

		return false
	end		

	def my_none?
		none = true

		self.my_each do |i|
			return false if none = yield(i)
		end

		return true
	end

	def my_count
		count = 0

		self.my_each do |i|
			if block_given?
				count+= (yield(i) ? 1 : 0)
			else
				count+=1
			end
		end

		return count

	end

	def my_map
		result = []

		self.my_each do |i|
			result.push(yield(i))
		end

		return result
	end

	def my_inject(initial = nil)
		initial = self[0] if initial.nil?
		memo = initial
		self.my_each { |element| memo = yield(memo, element) }
		memo
	end

end