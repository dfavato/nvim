command Conf :vs | Telescope find_files search_dirs={"~/.config/nvim"}
command Cd :lcd %:p:h
command Json :!python -m json.tool %

" Python run pytest
function GetTestCommand()
	let l:file = expand('%:p')
	try
		let l:func = matchlist(getline('.'), 'def \(\w\+\)')[1]
	catch /E684/
		return "No function found"
	endtry
	return 'pipenv run pytest ' . l:file . '::' . l:func . ' --disable-warnings -vv'
endfunction
function RunPytest()
	let l:cmd = GetTestCommand()
	execute "!" . l:cmd
endfunction
command Test call RunPytest()
command TestAll :!pipenv run pytest % --disable-warnings -vv
