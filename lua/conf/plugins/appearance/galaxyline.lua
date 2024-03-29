local gl = require('galaxyline')
local condition = require('galaxyline.condition')

-- onedark
local colors = {
  --bg = '#282c34',
  bg = None,
  bg_dim = '#333842',
  bg_light = '#444b59',
  black = '#222222',
  white = '#abb2bf',
  gray = '#868c96',
  red = '#e06c75',
  green = '#98c379',
  yellow = '#e5c07b',
  blue = '#61afef',
  purple = '#7c7cff', -- tweaked to match custom color
  teal = '#56b6c2',
}

local catppuccin = {
    gray    = '#2A2B3C',
    blue    = '#89B4FA',
    red     = '#EBA0AC',
    green   = '#A6E3A1',
    purple  = '#CBA6F7',
    black   = '#181825',
    yellow  = '#F9E2AF',
    teal    = '#74C7EC',
    white   = '#C9D2EF', 
    dark    = '#B4BEFE'
}

local function mode_alias(m)
  local alias = {
    n = 'NORMAL',
    i = 'INSERT',
    c = 'COMMAND',
    R = 'REPLACE',
    t = 'TERMINAL',
    [''] = 'V-BLOCK',
    V = 'V-LINE',
    v = 'VISUAL',
  }

  return alias[m] or ''
end

local function mode_color(m)
  local mode_colors = {
    --normal =  colors.green,
    normal  = catppuccin.blue,
    insert  = catppuccin.green,
    visual  = catppuccin.purple,
    replace = catppuccin.red,
    --insert =  colors.blue,
    --visual =  colors.purple,
    --replace =  colors.red,
  }

  local color = {
    n = mode_colors.normal,
    i = mode_colors.insert,
    c = mode_colors.replace,
    R = mode_colors.replace,
    t = mode_colors.insert,
    [''] = mode_colors.visual,
    V = mode_colors.visual,
    v = mode_colors.visual,
  }

  --return color[m] or colors.bg_light
  return color[m] or catppuccin.gray
end

-- disable for these file types
gl.short_line_list = { 'startify', 'nerdtree', 'term', 'fugitive', 'NvimTree' }

gl.section.left[1] = {
  ViModeIcon = {
    separator = '  ',
    separator_highlight = {catppuccin.black, catppuccin.gray},
    highlight = {catppuccin.white, catppuccin.black},
    
    provider = function() 
      local m = vim.fn.mode() or vim.fn.visualmode()
      local mode = mode_alias(m)
      local color = mode_color(m)
      vim.api.nvim_command('hi GalaxyViModeIcon guifg=' .. color)
      return "    " 
    end,
    
  }
}

gl.section.left[2] = {
  CWD = {
    separator = '  ',
    separator_highlight = function()
      return {catppuccin.gray, condition.buffer_not_empty() and catppuccin.black or colors.bg}
    end,
    highlight = {catppuccin.white, catppuccin.gray},
    provider = function()
      local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
      return ' ' .. dirname .. ' '
    end,
  }
}

gl.section.left[3] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {catppuccin.white, catppuccin.black},
  }
}

gl.section.left[4] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {catppuccin.white, catppuccin.black},
    separator_highlight = {catppuccin.black, colors.bg},
    separator = '  ',
  }
}

gl.section.left[5] = {
  DiffAdd = {
    icon = '  ',
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    highlight = {catppuccin.green, colors.bg},
  }
}

gl.section.left[6] = {
  DiffModified = {
    icon = '  ',
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    highlight = {catppuccin.blue, colors.bg},
  }
}

gl.section.left[7] = {
  DiffRemove = {
    icon = '  ',
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    highlight = {catppuccin.red, colors.bg},
  }
}

gl.section.left[8] = {
  CocStatus = {
    --highlight = {colors.gray, colors.bg},
    highlight = {catppuccin.red, colors.bg},
    provider = function()
      return vim.fn['coc#status']()
        :gsub('\u{274c}', '\u{f06a}')         -- 
        :gsub('\u{26a0}\u{fe0f}', '\u{f071}') -- 
    end
  }
}

gl.section.left[9] = {
  CocFunction = {
    icon = 'λ ',
    highlight = {catppuccin.gray, colors.bg},
    provider = function()
      local has_func, func_name = pcall(vim.api.nvim_buf_get_var, 0, 'coc_current_function')
      if not has_func then return '' end
      return func_name or ''
    end,
  }
}

gl.section.right[1] = {
  FileType = {
    highlight = {catppuccin.dark, colors.bg},
    provider = function()
      local buf = require('galaxyline.provider_buffer')
      return string.lower(buf.get_buffer_filetype())
    end,
  }
}

gl.section.right[2] = {
  GitBranch = {
    icon = ' ',
    separator = '  ',
    condition = condition.check_git_workspace,
    highlight = {catppuccin.yellow, colors.bg},
    provider = 'GitBranch',
  }
}

gl.section.right[3] = {
  FileLocation = {
    icon = ' ',
    separator = ' ',
    separator_highlight = {catppuccin.gray, colors.bg},
    highlight = {catppuccin.dark, catppuccin.gray},
    provider = function()
      local current_line = vim.fn.line('.')
      local total_lines = vim.fn.line('$')

      if current_line == 1 then
        return 'Top'
      elseif current_line == total_lines then
        return 'Bot'
      end

      local percent, _ = math.modf((current_line / total_lines) * 100)
      return '' .. percent .. '%'
    end,
  }
}

vim.api.nvim_command('hi GalaxyViModeReverse guibg=' .. catppuccin.gray)

gl.section.right[4] = {
  ViMode = {
    icon =  '󰸳',
    separator = ' ',
    separator_highlight = 'GalaxyViModeReverse',
    --highlight = {catppuccin.gray, mode_color()},
    highlight = {catppuccin.gray, catppuccin.gray},
    provider = function()
      local m = vim.fn.mode() or vim.fn.visualmode()
      local mode = mode_alias(m)
      local color = mode_color(m)
      vim.api.nvim_command('hi GalaxyViMode guibg=' .. color)
      vim.api.nvim_command('hi GalaxyViModeReverse guifg=' .. color)
      return ' ' .. mode .. ' '
    end,
  }
}
