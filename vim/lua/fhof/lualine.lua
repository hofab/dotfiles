local colors = {
  red = '#e5786d',
  grey = '#a8a8a8',
  light_grey = '#d0d0d0',
  dark_grey = '#666666',
  med_grey = '#969696',
  black = '#4e4e4e',
  white = '#4e4e4e',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#95e454',
  normal = '#af00af',
  visual = '#f2c68a',
  light_text = '#dadada',
  normal_text = '#4e4e4e',
}

local theme = {
  normal = {
    a = { fg = colors.light_text, bg = colors.normal },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.white },
    z = { fg = colors.white, bg = colors.light_text },
  },
  insert = { a = { fg = colors.normal_text, bg = colors.green } },
  visual = { a = { fg = colors.normal_text, bg = colors.visual } },
  replace = { a = { fg = colors.normal_text, bg = colors.orange } },
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return ''
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return ''
  end
  return ''
end

require('lualine').setup {
  options = {
    theme = theme,
    component_separators = '%',
    section_separators = { left = '', right = '' },
  },
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      {'diff', color = { bg = colors.med_grey } },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      },
      { modified, color = { fg = colors.light_text } },
      'lsp_progress',
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { {'%l:%c', color = { fg = colors.light_text, bg = colors.dark_grey } } },
    lualine_z =
    {
      {'filetype', color = { fg = colors.light_text, bg = colors.grey } },
      { 'filename', file_status = false, path = 1, color = { fg = colors.light_text, bg = colors.med_grey } },
    },
  },
  inactive_sections = {
    lualine_c = {},
    lualine_x = {},
  },
  tabline = {
        lualine_a = {{
          'tabs',
          tabs_color = {
              active    = {fg = colors.light_grey, bg = colors.normal },
              inactive = {fg = colors.dark_grey, bg = colors.light_grey },
          },
          section_separators = { left = '', right = '' },
          mode=2
        }},
  },
}
