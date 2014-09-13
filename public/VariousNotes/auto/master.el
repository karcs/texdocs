(TeX-add-style-hook "master"
 (lambda ()
    (LaTeX-add-index-entries
     "bla")
    (LaTeX-add-labels
     "a"
     "cauchy-f-eq"
     "3-cycl-an"
     "p-sylow-cong"
     "p-sylow-div"
     "p-sylow-nor"
     "or-stab-ff-trans"
     "prim-act"
     "p-stab-max-subgr"
     "bew"
     "nor-act-tr"
     "min-nor-act-tr"
     "sact-prim"
     "quot-int-dom"
     "prim-id"
     "quot-field"
     "max-id")
    (TeX-add-symbols
     '("newusedecl" ["argument"] 1)
     '("gobblenext" 1)
     '("newdecl" 2)
     "x"
     "csvdel"
     "checknextarg"
     "com"
     "a"
     "b"
     "Sum"
     "iso"
     "arg")
    (TeX-run-style-hooks
     "layer"
     "mathenv"
     "blindtext"
     "xparse"
     "makeidx"
     "etoolbox"
     ""
     "latex2e"
     "art10"
     "article"
     "a4paper"
     "8pt"
     "../Config/math")))

