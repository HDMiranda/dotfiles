require('colorizer').setup({
  '*',    -- Highlight all files, but customize some others.
  '!vim', -- Exclude vim from highlighting.
  css = { css = true },
  html = { mode = 'background' },
})
