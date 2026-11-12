# =============================================================================
# 00_installatie.R  -  installeer alles wat je nodig hebt voor dag 5 (lidR)
#
# Hoe gebruiken:
#   1. Installeer eerst R en RStudio (zie de README of de startpagina van de cursus).
#   2. Open dit bestand in RStudio (File > Open File...).
#   3. Klik rechtsboven in het scriptvenster op "Source"
#      (of druk Ctrl+Shift+S, op Mac Cmd+Shift+S).
#   4. Wacht tot je "INSTALLATIE OK" ziet. De eerste keer duurt dit
#      5 tot 15 minuten en heb je internet nodig.
#
# Krijg je de vraag "Do you want to install from sources the packages which
# need compilation?" -> typ  no  en druk Enter.
# Krijg je de vraag of je een "personal library" wil gebruiken -> typ  yes.
# =============================================================================

cat("\n== Stap 1/3: controle van R ==\n")
cat("R-versie:", R.version.string, "\n")
if (getRversion() < "4.3.0") {
  stop("Je R-versie is te oud. Installeer de nieuwste R via https://cran.r-project.org ",
       "en start RStudio opnieuw.")
}

# Instellingen voor een trage of onstabiele internetverbinding
options(repos = c(CRAN = "https://cloud.r-project.org"),
        timeout = 900,
        install.packages.compile.from.source = "never")
bin_type <- if (.Platform$OS.type == "windows" || Sys.info()[["sysname"]] == "Darwin") "binary" else getOption("pkgType")

# ---- Pakketten ---------------------------------------------------------------
#   lidR   : puntenwolken lezen, DTM, CHM, metrics, bomen segmenteren
#            (installeert ook rgl, sf, terra en stars mee)
#   terra  : rasters (DTM, CHM, kaarten)
#   sf     : vectordata (plots, transecten)
#   RCSF   : grondpunten classificeren met het CSF-algoritme
#   future : verwerking in parallel op meerdere kernen
#   leaflet: interactieve kaart met satellietbeeld (deel 1)
pakketten <- c("lidR", "terra", "sf", "RCSF", "future", "leaflet")

cat("\n== Stap 2/3: pakketten installeren ==\n")
ontbreekt <- pakketten[!vapply(pakketten, requireNamespace, logical(1), quietly = TRUE)]
if (length(ontbreekt) == 0) {
  cat("Alle pakketten zijn al geinstalleerd.\n")
} else {
  cat("Installeren:", paste(ontbreekt, collapse = ", "), "\n(dit kan even duren)\n\n")
  install.packages(ontbreekt, dependencies = TRUE, type = bin_type)
}

nog_steeds <- pakketten[!vapply(pakketten, requireNamespace, logical(1), quietly = TRUE)]
if (length(nog_steeds)) {
  stop("Deze pakketten konden niet geinstalleerd worden: ", paste(nog_steeds, collapse = ", "),
       "\nControleer je internet en voer het script opnieuw uit. ",
       "Lukt het niet, toon deze foutmelding aan de lesgever.")
}

suppressPackageStartupMessages(for (p in pakketten) library(p, character.only = TRUE))
for (p in pakketten) cat(sprintf("  %-7s %s\n", p, as.character(packageVersion(p))))

# ---- Test met de voorbeelddata van lidR (geen trainingsdata nodig) -----------
cat("\n== Stap 3/3: korte test ==\n")
t0 <- Sys.time()

topo <- readLAS(system.file("extdata", "Topography.laz", package = "lidR"), select = "xyzc")
topo <- classify_ground(topo, algorithm = csf())
dtm  <- rasterize_terrain(topo, res = 1, algorithm = tin())
cat("DTM gemaakt:", paste(dim(dtm)[1:2], collapse = " x "), "cellen\n")

las   <- readLAS(system.file("extdata", "MixedConifer.laz", package = "lidR"))
chm   <- rasterize_canopy(las, res = 0.5, algorithm = p2r())
toppen <- locate_trees(las, lmf(ws = 5))
cat("CHM gemaakt en", nrow(toppen), "boomtoppen gevonden\n")

oldpar <- par(mfrow = c(1, 2))
plot(dtm, col = terrain.colors(50), main = "Test: terreinmodel (DTM)")
plot(chm, col = hcl.colors(50, "viridis"), main = "Test: kruinhoogte (CHM)")
plot(sf::st_geometry(toppen), add = TRUE, pch = 3, cex = 0.6)
par(oldpar)

cat(sprintf("\nTest duurde %.1f s.\n", as.numeric(difftime(Sys.time(), t0, units = "secs"))))
cat("\n================================\n  INSTALLATIE OK - je bent klaar!\n================================\n")
