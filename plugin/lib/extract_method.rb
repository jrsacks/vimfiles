require 'rubygems'
gem 'fabiokung-rfactor'


document = $stdin.read
selected = ENV['TM_SELECTED_TEXT']
index = document.index(selected)
selected_start = document[0, index].count("\n") + 1
selected_end = selected_start + selected.strip_blank_lines_at_end.count("\n")

method_name = TextMate.input("New method name:", "new_method")

code = Rfactor::Code.new(document)
new_code = code.extract_method :name => method_name,
    :start => selected_start,
    :end => selected_end

puts "#{new_code}\n"
