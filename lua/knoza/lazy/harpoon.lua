return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    require("telescope").load_extension("harpoon")

    harpoon:setup({})

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<leader>fm", function() toggle_telescope(harpoon:list()) end,
      { desc = "Open harpoon window" })

    vim.keymap.set("n", "<leader>ma", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>mr", function() harpoon:list():remove() end)
    vim.keymap.set("n", "<leader>mc", function() harpoon:list():clear() end)
    vim.keymap.set("n", "<leader>mn", function() harpoon:list():next() end)
    vim.keymap.set("n", "<leader>mp", function() harpoon:list():prev() end)

    vim.keymap.set("n", "<leader>m1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>m2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>m3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>m4", function() harpoon:list():select(4) end)
    vim.keymap.set("n", "<leader>m5", function() harpoon:list():select(5) end)
    vim.keymap.set("n", "<leader>r1", function() harpoon:list():replace_at(1) end)
    vim.keymap.set("n", "<leader>r2", function() harpoon:list():replace_at(2) end)
    vim.keymap.set("n", "<leader>r3", function() harpoon:list():replace_at(3) end)
    vim.keymap.set("n", "<leader>r4", function() harpoon:list():replace_at(4) end)
    vim.keymap.set("n", "<leader>r5", function() harpoon:list():replace_at(5) end)
  end
}
