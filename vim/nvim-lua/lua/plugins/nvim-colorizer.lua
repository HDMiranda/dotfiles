return {
  'norcalli/nvim-colorizer.lua',
  opts = {
    '*',    -- Highlight all files, but customize some others.
    '!vim', -- Exclude vim from highlighting.
    css = { css = true },
    html = { mode = 'background' },
  }
}
