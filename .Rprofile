# Alleen bij het maken van de website (quarto render), niet tijdens de cursus.
# Tijdens de cursus opent plot(las) gewoon een 3D-venster.
# Op de website wordt dezelfde figuur een draaibare 3D-figuur in de pagina.
# Om de pagina's licht te houden, tonen we daar maximaal 150 000 punten per figuur.
if (!interactive()) {
  options(rgl.useNULL = TRUE)
  setHook(packageEvent("knitr", "onLoad"), function(...) {
    knitr::knit_hooks$set(webgl = function(before, options, envir) {
      if (!before && rgl::cur3d() != 0) {
        sc <- rgl::ids3d()
        ids <- sc$id[sc$type == "points"]
        for (id in ids) {
          v <- rgl::rgl.attrib(id, "vertices")
          if (nrow(v) > 150000) {
            k <- sort(sample.int(nrow(v), 150000))
            kl <- rgl::rgl.attrib(id, "colors")
            if (nrow(kl) > 1) kl <- kl[k, , drop = FALSE]
            rgl::pop3d(id = id)
            rgl::points3d(v[k, ], color = grDevices::rgb(kl[, 1], kl[, 2], kl[, 3]), size = 2)
          }
        }
        rgl::view3d(theta = 0, phi = -60, zoom = 0.85)
      }
      rgl::hook_webgl(before, options, envir)
    })
  })
}
