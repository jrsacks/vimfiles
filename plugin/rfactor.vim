" Extracts the currently selected text into a seperate method
function! ExtractMethod()
  " Get the selected lines
  " Ask the user for the new method name
  " Call extract_method.rb with the filename, selected lines, and the method
  " name
  let start = line('v')
  let end = line('.')
  let lines = getline(start, end)
  call writefile(lines, "extract_method.tmp")
endfunction
