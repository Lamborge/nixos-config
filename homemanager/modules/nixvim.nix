{ pkgs, ... }:

{
  programs.nixvim = {
    enable        = true;

    # ─── Vim-options ──────────────────────────────────────────────────
    opts = {
      number         = true;
      relativenumber = false;
      cursorline     = true;
      termguicolors  = true;
      signcolumn     = "yes";
      updatetime     = 300;
      expandtab      = true;
      shiftwidth     = 2;
      tabstop        = 2;
      smartindent    = true;
    };

    # ─── Keys ────────────────────────────────────────────────────
    keymaps = [
      { key = "<C-n>"; action = ":NvimTreeToggle<CR>"; options.silent = true; }
    ];

    # ─── AutoCMDs ────────────────────────────────────────────────
    autoCmd = [
      {
        event    = [ "BufReadPost" "BufWritePost" ];
        pattern  = "*.nix";
        callback = { __raw = "function() require('lint').try_lint() end"; };
      }
      {
        event    = [ "VimEnter" ];
        callback = { __raw = ''
          function(data)
            if vim.fn.isdirectory(data.file) == 1 then
              require('nvim-tree.api').tree.open()
            end
          end
        ''; };
      }
    ];

    # ─── Plugins ────────────────────────────────────────────────────
    plugins = {
      web-devicons.enable = true;

      # autotabs based on the file
      sleuth.enable = true;

      # smart tabs and syntax
      treesitter = {
        enable   = true;
        settings = {
          highlight.enable = true;
          indent.enable    = true;
        };
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          nix lua bash json toml
        ];
      };

      # files tree
      nvim-tree = {
        enable = true;
	settings = {
          view   = { width = 30; side = "left"; };
          renderer.group_empty = true;
          filters.dotfiles    = false;
	};
      };

      # status line
      lualine = {
        enable = true;
        settings.options = {
          theme                = "auto";
          globalstatus         = true;
          component_separators = { left = ""; right = ""; };
          section_separators   = { left = ""; right = ""; };
        };
      };

      # LSP
      lsp = {
        enable = true;
        servers.nil_ls = {
          enable = true;
          settings.formatting.command = [ "nixfmt" ];
        };
        keymaps = {
          lspBuf = {
            "K"           = "hover";
            "gd"          = "definition";
            "gr"          = "references";
            "<leader>rn"  = "rename";
            "<leader>ca"  = "code_action";
            "<leader>f"   = "format";
          };
          diagnostic = {
            "[d"          = "goto_prev";
            "]d"          = "goto_next";
            "<leader>e"   = "open_float";
          };
        };
      };

      # autocomplite
      cmp = {
        enable = true;
        settings = {
          snippet.expand = "luasnip";
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>"      = "cmp.mapping.confirm({ select = true })";
            "<C-e>"     = "cmp.mapping.abort()";
            "<Tab>"     = { __raw = ''
              cmp.mapping(function(fallback)
                local luasnip = require('luasnip')
                if cmp.visible() then cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
                else fallback() end
              end, { 'i', 's' })
            ''; };
            "<S-Tab>"   = { __raw = ''
              cmp.mapping(function(fallback)
                local luasnip = require('luasnip')
                if cmp.visible() then cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then luasnip.jump(-1)
                else fallback() end
              end, { 'i', 's' })
            ''; };
          };
        };
      };

      luasnip.enable    = true;
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable   = true;

      # linting
      lint = {
        enable        = true;
        lintersByFt.nix = [ "statix" ];
      };
    };

    extraPackages = with pkgs; [
      nil
      statix
      deadnix
      nixfmt
    ];

    extraConfigLua = ''
      vim.diagnostic.config {
        virtual_text     = true,
        signs            = true,
        underline        = true,
        update_in_insert = false,
      }
    '';
  };
}
