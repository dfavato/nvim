local default_helpers = {
    List = [[
SELECT *
FROM {table}
LIMIT 1
    ]],
    Count = [[
SELECT count(*)
FROM {table}
    ]],
}

local vertica_helpers = vim.deepcopy(default_helpers)
vertica_helpers['Columns'] = [[
SELECT *
FROM v_catalog.columns
WHERE table_name = '{table}'
]]
vertica_helpers['Size'] = [[
SELECT anchor_table_name, anchor_table_schema, sum(used_bytes) / (1024 ^ 3) as table_size_gb
FROM v_monitor.column_storage
WHERE anchor_table_name = '{table}'
    AND anchor_table_schema = ''
GROUP by anchor_table_name, anchor_table_schema
]]

local duckdb_helpers = vim.deepcopy(default_helpers)
duckdb_helpers['Columns'] = [[
SELECT *
FROM information_schema.columns
WHERE table_name = '{table}'
]]

return {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        { 'tpope/vim-dadbod',                     lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_force_echo_notifications = 1
        vim.g.db_ui_table_helpers = {
            vertica = vertica_helpers,
            duckdb2 = duckdb_helpers,
        }
    end,
}
