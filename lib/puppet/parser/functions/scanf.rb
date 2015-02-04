Puppet::Parser::Functions::newfunction(
:scanf,
:type => :rvalue,
:arity => 2,
:doc => <<-DOC
scanf(data, format)
DOC

do |args|
  require 'scanf'
  data = args[0]
  format = args[1]

  data.scanf(format)
end

