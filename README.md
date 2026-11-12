# Drone-LiDAR in mangroves: een eerste kennismaking met lidR

Cursusmateriaal voor de verwerking van drone-LiDAR (DJI Matrice 350 RTK met Zenmuse L2) in mangrovebos in Suriname, met het R-pakket [lidR](https://github.com/r-lidar/lidR).

**Website van de cursus:** <https://jasperfe.github.io/lidR-mangrove-cursus/>

## Doel

Een **eerste kennismaking** met drone-LiDAR-data. Je hoeft geen R te kennen: alle code staat klaar en je voert ze stap voor stap uit. Na de cursus weet je

- hoe een LiDAR-puntenwolk eruitziet en wat ze bevat;
- hoe je er een terreinmodel, een kronendakhoogtemodel en afzonderlijke bomen uit haalt;
- hoe je met veldplots een biomassakaart maakt.

## Locaties

Geel (vliegtuigje): de locaties die we tijdens de training met de drone gevlogen hebben. Oranje (driehoek): de twee transecten in Coronie (2024) met veldplots, gebruikt voor het biomassamodel. Zoom in om de omtrek van de puntenwolken te zien.

```geojson
{
 "type": "FeatureCollection",
 "features": [
  {
   "type": "Feature",
   "properties": {
    "naam": "SU6",
    "beschrijving": "Dronevlucht 10 november 2026 (Zenmuse L2)",
    "soort": "vlucht",
    "marker-color": "#f5c518",
    "marker-symbol": "airport",
    "marker-size": "medium"
   },
   "geometry": {
    "type": "Point",
    "coordinates": [
     -55.922936,
     5.786193
    ]
   }
  },
  {
   "type": "Feature",
   "properties": {
    "naam": "SU2",
    "beschrijving": "Dronevlucht november 2026 (Zenmuse L2)",
    "soort": "vlucht",
    "marker-color": "#f5c518",
    "marker-symbol": "airport",
    "marker-size": "medium"
   },
   "geometry": {
    "type": "Point",
    "coordinates": [
     -55.144131,
     5.942442
    ]
   }
  },
  {
   "type": "Feature",
   "properties": {
    "naam": "Transect T1 (Perseverance)",
    "beschrijving": "Coronie, september 2024, 20 veldplots",
    "soort": "transect",
    "marker-color": "#ff8c00",
    "marker-symbol": "triangle",
    "marker-size": "medium"
   },
   "geometry": {
    "type": "Point",
    "coordinates": [
     -56.281641,
     5.876884
    ]
   }
  },
  {
   "type": "Feature",
   "properties": {
    "naam": "Transect T2 (Jenny)",
    "beschrijving": "Coronie, september 2024, 13 veldplots",
    "soort": "transect",
    "marker-color": "#ff8c00",
    "marker-symbol": "triangle",
    "marker-size": "medium"
   },
   "geometry": {
    "type": "Point",
    "coordinates": [
     -56.052598,
     5.827823
    ]
   }
  },
  {
   "type": "Feature",
   "properties": {
    "naam": "SU6",
    "beschrijving": "Dronevlucht 10 november 2026 (Zenmuse L2)",
    "soort": "vlucht",
    "stroke": "#f5c518",
    "fill": "#f5c518",
    "fill-opacity": 0.2,
    "stroke-width": 2.0
   },
   "geometry": {
    "type": "Polygon",
    "coordinates": [
     [
      [
       -55.922659,
       5.792226
      ],
      [
       -55.923201,
       5.792136
      ],
      [
       -55.923202,
       5.791865
      ],
      [
       -55.923382,
       5.791865
      ],
      [
       -55.923294,
       5.79096
      ],
      [
       -55.923475,
       5.790689
      ],
      [
       -55.925194,
       5.788974
      ],
      [
       -55.925285,
       5.788613
      ],
      [
       -55.92628,
       5.78771
      ],
      [
       -55.927819,
       5.785723
      ],
      [
       -55.928633,
       5.785182
      ],
      [
       -55.928635,
       5.784006
      ],
      [
       -55.928094,
       5.783824
      ],
      [
       -55.927824,
       5.783281
      ],
      [
       -55.927553,
       5.78328
      ],
      [
       -55.927193,
       5.782737
      ],
      [
       -55.926922,
       5.782737
      ],
      [
       -55.926742,
       5.782374
      ],
      [
       -55.92611,
       5.782102
      ],
      [
       -55.926111,
       5.781831
      ],
      [
       -55.925659,
       5.78183
      ],
      [
       -55.924758,
       5.780652
      ],
      [
       -55.922861,
       5.780829
      ],
      [
       -55.918789,
       5.785344
      ],
      [
       -55.918607,
       5.785796
      ],
      [
       -55.917884,
       5.786337
      ],
      [
       -55.917612,
       5.78688
      ],
      [
       -55.917701,
       5.787332
      ],
      [
       -55.91743,
       5.787603
      ],
      [
       -55.917429,
       5.788055
      ],
      [
       -55.917699,
       5.788417
      ],
      [
       -55.918151,
       5.788599
      ],
      [
       -55.91824,
       5.788961
      ],
      [
       -55.918691,
       5.789143
      ],
      [
       -55.918691,
       5.789414
      ],
      [
       -55.919322,
       5.789777
      ],
      [
       -55.920133,
       5.790774
      ],
      [
       -55.920404,
       5.790774
      ],
      [
       -55.920584,
       5.791317
      ],
      [
       -55.921035,
       5.791318
      ],
      [
       -55.921395,
       5.791861
      ],
      [
       -55.922659,
       5.792226
      ]
     ]
    ]
   }
  },
  {
   "type": "Feature",
   "properties": {
    "naam": "SU2",
    "beschrijving": "Dronevlucht november 2026 (Zenmuse L2)",
    "soort": "vlucht",
    "stroke": "#f5c518",
    "fill": "#f5c518",
    "fill-opacity": 0.2,
    "stroke-width": 2.0
   },
   "geometry": {
    "type": "Polygon",
    "coordinates": [
     [
      [
       -55.144785,
       5.948805
      ],
      [
       -55.145419,
       5.948174
      ],
      [
       -55.146142,
       5.948176
      ],
      [
       -55.146776,
       5.947636
      ],
      [
       -55.146598,
       5.946821
      ],
      [
       -55.146797,
       5.941216
      ],
      [
       -55.14689,
       5.940493
      ],
      [
       -55.147252,
       5.940223
      ],
      [
       -55.147254,
       5.93959
      ],
      [
       -55.146624,
       5.938955
      ],
      [
       -55.146716,
       5.938504
      ],
      [
       -55.146086,
       5.937778
      ],
      [
       -55.145184,
       5.937594
      ],
      [
       -55.145185,
       5.937142
      ],
      [
       -55.144464,
       5.936778
      ],
      [
       -55.144376,
       5.936235
      ],
      [
       -55.143926,
       5.935782
      ],
      [
       -55.143023,
       5.935598
      ],
      [
       -55.142481,
       5.935777
      ],
      [
       -55.141755,
       5.936769
      ],
      [
       -55.141629,
       5.947528
      ],
      [
       -55.142258,
       5.948434
      ],
      [
       -55.142891,
       5.948256
      ],
      [
       -55.143161,
       5.948437
      ],
      [
       -55.144064,
       5.94835
      ],
      [
       -55.144514,
       5.948804
      ],
      [
       -55.144785,
       5.948805
      ]
     ]
    ]
   }
  },
  {
   "type": "Feature",
   "properties": {
    "naam": "Transect T1 (Perseverance)",
    "beschrijving": "Coronie, september 2024, 20 veldplots",
    "soort": "transect",
    "stroke": "#ff8c00",
    "fill": "#ff8c00",
    "fill-opacity": 0.2,
    "stroke-width": 2.0
   },
   "geometry": {
    "type": "Polygon",
    "coordinates": [
     [
      [
       -56.280093,
       5.886958
      ],
      [
       -56.280094,
       5.886686
      ],
      [
       -56.280546,
       5.886235
      ],
      [
       -56.280547,
       5.885511
      ],
      [
       -56.280818,
       5.885421
      ],
      [
       -56.280999,
       5.884878
      ],
      [
       -56.281091,
       5.883793
      ],
      [
       -56.281362,
       5.883612
      ],
      [
       -56.281635,
       5.882075
      ],
      [
       -56.282179,
       5.8809
      ],
      [
       -56.28218,
       5.880176
      ],
      [
       -56.282451,
       5.879996
      ],
      [
       -56.282724,
       5.878458
      ],
      [
       -56.283177,
       5.877464
      ],
      [
       -56.283178,
       5.87665
      ],
      [
       -56.283449,
       5.876469
      ],
      [
       -56.283722,
       5.874841
      ],
      [
       -56.283993,
       5.874661
      ],
      [
       -56.284266,
       5.873033
      ],
      [
       -56.284447,
       5.873033
      ],
      [
       -56.284719,
       5.872129
      ],
      [
       -56.28472,
       5.871315
      ],
      [
       -56.284991,
       5.871134
      ],
      [
       -56.285263,
       5.87032
      ],
      [
       -56.285175,
       5.868782
      ],
      [
       -56.285536,
       5.868873
      ],
      [
       -56.285537,
       5.868512
      ],
      [
       -56.285266,
       5.868511
      ],
      [
       -56.285268,
       5.867154
      ],
      [
       -56.284726,
       5.867154
      ],
      [
       -56.284816,
       5.866792
      ],
      [
       -56.284365,
       5.866791
      ],
      [
       -56.284274,
       5.866972
      ],
      [
       -56.284094,
       5.86652
      ],
      [
       -56.283733,
       5.866429
      ],
      [
       -56.28301,
       5.86679
      ],
      [
       -56.282647,
       5.867603
      ],
      [
       -56.282556,
       5.868598
      ],
      [
       -56.282103,
       5.869593
      ],
      [
       -56.282102,
       5.870497
      ],
      [
       -56.281831,
       5.870587
      ],
      [
       -56.281557,
       5.872306
      ],
      [
       -56.281286,
       5.872486
      ],
      [
       -56.281014,
       5.873481
      ],
      [
       -56.281013,
       5.874204
      ],
      [
       -56.280742,
       5.874385
      ],
      [
       -56.280469,
       5.876013
      ],
      [
       -56.280107,
       5.876555
      ],
      [
       -56.279924,
       5.877912
      ],
      [
       -56.279471,
       5.878816
      ],
      [
       -56.27947,
       5.879992
      ],
      [
       -56.279108,
       5.880082
      ],
      [
       -56.278926,
       5.881529
      ],
      [
       -56.278564,
       5.8818
      ],
      [
       -56.278474,
       5.881528
      ],
      [
       -56.278023,
       5.881528
      ],
      [
       -56.278111,
       5.883156
      ],
      [
       -56.277835,
       5.886593
      ],
      [
       -56.278829,
       5.886956
      ],
      [
       -56.280093,
       5.886958
      ]
     ]
    ]
   }
  },
  {
   "type": "Feature",
   "properties": {
    "naam": "Transect T2 (Jenny)",
    "beschrijving": "Coronie, september 2024, 13 veldplots",
    "soort": "transect",
    "stroke": "#ff8c00",
    "fill": "#ff8c00",
    "fill-opacity": 0.2,
    "stroke-width": 2.0
   },
   "geometry": {
    "type": "Polygon",
    "coordinates": [
     [
      [
       -56.050919,
       5.835691
      ],
      [
       -56.051281,
       5.835239
      ],
      [
       -56.055815,
       5.824573
      ],
      [
       -56.056178,
       5.823308
      ],
      [
       -56.056359,
       5.823308
      ],
      [
       -56.056812,
       5.822223
      ],
      [
       -56.056724,
       5.821047
      ],
      [
       -56.054558,
       5.819868
      ],
      [
       -56.053745,
       5.820138
      ],
      [
       -56.053744,
       5.820861
      ],
      [
       -56.053473,
       5.820951
      ],
      [
       -56.052022,
       5.824386
      ],
      [
       -56.05202,
       5.825833
      ],
      [
       -56.051476,
       5.826918
      ],
      [
       -56.051475,
       5.827641
      ],
      [
       -56.051204,
       5.827641
      ],
      [
       -56.051022,
       5.828183
      ],
      [
       -56.05057,
       5.828454
      ],
      [
       -56.049301,
       5.831346
      ],
      [
       -56.049209,
       5.83216
      ],
      [
       -56.048938,
       5.83225
      ],
      [
       -56.048122,
       5.833967
      ],
      [
       -56.048121,
       5.834601
      ],
      [
       -56.048662,
       5.835054
      ],
      [
       -56.050197,
       5.835509
      ],
      [
       -56.050287,
       5.83569
      ],
      [
       -56.050919,
       5.835691
      ]
     ]
    ]
   }
  }
 ]
}
```

## Programma

| Deel | Inhoud |
|---|---|
| [1 · Bekijken](https://jasperfe.github.io/lidR-mangrove-cursus/01_bekijken.html) | De puntenwolk inlezen, op een kaart situeren en in 3D bekijken |
| [2 · Analyseren](https://jasperfe.github.io/lidR-mangrove-cursus/02_lidr.html) | Terreinmodel, kronendak, kenmerken per cel en afzonderlijke bomen |
| [3 · Biomassa](https://jasperfe.github.io/lidR-mangrove-cursus/03_biomassa.html) | Van veldplots en puntenwolk naar een biomassakaart |

## Installatie

Doe dit **vóór de cursus**, met een goede internetverbinding. Het duurt ongeveer 20 minuten.

1. **R** installeren: <https://cran.r-project.org> (nieuwste versie).
2. **RStudio Desktop** installeren: <https://posit.co/download/rstudio-desktop/>. Quarto zit er al in.
3. **Op een Mac** ook **XQuartz** installeren (<https://www.xquartz.org>) en de computer herstarten. Zonder XQuartz opent het 3D-venster niet.
4. **Deze cursus downloaden:** groene knop *Code → Download ZIP* bovenaan deze pagina. Pak het zip-bestand uit in een map zonder spaties in de naam, bv. `C:\lidR_cursus`.
5. **De data downloaden:** `data.zip` bij de laatste [release](https://github.com/JasperFe/lidR-mangrove-cursus/releases). Pak het uit in de cursusmap, zodat er een map `data` naast de `.qmd`-bestanden staat.
6. **De R-pakketten installeren:** open `00_installatie.R` in RStudio en klik rechtsboven op *Source*. Wacht tot je **INSTALLATIE OK** ziet. Krijg je de vraag *"install from sources?"*, antwoord dan `no`.

Lukt iets niet? Stuur een screenshot van de foutmelding naar de lesgever.

**Laptop:** minstens 8 GB RAM en 2 GB vrije schijfruimte.

## Zo werk je

1. Dubbelklik op `LiDAR_cursus.Rproj`. RStudio opent in de cursusmap.
2. Open `index.qmd` en daarna de delen 1 tot 3.
3. Voer de grijze codeblokken één voor één uit met het groene ▶-knopje.

```
lidR-mangrove-cursus/
├── LiDAR_cursus.Rproj
├── 00_installatie.R
├── index.qmd, 01_bekijken.qmd, 02_lidr.qmd, 03_biomassa.qmd
└── data/            ← uit data.zip
```

## Referentiemateriaal

**lidR**

- [The lidR book](https://r-lidar.github.io/lidRbook/): de volledige handleiding van lidR, met voorbeelden.
- [lidR op GitHub](https://github.com/r-lidar/lidR): broncode, documentatie en vragen.
- Roussel, J.-R. et al. (2020). lidR: An R package for analysis of Airborne Laser Scanning (ALS) data. *Remote Sensing of Environment* 251, 112061. <https://doi.org/10.1016/j.rse.2020.112061>
- [lidR-workshop (Goodbody & Roussel)](https://tgoodbody.github.io/lidRtutorial/) en [SilviLaser 2025-workshop (Irwin et al.)](https://liamirwin.github.io/SL25_lidRtutorial/): uitgebreidere cursussen waarop deze cursus geïnspireerd is.

**Zenmuse L2 en DJI Terra**

- [Zenmuse L2 – officiële tutorials (DJI)](https://enterprise.dji.com/zenmuse-l2/video): korte video's over vliegen en verwerken.
- [Zenmuse L2 – gebruikershandleiding (pdf)](https://dl.djicdn.com/downloads/Zenmuse_L2/20240718/Zenmuse_L2_User_Manual_v1.2_ENI.pdf)
- [How to use DJI Terra for LiDAR processing (video)](https://www.youtube.com/watch?v=Bg-FKqE5C0U): van ruwe vluchtdata naar een LAS-puntenwolk.
- [Zenmuse L2 PPK workflow (video)](https://www.youtube.com/watch?v=HPqGG6TH0aE): nauwkeurigheid verbeteren met een basisstation.

**Puntenwolken bekijken zonder R**

- [CloudCompare](https://www.cloudcompare.org): gratis programma om puntenwolken te bekijken, te meten en te bewerken.

## Data en licentie

- Locaties SU6 en SU2: Zenmuse L2, november 2026, verwerkt in DJI Terra en uitgedund voor gebruik op een laptop.
- Transecten Coronie (2024): Feyen et al., UAV-LiDAR-, veld- en kustlijndata voor twee *Avicennia germinans*-chronosequenties, Coronie, Suriname. CC BY 4.0.

Cursus: Q-ForestLab, Universiteit Gent.
