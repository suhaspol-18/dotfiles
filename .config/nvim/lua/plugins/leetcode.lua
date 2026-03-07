return {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    cmd = "Leet",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        -- Start with leetcode.nvim argument
        arg = "leetcode.nvim",

        -- Default language
        lang = "java",

        cn = {
            enabled = false,
            translator = true,
            translate_problems = true,
        },

        storage = {
            home = vim.fn.stdpath("data") .. "/leetcode",
            cache = vim.fn.stdpath("cache") .. "/leetcode",
        },

        plugins = {
            non_standalone = true,
        },

        logging = true,

        cache = {
            update_interval = 60 * 60 * 24 * 7, -- 7 days
        },

        editor = {
            reset_previous_code = true,
            fold_imports = true,
        },

        console = {
            open_on_runcode = true,
            dir = "row",
            size = {
                width = "90%",
                height = "75%",
            },
            result = {
                size = "60%",
            },
            testcase = {
                virt_text = true,
                size = "40%",
            },
        },

        description = {
            position = "left",
            width = "40%",
            show_stats = true,
        },

        -- Easy to remember keybinds that don't conflict with existing keymaps
        keys = {
            toggle = { "q" }, -- quit/toggle
            confirm = { "<CR>" }, -- confirm with Enter

            reset_testcases = "r", -- r for reset
            use_testcase = "U", -- U for use (capital to avoid conflicts)
            focus_testcases = "H", -- H for left (testcases on left)
            focus_result = "L", -- L for right (result on right)
        },

        hooks = {
            ["enter"] = {},
            ["question_enter"] = {
                function()
                    vim.wo.winfixbuf = false
                end,
            },
            ["leave"] = {},
        },

        image_support = false,
    },
    keys = {
        { "<leader>lm", "<cmd>Leet<CR>", desc = "Leetcode: Open Menu" },
        { "<leader>lc", function() vim.api.nvim_cmd({ cmd = "Leet", args = { "console" } }, { mods = { silent = true } }) end, desc = "Leetcode: Open Console" },
        { "<leader>li", function() vim.api.nvim_cmd({ cmd = "Leet", args = { "info" } }, { mods = { silent = true } }) end, desc = "Leetcode: Problem Info" },
        { "<leader>lt", function() vim.api.nvim_cmd({ cmd = "Leet", args = { "tabs" } }, { mods = { silent = true } }) end, desc = "Leetcode: Open Tabs" },
        { "<leader>ly", function() vim.api.nvim_cmd({ cmd = "Leet", args = { "yank" } }, { mods = { silent = true } }) end, desc = "Leetcode: Yank Code" },

        { "<leader>lr", function() vim.api.nvim_cmd({ cmd = "Leet", args = { "run" } }, { mods = { silent = true } }) end, desc = "Leetcode: Run Code" },
        { "<leader>ls", function() vim.api.nvim_cmd({ cmd = "Leet", args = { "submit" } }, { mods = { silent = true } }) end, desc = "Leetcode: Submit Code" },

        { "<leader>ll", function() vim.api.nvim_cmd({ cmd = "Leet", args = { "list" } }, { mods = { silent = true } }) end, desc = "Leetcode: Problem List" },
        { "<leader>ld", function() vim.api.nvim_cmd({ cmd = "Leet", args = { "daily" } }, { mods = { silent = true } }) end, desc = "Leetcode: Daily Problem" },
        { "<leader>lR", function() vim.api.nvim_cmd({ cmd = "Leet", args = { "random" } }, { mods = { silent = true } }) end, desc = "Leetcode: Random Problem" },

        { "<leader>lo", function() vim.api.nvim_cmd({ cmd = "Leet", args = { "open" } }, { mods = { silent = true } }) end, desc = "Leetcode: Open in Browser" },
        { "<leader>lL", function() vim.api.nvim_cmd({ cmd = "Leet", args = { "lang" } }, { mods = { silent = true } }) end, desc = "Leetcode: Change Language" },
        { "<leader>lD", function() vim.api.nvim_cmd({ cmd = "Leet", args = { "desc", "toggle" } }, { mods = { silent = true } }) end, desc = "Leetcode: Toggle Description" },
        { "<leader>lx", function() vim.api.nvim_cmd({ cmd = "Leet", args = { "exit" } }, { mods = { silent = true } }) end, desc = "Leetcode: Exit" },
    },
}
