require "test/unit"

def is_valid_ipv4? (ip_addr)
  parts = ip_addr.split(".")
  return false unless parts.size == 4 && !ip_addr.end_with?(".")

  parts.all? do |part|
    part.to_i.between?(0, 255) && part == part.to_i.to_s
  end
end


print "[IP address]: "
user_input = gets.chomp

puts is_valid_ipv4?(user_input) ? "IP address is valid" : "IP address is not valid valid"

class TestIPv4 < Test::Unit::TestCase
  def test_valid_ips
    assert(is_valid_ipv4?("0.0.0.0"))
    assert(is_valid_ipv4?("22.22.22.22"))
    assert(is_valid_ipv4?("255.255.255.255"))
  end

  def test_invalid_ips
    assert(!is_valid_ipv4?("300.300.300.300"))
    assert(!is_valid_ipv4?("1.1.1"))
    assert(!is_valid_ipv4?("1.1.1.  "))
    assert(!is_valid_ipv4?("1.1.1.1.1"))
    assert(!is_valid_ipv4?("a.b.c.d"))
    assert(!is_valid_ipv4?("a.b.c.d.e"))
    assert(!is_valid_ipv4?("1.1.1.-1"))
    assert(!is_valid_ipv4?("1.1.1.-1.-1"))
    assert(!is_valid_ipv4?("1.1.1.-1.-1.1"))
    assert(!is_valid_ipv4?("a.1.1.1.-1.-1"))
    assert(!is_valid_ipv4?("1.1.01.1"))
    assert(!is_valid_ipv4?("1.1.1.1."))
    assert(!is_valid_ipv4?("..."))
  end
end