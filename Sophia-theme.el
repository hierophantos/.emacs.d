(deftheme Sophia
  "Created 2015-12-10.")

(custom-theme-set-variables
 'Sophia
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(ansi-term-color-vector [unspecified "#081724" "#ff694d" "#68f6cb" "#fffe4e" "#bad6e2" "#afc0fd" "#d2f1ff" "#d3f9ee"]))

(custom-theme-set-faces
 'Sophia
 '(default ((t (:background nil))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "moccasin"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "yellow green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "PaleGreen2"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "SteelBlue1"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "MediumPurple1"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "salmon1"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "gold1"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "pink")))))

(provide-theme 'Sophia)
