vim.opt.termguicolors = true

require('bufferline').setup {

    options = {
        -- numbers = function(args) return args.id; end,
        diagnostics = false,
        indicator_icon = '',
        buffer_close_icon = 'x',
        close_icon = 'x',
        modified_icon = '',
        left_trunc_marker = '<',
        right_trunc_marker = '>',

        offsets = {
            {filetype = "NvimTree", text = "Explorer", text_align = "center"},
            {filetype = "tagbar", text = 'Tagbar', text_align = 'center'},
            {filetype = "Outline", text = 'Outline', text_align = 'center'},
            {filetype = "vista", text = 'Vista', text_align = 'center'},
        },

        show_tab_indicators = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        enforce_regular_tabs = false,
        always_show_bufferline = false,
        separator_style = "slant",
    }
    ,
    highlights = {
        fill = {
            guifg = '#e4e111',
            guibg = '#4e4e4e',
        },
        background = {
            guifg = '#e4e4e4',
            guibg = '#af00af',
        },
        buffer_visible = {
            guifg = '#e4e4e4',
            guibg = '#af00af',
        },
        buffer_selected = {
            guifg = '#4e4e4e',
            guibg = '#e4e4e4',
            gui = "bold"
        },
        tab = {
            guifg = '#e4e111',
            guibg = '#af00af',
        },
        tab_selected = {
            guifg = '#4e4e4e',
            guibg = '#e4e4e4',
        },
        separator_selected = {
            guifg = '#4e4e4e',
            guibg = '#e4e4e4',
        },
        separator_visible = {
            guifg = '#4e4e4e',
            guibg = '#af00af',
        },
        separator = {
            guifg = '#4e4e4e',
            guibg = '#af00af',
        },
        indicator_selected = {
            guifg = '#af00af',
            guibg = '#B19F32',
        },
        pick_selected = {
            guifg = '#af00af',
            guibg = '#B19F32',
            gui = "bold,italic"
        },
        pick_visible = {
            guifg = '#af00af',
            guibg = '#B19F32',
            gui = "bold,italic"
        },
        pick = {
            guifg = '#af00af',
            guibg = '#B19F32',
            gui = "bold,italic"
        },
        modified = {
            guifg = '#e4e4e4',
            guibg = '#af00af',
        },
        modified_visible = {
            guifg = '#e4e4e4',
            guibg = '#af00af',

        },
        modified_selected = {
            guifg = '#4e4e4e',
            guibg = '#e4e4e4',
        },
    }
}
