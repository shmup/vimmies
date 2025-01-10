vim9script

# slurpfiles.vim
# aggregate buffers into a new buffer and copy to system clipboard
#   :Slurp to aggregate all buffers into a new buffer
#   :Slurp -t or --tab-only to only aggregate current tab's buffers
#   :Slurp -b or --buffer-dir to aggregate all files in the current buffer's directory
#   :Slurp -w or --working-dir to aggregate all files in the current working directory
# you can use -r with -b or -w to recursively slurp files in the directory

def SlurpBuffers(...args: list<string>)
  var only_this_tab = false
  var mode = 'buffer'
  var target_dir = ''
  var recursive = false

  for arg in args
    if arg ==# '-t' || arg ==# '--tab-only'
      only_this_tab = true
    elseif arg ==# '-b' || arg ==# '--buffer-dir'
      if mode !=# 'buffer'
        echo "Conflicting options specified."
        return
      endif
      mode = 'file'
      var buf_dir = expand('%:p:h')
      if empty(buf_dir)
        echo "Current buffer has no associated directory."
        return
      endif
      target_dir = buf_dir
    elseif arg ==# '-w' || arg ==# '--working-dir'
      if mode !=# 'buffer'
        echo "Conflicting options specified."
        return
      endif
      mode = 'file'
      target_dir = getcwd()
    elseif arg ==# '-r' || arg ==# '--recursive'
      recursive = true
    else
      echo "Unknown argument: " .. arg
      return
    endif
  endfor

  var output = ''

  if mode ==# 'file'
    var glob_pattern = recursive ? target_dir .. '/**/*' : target_dir .. '/*'
    var files = glob(glob_pattern, false, true)

    for file in files
      if !isdirectory(file)
        var lines = readfile(file)
        if empty(lines)
          continue
        endif
        var content = lines->join("\n")
        output ..= '# ' .. fnamemodify(file, ':t') .. "\n\n" .. content .. "\n\n"
      endif
    endfor
  else
    var buffers: list<number>
    if only_this_tab
      var current_tab = tabpagenr()
      buffers = tabpagebuflist(current_tab)->filter('buflisted(v:val)')
    else
      buffers = filter(getbufinfo(), 'v:val.listed')->map('v:val.bufnr')
    endif

    for buf in buffers
      var fname = bufname(buf)
      if empty(fname)
        continue
      endif
      var lines = getbufline(buf, 1, '$')
      if empty(lines)
        continue
      endif
      var content = lines->join("\n")
      output ..= '# ' .. fname .. "\n\n" .. content .. "\n\n"
    endfor
  endif

  if empty(output)
    echo "No content found to slurp!"
    return
  endif

  tabnew
  setlocal buftype=nofile bufhidden=wipe noswapfile nowrap
  setline(1, output->split("\n"))
  @+ = output
  echo "Content slurped and copied to clipboard!"
enddef

command! -nargs=* Slurp SlurpBuffers(<f-args>)
