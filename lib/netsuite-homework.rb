# This is a NetSuite homework.
#
# Given an int array of size n, write a O(n) algorithm to return the top 4
# largest elements from the array. Please write your code as you would write
# in a production environment
#
# XXX: Please bear in mind that this solution is actually `O(output_size*n)`
# and for values of +output_size+ higher than `log(n)` you'd be well advised
# to use QuickSelect or some such algorithm.
#
class NetsuiteHomework
	# initialize the class -- select +output_size+ (0...log(n)) and +sort_by+
	# (sort order) -- for smallest elements use :<, for largest use :>
	def initialize(output_size = 4, sort_by = :>)
		@output_size = output_size
		@sort_by = sort_by
	end
	attr_reader :output_size, :sort_by

	# apply the magical algorithm on +array+
	# (returning +output_size+ elements sorted by +sort_by+)
	def apply(array)
		array.reduce([]) do |mem, el|
			# this could be just `merge(mem, el)` but this is FASTER:
			if mem.size == output_size && mem.last.send(sort_by, el)
				mem
			else
				merge(mem, el)
			end
		end
	end

	# merge +new_element+ into +array+ according to +sort_by+ but keep output
	# leq +output_size+ elements total
	def merge(array, new_element)
		out = []
		for el in array
			if new_element && new_element.send(sort_by, el)
				out << new_element
				new_element = nil
			end
			out << el
		end
		out << new_element if new_element
		out[0, output_size]
	end
end
