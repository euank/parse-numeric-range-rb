gem 'minitest'
require "minitest/autorun"

require_relative '../lib/parse_numeric_range.rb'

def p(str, expected)
	assert_equal(expected, ParseNumericRange.parse(str))
end


describe ParseNumericRange do
	it 'should parse 1' do
		p '1', [1]
	end

	it 'should parse 1,1' do
		p '1,1', [1,1]
	end

	it 'should parse 1-5' do
		p '1-5', [1,2,3,4,5]
	end

	it 'should parse 5-1' do
		p '5-1', [5,4,3,2,1]
	end

	it 'should parse 1-3,5-6' do
		p '1-3,5-6', [1,2,3,5,6]
	end

	it 'should parse 10..15' do
		p '10..15', [10,11,12,13,14,15]
	end

	it 'should parse 10...15' do
		p '10...15', [10,11,12,13,14]
	end

	it 'should parse 10..12,13...15,2,8' do
		p '10..12,13...15,2,8', [10,11,12,13,14,2,8]
	end

	it 'should parse ""' do
		p '', []
	end

	it 'should parse -5' do
		p '-5', [-5]
	end

	it 'should parse -5--10' do
		p '-5--10', [-5,-6,-7,-8,-9,-10]
	end

	it 'should parse -1..2,-1...2' do
		p '-1..2,-1...2', [-1,0,1,2,-1,0,1]
	end

	it 'should parse 1‥3' do
		p '1‥3', [1,2,3]
	end

	it 'should parse 1⋯3' do
		p '1⋯3', [1,2]
	end

	it 'should parse 1…3' do
		p '1…3', [1,2]
	end
end
