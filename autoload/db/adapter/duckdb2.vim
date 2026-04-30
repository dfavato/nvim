function! db#adapter#duckdb2#canonicalize(url) abort
  return db#url#canonicalize_file(a:url)
endfunction

function! db#adapter#duckdb2#test_file(file) abort
  if getfsize(a:file) < 100
    return
  endif
  let firstline = readfile(a:file, '', 1)[0]
  " DuckDB can also open SQLite databases
  if firstline[8:11] ==# 'DUCK' || firstline =~# '^SQLite format 3\n'
    return 1
  endif
endfunction

function! s:path(url) abort
  let path = db#url#file_path(a:url)
  if path =~# '^[\/]\=$'
    if !exists('s:session')
      let s:session = tempname() . '.duckdb'
    endif
    let path = s:session
  endif
  return path
endfunction

function! db#adapter#duckdb2#dbext(url) abort
  return {'dbname': s:path(a:url)}
endfunction

function! db#adapter#duckdb2#command(url) abort
  return ['duckdb', '-readonly', s:path(a:url)]
endfunction

function! db#adapter#duckdb2#interactive(url) abort
  return db#adapter#duckdb2#command(a:url) + ['-column', '-header']
endfunction

function! db#adapter#duckdb2#tables(url) abort
  return split(join(db#systemlist(db#adapter#duckdb2#command(a:url) + ['-noheader', '.tables'])))
endfunction

function! db#adapter#duckdb2#massage(input) abort
  return a:input . "\n;"
endfunction
