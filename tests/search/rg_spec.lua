local rg = require('spectre.search').rg
local eq = assert.are.same

vim.cmd [[tcd tests/project]]

local time_wait = 1000

describe("[rg] search ", function()

    -- it("should not empty", function()
    --     local finish = false
    --     local total = {}
    --     local total_item = 0
    --     local finder = rg:new({}, {
    --         on_result = function(item)
    --             table.insert(total, item)
    --             total_item = total_item + 1
    --         end,
    --         on_finish = function()
    --             finish = true
    --         end
    --     })
    --     finder:search({search_text = "spectre"})
    --     vim.wait(time_wait, function()
    --         return finish
    --     end)
    --     eq(2, total_item, "should have 2 item")

    -- end)

    -- it("should call finish function", function()
    --     local finish = false
    --     local total = {}
    --     local total_item = 0
    --     local finder = rg:new({}, {
    --         on_result = function(item)
    --             table.insert(total, item)
    --             total_item = total_item + 1
    --         end,
    --         on_finish = function()
    --             finish = true
    --         end
    --     })
    --     finder:search({search_text = "spectre"})
    --     vim.wait(time_wait, function()
    --         return finish
    --     end)
    --     eq(true, finish, "finish is not call")
    -- end)

    -- it("search with path should not empty", function()
    --     local finish = false
    --     local total = {}
    --     local total_item = 0
    --     local finder = rg:new({}, {
    --         on_result = function(item)
    --             table.insert(total, item)
    --             total_item = total_item + 1
    --         end,
    --         on_finish = function()
    --             finish = true
    --         end
    --     })
    --     finder:search({search_text = "spectre", path = "**/rg_spec/*.txt"})
    --     vim.wait(time_wait, function()
    --         return finish
    --     end)
    --     eq(1, total_item, "should have 1 item")

    -- end)

    it("search with specify folder", function()
        local finish = false
        local total = {}
        local total_item = 0
        local finder = rg:new({}, {
            on_result = function(item)
                table.insert(total, item)
                total_item = total_item + 1
            end,
            on_finish = function()
                finish = true
            end
        })
        finder:search({
            cwd="/home/trieu/test/",
            search_text = "neovim",
        })
        vim.wait(time_wait, function()
            return finish
        end)

        eq(398, total_item, "should have 1 item")

    end)
end)
