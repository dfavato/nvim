" Vertica adapter for vim-dadbod
" Uses vsql (Vertica's CLI client, similar to psql)
"
" URL format: vertica://user:pass@host:port/dbname

function! db#adapter#vertica#canonicalize(url) abort
  return db#url#absorb_params(a:url, {
        \ 'user': 'user',
        \ 'password': 'password',
        \ 'host': 'host',
        \ 'port': 'port',
        \ 'dbname': 'database'})
endfunction

function! db#adapter#vertica#interactive(url) abort
  let url = db#url#parse(a:url)
  let cmd = (has_key(url, 'password') ? ['env', 'VSQL_PASSWORD=' . url.password] : [])
        \ + [get(g:, 'db_vertica_command', 'vsql')]
        \ + db#url#as_argv(a:url, '-h ', '-p ', '', '-U ', '', '-d ')
  return cmd
endfunction

function! db#adapter#vertica#filter(url) abort
  return db#adapter#vertica#interactive(a:url)
endfunction

function! db#adapter#vertica#input(url, in) abort
  return db#adapter#vertica#filter(a:url) + ['-f', a:in]
endfunction

function! db#adapter#vertica#tables(url) abort
  let cmd = db#adapter#vertica#filter(a:url) + ['-tAc',
        \ 'SELECT table_schema || ''.'' || table_name FROM v_catalog.tables'
        \ . ' UNION ALL'
        \ . ' SELECT table_schema || ''.'' || table_name FROM v_catalog.views'
        \ . ' ORDER BY 1']
  return db#systemlist(cmd)
endfunction

function! db#adapter#vertica#complete_database(url) abort
  let cmd = db#adapter#vertica#filter(
        \ substitute(a:url, '/[^/]*$', '/', '')) +
        \ ['-tAc', 'SELECT database_name FROM v_catalog.databases ORDER BY 1']
  return db#systemlist(cmd)
endfunction
