return {
    "folke/flash.nvim",  -- Easy motions
    keys = {
        {
            "s",
            function()
                require("flash").jump()
            end,
            mode = "n",
            desc = "Flash jump",
        },
    }
}
