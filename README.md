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
