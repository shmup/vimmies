if executable("jq")
  let &l:formatprg = "jq -e"
elseif executable("python")
  let &l:formatprg = "python -m json.tool"
endif
