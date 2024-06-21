local os = require('os')

_G.insert_date = function()
    local date = os.date('*t')
    local date_string = string.format('%04d-%02d-%02d %02d:%02d:%02d', date.year, date.month, date.day, date.hour, date.min, date.sec)

    -- Insertar esta cadena de texto en la posición actual del cursor en el buffer
    vim.api.nvim_put({date_string}, 'l', true, true)
end

_G.archive_current_line = function()
  local date = os.date('*t') -- Obtener la fecha y hora actual
  local home = os.getenv("HOME") -- Obtener la variable de entorno HOME
  local archive_patch = home .. '/wiki/archive.md'

  -- Obtener el número de línea actual
  local current_line = vim.api.nvim_win_get_cursor(0)[1]

  -- Obtener el texto de la línea actual
  local line_text = vim.api.nvim_buf_get_lines(0, current_line-1, current_line, false)[1]
  -- Formatear la fecha y hora en una cadena de texto
  local date_string = string.format('%04d-%02d-%02d %02d:%02d:%02d', date.year, date.month, date.day, date.hour, date.min, date.sec)

  local archive_file = io.open(archive_patch, 'a')

  archive_file:write(date_string .. ' ' .. line_text .. '\n')
  archive_file:close()

  -- Eliminar la línea actual del buffer
  vim.api.nvim_buf_set_lines(0, current_line-1, current_line, false, {})
end

local function executeAppleScriptCommand (...)
  local args = {...}
  local command = "osascript -e '" .. table.concat(args, "' -e '") .. "'"

  os.execute(command)
end

_G.xcodeRun = function ()
  executeAppleScriptCommand(
    'activate application "Xcode"',
    'tell application "System Events" to tell process "Xcode" to keystroke "r" using command down'
  )
end

--
-- Comandos
--

vim.cmd('command! InsertDate lua _G.insert_date()')
vim.cmd('command! ToArchive lua _G.archive_current_line()')
-- Xcode Run
vim.cmd('command! Run lua _G.xcodeRun()')
