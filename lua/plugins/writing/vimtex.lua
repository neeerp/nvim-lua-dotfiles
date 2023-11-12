return {
	"lervag/vimtex",
	ft = { "tex" },
	config = function()
		local kmap = vim.keymap.set
		kmap({ "n", "v", "i" }, "<F5>", "<CMD>VimtexCompile<CR>")

		vim.cmd([[
    let g:tex_flavor = 'latex'
    let g:vimtex_compiler_progname = 'nvr'
    let g:vimtex_compiler_method = 'latexmk'
    let g:vimtex_syntax_enabled = 0


    """""""""""""""""
    "    Outputs    "
    """""""""""""""""

    " We usually want PDF
    let g:Tex_DefaultTargetFormat='pdf'
    let g:Tex_CompileRule_pdf='pdflatex'


    let g:vimtex_compiler_latexmk = {
        \ 'options' : [
        \   '-pdf',
        \   '-shell-escape',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

        augroup VimtexCompileClear
          autocmd!
          autocmd User VimtexEventCompileSuccess silent exe '!latexmk -c'
        augroup END
        " autocmd User VimtexEventCompileStarted call VimtexView()
        " let g:vimtex_view_general_viewer = "sioyek"
        let g:vimtex_view_general_viewer = 'sioyek'
        let g:vimtex_view_automatic = 1
        " let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
      ]])
	end,
}
