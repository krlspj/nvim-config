# Neovim 42 config
This neovim configuration implements the 42header and the norminette

## Colortheme

### How to Install Fonts for Neovim Plugins

Some Neovim plugins, such as `nvim-web-devicons`, require **Nerd Fonts** to display icons properly. Follow these steps to install and configure the **Bitstream Vera Nerd Font**, a lightweight and clean font with added glyphs.

---

#### 1. Download Bitstream Vera Nerd Font
Bitstream Vera Nerd Font is a patched version of the classic Bitstream Vera font with added icons and glyphs.

- Visit the [Nerd Fonts GitHub Release Page](https://github.com/ryanoasis/nerd-fonts/releases) to find the latest version.

Alternatively, use the following commands to download and install Bitstream Vera Nerd Font:

#### On Ubuntu/Fedora:
```bash
# Create a directory for local fonts
mkdir -p ~/.local/share/fonts

# Navigate to the fonts directory
cd ~/.local/share/fonts

# Download Bitstream Vera Nerd Font
wget -O Bitstream-Vera.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/BitstreamVeraSansMono.zip

# Extract the font files
unzip Bitstream-Vera.zip

# Update the font cache
fc-cache -fv
```

---

#### 2. Set the Font in Your Terminal
After installing the Bitstream Vera Nerd Font, configure your terminal emulator to use it.

#### For GNOME Terminal:
1. Open GNOME Terminal and go to **Preferences**.
2. Select your profile and navigate to the **Text** tab.
3. Enable **Custom font** and choose the installed Bitstream Vera Nerd Font (e.g., `Bitstream Vera Sans Mono Nerd Font`).

#### For Other Terminals:
- Refer to the terminal’s documentation for font configuration. Most terminal emulators, like Alacritty, Kitty, and Konsole, support custom fonts.

---

#### 3. Verify Font Installation
Test the font in your terminal by typing or pasting the following characters:
```text
  
```
If the icons display correctly, the Bitstream Vera Nerd Font is properly installed and configured.

---

#### 4. Configure `nvim-web-devicons`
Ensure that the `nvim-web-devicons` plugin is properly set up in your Neovim configuration:

#### Example (Lua):
```lua
require'nvim-web-devicons'.setup {
  default = true; -- Use default icons if no match is found
}
```

---

## 5. Optional: Install Fonts System-Wide
For system-wide font installation (accessible by all users):
1. Copy the font files to the system fonts directory:
   ```bash
   sudo mkdir -p /usr/share/fonts/nerd-fonts
   sudo cp ~/.local/share/fonts/* /usr/share/fonts/nerd-fonts/
   sudo fc-cache -fv
   ```
2. Select the font in your terminal as described above.

---

## 6. Enjoy Enhanced Icons!
With the Bitstream Vera Nerd Font installed and configured, your Neovim plugins can render beautiful icons seamlessly. If you encounter any issues, ensure the font is correctly set in your terminal and verify the plugin setup in Neovim.


### Neovim colortheme commands

* set custom baground:
```
:highlight Normal guibg=#1F1F1F
```
* configure custom background
```
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
```
* configure custom background for theme
```
require("dracula").setup({
    colors = {
        bg = "#000000", -- Set a custom darker background color
    },
})
vim.cmd("colorscheme dracula")
```
* special chars
```
vim.cmd([[
  highlight SpecialChar guifg=#ff5555 ctermfg=9
]])
-- or
require("dracula").setup({
  overrides = {
    SpecialChar = { fg = "#ff5555" }, -- Adjust this to a color that stands out.
  },
})
```
