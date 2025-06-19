local actions = require('telescope.actions')
require('telescope').load_extension('fzf')

require('telescope').setup {
    defaults = {
        prompt_position = "bottom",
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "vertical",
        layout_config = {
            vertical = {
                width = 0.9, height = 0.9, preview_height = 0.7, preview_cutoff = 0
            }
        },
        layout_defaults = {
          horizontal = {
            mirror = false,
          },
          vertical = {
            mirror = true,
          },
        },
        file_ignore_patterns = {},
        path_display = {
            "shorten",
        },
        -- shorten_path = true,
        winblend = 0,
        preview_cutoff = 132,
        results_height = 0.2,
        results_width = 0.2,
        -- preview_width = 0.7,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim" -- add this value
        },

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
        }
    }
}

require('telescope').load_extension('fzf')

-- Get the HOME directory from the environment
local home = os.getenv("HOME")

-- Add a custom path using $HOME
package.path = package.path .. ";" .. home .. "/dotfiles/private-work-files/vim/lua/?.lua"

local private_variables = require("private-work-variables") -- Now you can load the module
local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< Dotfiles >",
        cwd = "$HOME/dotfiles/",
        path_display = { "shorten" },
    })
end

M.search_notes = function()
    require("telescope.builtin").live_grep({
        prompt_title = "< Notes >",
        cwd = "$HOME/Notes/",
        path_display = { "shorten" },
        additional_args = function()
            return {"-tmarkdown"}  -- Only search markdown files
        end
    })
end

M.search_gnb = function()
    require("telescope.builtin").find_files({
        prompt_title = "< GNB >",
        cwd = private_variables.gnb_dir,
        path_display = { "shorten" },
        find_command = {
            "rg", "--files", "-tc",
        },
    })
end

M.search_mission = function()
    require("telescope.builtin").find_files({
        prompt_title = "< MISSION >",
        cwd = private_variables.mission_dir,
        path_display = { "shorten" },
        find_command = {
            "rg", "--files", "-tc",
        },
    })
end

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end

return M
