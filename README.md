# Cursus lidR – drone-LiDAR in mangroves (dag 4–5)

Drie delen, elk een Quarto-document:

1. `01_bekijken.qmd`: puntenwolk inlezen en in 3D bekijken
2. `02_lidr.qmd`: terrein, kronendak, kenmerken en bomen met lidR
3. `03_biomassa.qmd`: biomassakaart met de veldplots van Coronie

## Voor deelnemers

1. Pak de cursusmap uit en zet de map `data` erin (zie hieronder).
2. Dubbelklik op `LiDAR_cursus.Rproj`, open `index.qmd` en volg de uitleg.

## Data (map `data/`)

| Bestand | Inhoud | Grootte |
|---|---|---|
| `SU6_20pts.laz` | Hele locatie SU6, 20 punten/m² | 195 MB |
| `SU6_P1_100pts.laz`, `_P2_`, `_P3_` | Uitsneden 100 × 100 m, 100 punten/m² | 3 × 12 MB |
| `Coronie_T1_20pts.laz`, `Coronie_T2_20pts.laz` | Transecten Coronie 2024, genormaliseerd, 20 punten/m² | 189 + 151 MB |
| `Coronie2024_field_plot_data.csv` | Veldplots Coronie (straal 12,5 m), AGB in Mg/ha | 11 kB |

SU6: Zenmuse L2, 10 nov 2026, ruwe hoogtes met grondclassificatie van DJI Terra. Coronie: Feyen et al., CC BY 4.0 (Zenodo).

**Een nieuwe locatie (bv. SU2) toevoegen:** voeg de uitgedunde tegels samen tot één bestand en snijd de plekken uit. In R:

```r
library(lidR)
tegels <- list.files("F:/Drone_training/data/pointclouds_training/L2_SU2/L2_SU2_20pts", full.names = TRUE)
writeLAS(readLAS(tegels), "data/SU2_20pts.laz")

tegels100 <- list.files("F:/Drone_training/data/pointclouds_training/L2_SU2/L2_SU2_100pts", full.names = TRUE)
x <- 705100; y <- 656600                       # middelpunt van de plek (voorbeeld, aanpassen)
plek <- readLAS(tegels100, filter = paste("-keep_xy", x - 50, y - 50, x + 50, y + 50))
writeLAS(plek, "data/SU2_P1_100pts.laz")
```

## Data verdelen

De data (± 570 MB, met SU2 ± 800 MB) passen niet in een gewone GitHub-repository: GitHub weigert bestanden groter dan 100 MB. Daarom:

- **GitHub-release**: zet `data.zip` als bijlage bij een *release* van de repository (*Releases → Draft a new release*, bestand toevoegen). Bijlagen mogen tot 2 GB. Deelnemers downloaden de code en `data.zip` van dezelfde pagina.
- **USB-stick**: zelfde zip, als reserve voor wie onderweg geen goede verbinding heeft.

## De website maken en publiceren

Zoals https://liamirwin.github.io/SL25_lidRtutorial/: de gerenderde website staat in de map `docs/` van de repository, en GitHub Pages toont die map.

Eenmalig:

1. Installeer Git (https://git-scm.com) en maak een account op github.com.
2. Maak op github.com een nieuwe, **publieke** repository, bv. `lidR-mangrove-cursus`, zonder README.
3. Terminal van RStudio, in deze map:
   ```
   quarto render
   git init
   git add .
   git commit -m "Cursus lidR"
   git branch -M main
   git remote add origin https://github.com/<gebruiker>/lidR-mangrove-cursus.git
   git push -u origin main
   ```
4. Op GitHub: *Settings → Pages → Build and deployment → Deploy from a branch*, branch `main`, map `/docs`, *Save*.

Na een minuut staat de site op `https://<gebruiker>.github.io/lidR-mangrove-cursus/`.

Na elke wijziging: `quarto render`, dan `git add .`, `git commit -m "…"` en `git push`.

`.Rprofile` en de `knitr`-regels in `_quarto.yml` zetten de 3D-figuren van `plot(las)` als draaibare figuur in de website (maximaal 150 000 punten per figuur). Tijdens de cursus opent `plot(las)` gewoon een venster.
