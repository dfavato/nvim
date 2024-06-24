command Conf :vs | Telescope find_files search_dirs={"~/.config/nvim"}
command Cd :lcd %:p:h
command Json :!python -m json.tool %
command PythonDictToJson :.!python -c "import sys, json; print(json.dumps(eval(sys.stdin.read())))"

" Python run pytest
function GetTestCommand()
    let l:file = expand('%:p')
    let l:jump_back = 0
    if match(getline('.'), 'def \(\w\+\)') < 0
        normal [[
        let l:jump_back = 1
    endif
    try
        let l:func = matchlist(getline('.'), 'def \(\w\+\)')[1]
    catch /E684/
        return "No function found"
    finally
        if l:jump_back
            exe "normal \<C-o>"
        endif
    endtry
    return 'pipenv run python -m pytest ' . l:file . '::' . l:func . ' --disable-warnings -vv --no-cov'
endfunction

function RunPytest()
    let l:cmd = GetTestCommand()
    execute "!" . l:cmd
endfunction

command Test call RunPytest()
command TestAll :!pipenv run python -m pytest % --disable-warnings -vv --no-cov
