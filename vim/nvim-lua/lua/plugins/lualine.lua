local colors = {
  red = '#ca1243',
  black = '#383a42',
  white = '#f3f3f3',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
  section_color = '#5f6a8f',
  dark_grey = '#323c41',
}

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.section_color },
    c = { fg = colors.black, bg = colors.dark_grey },
    z = { fg = colors.white, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.light_green } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.green } },
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
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.dark_grey } })
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
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
  config = function()
    require('lualine').setup(
      {
        options = {
          theme = 'everforest',
          component_separators = '',
          section_separators = { left = '', right = '' },
          icons_enabled = true,
          globalstatus = false,
        },
        sections = process_sections {
          lualine_a = {
            { 'mode', color = { gui = 'bold' } }
          },
          lualine_b = {
            'branch',
            'diff',
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
            { 'filename', file_status = false,        path = 1 },
            { modified,   color = { bg = colors.red } },
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
          lualine_y = { search_result, 'filetype' },
          lualine_z = { '%l:%c', '%p%%/%L' },
        },
        tabline = {
          lualine_a = {
            {
              'buffers',
              buffers_color = { active = 'lualine_b_normal' },
            },
          },
          lualine_z = {
            {
              'tabs',
              tabs_color = { active = 'lualine_b_normal' },
            },
          },
        },
        extensions = { 'quickfix', 'nvim-tree' },
        inactive_sections = {
          lualine_a = {
            { modified, color = { bg = colors.orange, gui = 'bold' } },
          },
          lualine_c = { '%f %y %m' },
        },
      }
    )
  end
}
