require 'rubygems'
require 'net/ldap'

ldap = Net::LDAP.new
ldap.host = '172.16.21.3'
ldap.port = 3268

user_email = String.new(ARGV[0])

user_email2 = user_email.sub(/\.com$/, ".cn")


[user_email, user_email2].each { | user |
  ldap.auth user, ARGV[1]
  result = ldap.bind_as(:base => "dc=smartisan, dc=cn",
                        :filter => "(mail=#{user})",
                        :password => ARGV[1])
  if result
    puts "good: #{user}"
  else
    puts "fail: #{user}"
  end

}

