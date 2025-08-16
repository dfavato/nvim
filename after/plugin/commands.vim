command! Conf :vs | Telescope find_files search_dirs={"~/.config/nvim"}
command! Cd :lcd %:p:h
command! Json :setlocal filetype=json | :% !jq
command! PythonDictToJson :.!python -c "import sys, json; print(json.dumps(eval(sys.stdin.read())))" | :set filetype=json
command! ToNotebook :!jupytext --to notebook %
command! ToPy :!jupytext --to py % :e %
command! ToMd :!jupytext --to md %
command! JsonStrToJson :.!python -c "import sys, json; print(json.loads(sys.stdin.read()))" | :set filetype=json
command! TsvToJson :%!python -c "import sys, json, csv; print(json.dumps(list(csv.DictReader(sys.stdin, delimiter='\t'))))" | :set filetype=json
command! Chat :sp .chat.md | :set filetype=markdown | :setlocal wrap
