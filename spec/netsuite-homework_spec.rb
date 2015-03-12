require_relative 'spec_helper'

RSpec.describe NetsuiteHomework do
	it "works as expected for short arrays and default settings" do
		property_of {
			Rantly { array(range(0, 3)) { integer } }
		}.check do |ar|
			res = ar.sort_by { |x| -x }[0, 4]
			expect(NetsuiteHomework.new.apply(ar)).to eq res
		end
	end

	it "works as expected for short-ish arrays, repeated values" do
		property_of {
			Rantly { array(range(0, 100)) { range(0, 10) } }
		}.check(500) do |ar|
			res = ar.sort_by { |x| -x }[0, 4]
			expect(NetsuiteHomework.new.apply(ar)).to eq res
		end
	end

	it "works as expected for large size and default settings" do
		property_of {
			Rantly { array(1000) { integer } }
		}.check(1000) do |ar|
			res = ar.sort_by { |x| -x }[0, 4]
			expect(NetsuiteHomework.new.apply(ar)).to eq res
		end
	end

	it "works as expected for large size and custom settings" do
		property_of {
			Rantly {
				[
					choose(:<, :>),
					range(5, 9),
					array(1000) { integer }
				]
			}
		}.check(1000) do |op, len, ar|
			res = ar.sort { |a, b| a.send(op, b) ? -1 : 1 }[0, len]
			expect(NetsuiteHomework.new(len, op).apply(ar)).to eq res
		end
	end
end
