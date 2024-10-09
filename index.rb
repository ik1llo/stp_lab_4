def is_valid_ipv4? (ip_addr)
  parts = ip_addr.split(".")
  return false unless parts.size == 4

  parts.all? do |part|
    part.to_i.between?(0, 255) && part == part.to_i.to_s
  end
end


print "[IP address]: "
user_input = gets.chomp

puts is_valid_ipv4?(user_input) ? "IP address is valid" : "IP address is not valid valid"