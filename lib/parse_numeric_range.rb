module ParseNumericRange
  VERSION = "0.1.0"

	def self.parse(str)
		parts = str.split(',').map(&:strip)
		parts.map{|p| self.parse_part(p)}.flatten
	end

	private
	def self.parse_part(str)
		res = []
		if str =~ /^-?\d+$/
			return [str.to_i]
		end

		if str.encode(Encoding::UTF_8, :undef => :replace, :invalid => :replace) =~ /^(-?\d+)(-|\.\.\.?|\u{2025}|\u{2026}|\u{22EF})(-?\d+)$/
			lhs = $1
			sep = $2
			rhs = $3

			if(lhs && rhs)
				lhs = lhs.to_i
				rhs = rhs.to_i
				
				incr = lhs < rhs ? 1 : -1
				if sep == '-' || sep == '..' || sep == "\u2025".encode('utf-8')
					# Inclusive ranges; stop one later
					rhs += incr
				end

				i = lhs
				while i != rhs
					res << i
					i += incr
				end
			end
		end

		res
	end
end
