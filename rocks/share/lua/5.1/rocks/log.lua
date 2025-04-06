---@mod rocks-log rocks.nvim logging API
---
---@brief [[
---
---The logging interface for rocks.nvim.
---Intended to be used by external modules.
---
---@brief ]]

-- Copyright (C) 2023 Neorocks Org.
--
-- Version:    0.1.0
-- License:    GPLv3
-- Created:    12 Dec 2023
-- Updated:    12 Dec 2023
-- Homepage:   https://github.com/nvim-neorocks/rocks.nvim
-- Maintainers: NTBBloodbath <bloodbathalchemist@protonmail.com>, Vhyrro <vhyrro@gmail.com>, mrcjkb <marc@jakobi.dev>

local log = {}

-- NOTE: These functions are initialised as empty for type checking purposes
-- and implemented later.

---@type fun(any)
function log.trace(_) end
---@type fun(any)
function log.debug(_) end
---@type fun(any)
function log.info(_) end
---@type fun(any)
function log.warn(_) end
---@type fun(any)
function log.error(_) end

local LARGE = 1e9

local log_date_format = "%F %H:%M:%S"

local function format_log(arg)
    return vim.inspect(arg)
end

---Get the rocks.nvim log file path.
---@package
---@return string filepath
function log.get_logfile()
    return vim.fs.joinpath(require("rocks.config.internal").rocks_path, "rocks.log")
end

---Open the rocks.nvim log file.
---@package
function log.open_logfile()
    vim.cmd.e(log.get_logfile())
end

local logfile, openerr
---@private
---Opens log file. Returns true if file is open, false on error
---@return boolean
local function open_logfile()
    -- Try to open file only once
    if logfile then
        return true
    end
    if openerr then
        return false
    end

    vim.fn.mkdir(require("rocks.config.internal").rocks_path, "-p")
    logfile, openerr = io.open(log.get_logfile(), "w+")
    if not logfile then
        local err_msg = string.format("Failed to open rocks.nvim log file: %s", openerr)
        vim.notify(err_msg, vim.log.levels.ERROR)
        return false
    end

    local log_info = vim.uv.fs_stat(log.get_logfile())
    if log_info and log_info.size > LARGE then
        local warn_msg =
            string.format("rocks.nvim log is large (%d MB): %s", log_info.size / (1000 * 1000), log.get_logfile())
        vim.notify(warn_msg, vim.log.levels.WARN)
    end

    -- Start message for logging
    logfile:write(string.format("[START][%s] rocks.nvim logging initiated\n", os.date(log_date_format)))
    return true
end

local log_levels = vim.deepcopy(vim.log.levels)
for levelstr, levelnr in pairs(log_levels) do
    log_levels[levelnr] = levelstr
end

---Set the log level
---@param level (string|integer) The log level
---@see vim.log.levels
---@usage `log.set_level(vim.log.levels.DEBUG)`
function log.set_level(level)
    if type(level) == "string" then
        log.level = assert(log_levels[string.upper(level)], string.format("rocks.nvim: Invalid log level: %q", level))
    else
        assert(log_levels[level], string.format("rocks.nvim: Invalid log level: %d", level))
        log.level = level
    end
    vim.lsp.set_log_level(log.level)
end

for level, levelnr in pairs(vim.log.levels) do
    log[level:lower()] = function(...)
        if log.level == vim.log.levels.OFF or not open_logfile() then
            return false
        end
        local argc = select("#", ...)
        if levelnr < log.level then
            return false
        end
        if argc == 0 then
            return true
        end
        local info = debug.getinfo(2, "Sl")
        local fileinfo = string.format("%s:%s", info.short_src, info.currentline)
        local _, millis = vim.uv.gettimeofday()
        local parts = {
            table.concat(
                { level, "|", os.date(log_date_format) .. "." .. tostring(millis):sub(1, 3), "|", fileinfo, "|" },
                " "
            ),
        }
        for i = 1, argc do
            local arg = select(i, ...)
            if arg == nil then
                table.insert(parts, "<nil>")
            elseif type(arg) == "string" then
                table.insert(parts, arg)
            else
                table.insert(parts, format_log(arg))
            end
        end
        logfile:write(table.concat(parts, " "), "\n")
        logfile:flush()
    end
end

--- NOTE: We can't use rocks.config here, as that would lead to a cyclic module dependency
log.set_level(vim.tbl_get(vim.g, "rocks_nvim", "_log_level") or vim.log.levels.WARN)

return log
