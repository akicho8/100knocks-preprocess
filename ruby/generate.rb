require "pathname"

template = Pathname("template.rb").read
(14..100).each do |i|
  Pathname("P-%03d.rb" % i).write(template)
end
