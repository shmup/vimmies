if executable('dotnet')
  setlocal makeprg=dotnet\ build
  " nnoremap <leader>b :Dispatch dotnet build -c Release<CR>
  nnoremap <leader>r :Dispatch dotnet run -c Release<CR>
  setlocal formatprg=dotnet\ format
endif
