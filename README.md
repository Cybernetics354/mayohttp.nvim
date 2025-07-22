# mayohttp.nvim

A Neovim plugin for [Mayo HTTP](https://github.com/Cybernetics354/mayohttp).

![Demo](./readme/mayohttp.gif)

## Installation

Using `packer.nvim`:

```lua
use {
  "Cybernetics354/mayohttp.nvim",
  config = function()
    require("mayohttp").setup()
  end,
}
```

Using `lazy.nvim`:

```lua
{
  "Cybernetics354/mayohttp.nvim",
  config = function()
    require("mayohttp").setup()
  end,
}
```


## Configuration

The following is the default configuration:

```lua
require("mayohttp").setup({
  cmd = "mayohttp",
  args = {},
  window = {
    width_scale = 1,
    height_scale = 1,
    style = "minimal",
    border = "none", -- none | single  | double | rounded | solid | shadow
  },
})
```

You can override any of these values in the `setup` function.

## Usage

Run the following command to open the Mayo HTTP client:

```
:MayoHttp
```

You can also map the command to a key:
```lua
vim.keymap.set("n", "<leader>tt", "<cmd>MayoHttp<CR>")
```

## License

MIT License

Copyright (c) 2025 <corecybernetics354@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
