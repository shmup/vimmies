vim9script

# slurpfiles.vim
# aggregate buffers into a new buffer and copy to system clipboard
#   :Slurp to aggregate all buffers into a new buffer
#   :Slurp -t or --tab-only to only aggregate current tab's buffers
#   :Slurp -b or --buffer-dir to aggregate all files in the current buffer's directory
#   :Slurp -w or --working-dir to aggregate all files in the current working directory
# you can use -r with -b or -w to recursively slurp files in the directory

def SlurpBuffers(...args: list<string>)
  var only_this_tab = args->len() > 0 && (args[0] ==# '-t' || args[0] ==# '--tab-only')
  var buffer_directory_mode = args->len() > 0 && (args[0] ==# '-b' || args[0] ==# '--buffer-dir')
  var working_directory_mode = args->len() > 0 && (args[0] ==# '-w' || args[0] ==# '--working-dir')
  var recursive_current_dir = args->len() > 0 && args[0] ==# '-rd'
  var recursive = args->len() > 1 && args[1] ==# '-r' || recursive_current_dir
  var buffers: list<number> = []
  var output = ''

  if buffer_directory_mode || working_directory_mode || recursive_current_dir
    var target_dir = working_directory_mode ? getcwd() : (buffer_directory_mode ? expand('%:p:h') : getcwd())
    var glob_pattern = recursive ? target_dir .. '/**/*' : target_dir .. '/*'
    var files = glob(glob_pattern, false, true)
    for file in files
      if !isdirectory(file)
        var content = readfile(file)->join("\n")
        if !empty(content)
          output ..= '# ' .. fnamemodify(file, ':t') .. "\n\n" .. content .. "\n\n"
        endif
      endif
    endfor
  else
    if only_this_tab
      var current_tab = tabpagenr()
      for win in getwininfo()
        if win.tabnr == current_tab
          var buf = win.bufnr
          if buflisted(buf) && index(buffers, buf) == -1
            call add(buffers, buf)
          endif
        endif
      endfor
    else
      buffers = range(1, bufnr('$'))->filter('buflisted(v:val)')
    endif

    for buf in buffers
      bufload(buf)
      var fname = bufname(buf)
      if empty(fname)
        continue
      endif
      var content = getbufline(buf, 1, '$')->join("\n")
      if !empty(content)
        output ..= '# ' .. fname .. "\n\n" .. content .. "\n\n"
      endif
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

command! -nargs=? Slurp SlurpBuffers(<f-args>)
