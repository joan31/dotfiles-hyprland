require("colorizer").setup({
    -- active dans tous les fichiers
    "*",
    -- options spécifiques par filetype (exemple CSS)
    css = { rgb_fn = true, tailwind = true }, 
    html = { names = false }, -- désactive noms de couleur dans html
})
