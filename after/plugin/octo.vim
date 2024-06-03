lua<<EOF
local ok, _ = pcall(require, "octo")
if ok then
    require"octo".setup({})
end
EOF
