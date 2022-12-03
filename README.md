Las Condes
================

## Datos Geoespaciales

Este conjunto de datos fue preparado para enseñar tecnicas de
modelamiento territorial y analisis geoespacial. El lugar seleccionado
para este ejemplo es el municipio de Las Condes, en Santiago de Chile.
Las Condes es una comuna urbana y mas bien acomodada. En este conjunto
de datos se encuentra informacion geopolitica, fisica y sociodemografica
de este territorio.

## Limites politicos de Las Condes

Se decicio incluir en este conjunto de datos un Shapefile (\*.shp) ya
que es el formato de datos mas utilizados en el mundo de analisis de
datos geograficos vectoriales. El poligono corresponde al perimetro de
la comuna

``` r
perimetro <- sf::read_sf("data/shp/perimetro_lc.shp")

sf::st_crs(perimetro)
```

    ## Coordinate Reference System:
    ##   User input: WGS 84 / UTM zone 19S 
    ##   wkt:
    ## PROJCRS["WGS 84 / UTM zone 19S",
    ##     BASEGEOGCRS["WGS 84",
    ##         DATUM["World Geodetic System 1984",
    ##             ELLIPSOID["WGS 84",6378137,298.257223563,
    ##                 LENGTHUNIT["metre",1]]],
    ##         PRIMEM["Greenwich",0,
    ##             ANGLEUNIT["degree",0.0174532925199433]],
    ##         ID["EPSG",4326]],
    ##     CONVERSION["UTM zone 19S",
    ##         METHOD["Transverse Mercator",
    ##             ID["EPSG",9807]],
    ##         PARAMETER["Latitude of natural origin",0,
    ##             ANGLEUNIT["Degree",0.0174532925199433],
    ##             ID["EPSG",8801]],
    ##         PARAMETER["Longitude of natural origin",-69,
    ##             ANGLEUNIT["Degree",0.0174532925199433],
    ##             ID["EPSG",8802]],
    ##         PARAMETER["Scale factor at natural origin",0.9996,
    ##             SCALEUNIT["unity",1],
    ##             ID["EPSG",8805]],
    ##         PARAMETER["False easting",500000,
    ##             LENGTHUNIT["metre",1],
    ##             ID["EPSG",8806]],
    ##         PARAMETER["False northing",10000000,
    ##             LENGTHUNIT["metre",1],
    ##             ID["EPSG",8807]]],
    ##     CS[Cartesian,2],
    ##         AXIS["(E)",east,
    ##             ORDER[1],
    ##             LENGTHUNIT["metre",1]],
    ##         AXIS["(N)",north,
    ##             ORDER[2],
    ##             LENGTHUNIT["metre",1]],
    ##     ID["EPSG",32719]]

``` r
mapview::mapview(perimetro)
```

![](README_files/figure-gfm/perimetro-1.png)<!-- -->

## Datos sociodemograficos

Se incluye la informacion a nivel de manzana del indice de bienestar
territorial, y sus 19 subindices

``` r
bienestar <- sf::read_sf("data/MBHT_lc.gpkg")

mapview::mapview(bienestar, zcol = "ibt")
```

![](README_files/figure-gfm/matriz%20de%20bienestar%20territorial-1.png)<!-- -->

``` r
sf::st_crs(bienestar)
```

    ## Coordinate Reference System:
    ##   User input: WGS 84 / UTM zone 19S 
    ##   wkt:
    ## PROJCRS["WGS 84 / UTM zone 19S",
    ##     BASEGEOGCRS["WGS 84",
    ##         DATUM["World Geodetic System 1984",
    ##             ELLIPSOID["WGS 84",6378137,298.257223563,
    ##                 LENGTHUNIT["metre",1]]],
    ##         PRIMEM["Greenwich",0,
    ##             ANGLEUNIT["degree",0.0174532925199433]],
    ##         ID["EPSG",4326]],
    ##     CONVERSION["UTM zone 19S",
    ##         METHOD["Transverse Mercator",
    ##             ID["EPSG",9807]],
    ##         PARAMETER["Latitude of natural origin",0,
    ##             ANGLEUNIT["degree",0.0174532925199433],
    ##             ID["EPSG",8801]],
    ##         PARAMETER["Longitude of natural origin",-69,
    ##             ANGLEUNIT["degree",0.0174532925199433],
    ##             ID["EPSG",8802]],
    ##         PARAMETER["Scale factor at natural origin",0.9996,
    ##             SCALEUNIT["unity",1],
    ##             ID["EPSG",8805]],
    ##         PARAMETER["False easting",500000,
    ##             LENGTHUNIT["metre",1],
    ##             ID["EPSG",8806]],
    ##         PARAMETER["False northing",10000000,
    ##             LENGTHUNIT["metre",1],
    ##             ID["EPSG",8807]]],
    ##     CS[Cartesian,2],
    ##         AXIS["(E)",east,
    ##             ORDER[1],
    ##             LENGTHUNIT["metre",1]],
    ##         AXIS["(N)",north,
    ##             ORDER[2],
    ##             LENGTHUNIT["metre",1]],
    ##     USAGE[
    ##         SCOPE["Engineering survey, topographic mapping."],
    ##         AREA["Between 72°W and 66°W, southern hemisphere between 80°S and equator, onshore and offshore. Argentina. Bolivia. Brazil. Chile. Colombia. Peru."],
    ##         BBOX[-80,-72,0,-66]],
    ##     ID["EPSG",32719]]

``` r
dplyr::glimpse(bienestar)
```

    ## Rows: 1,661
    ## Columns: 39
    ## $ cod_com  <dbl> 13114, 13114, 13114, 13114, 13114, 13114, 13114, 13114, 13114…
    ## $ COMUNA   <dbl> 13114, 13114, 13114, 13114, 13114, 13114, 13114, 13114, 13114…
    ## $ ID_MANZ  <chr> "13114011001007", "13114011001008", "13114011001009", "131140…
    ## $ MANZ_EN  <chr> "URBANO", "URBANO", "URBANO", "URBANO", "URBANO", "URBANO", "…
    ## $ ZONA     <chr> "13114011001", "13114011001", "13114011001", "13114011001", "…
    ## $ ibt      <dbl> 0.8311479, 0.8269488, 0.8767303, 0.8484467, 0.8570477, 0.8069…
    ## $ dim_acc  <dbl> 0.7727412, 0.7727412, 0.8009140, 0.8123056, 0.7977825, 0.7845…
    ## $ iav      <dbl> 17.27376, 17.27376, 17.56880, NA, NA, 19.77070, 19.30008, 17.…
    ## $ icul     <dbl> 0.1749664, 0.1749664, 0.1764778, NA, NA, 0.1933692, 0.2014057…
    ## $ idep     <dbl> 0.9424756, 0.9424756, 1.0916978, NA, NA, 0.9924554, 1.0699403…
    ## $ isal     <dbl> 0.3411686, 0.3411686, 0.4463309, NA, NA, 0.2919666, 0.3618612…
    ## $ iser     <dbl> 0.9310620, 0.9310620, 0.8604403, NA, NA, 1.1044872, 1.0832429…
    ## $ ise      <dbl> 0.8017958, 0.8017958, 1.0513904, NA, NA, 0.8021678, 0.9465443…
    ## $ dim_amb  <dbl> 0.5023593, 0.4348775, 0.5655774, 0.5920662, 0.5549553, 0.4898…
    ## $ iata     <dbl> 14.46405, 15.01745, 13.52175, 12.69344, 13.91509, 14.61625, 1…
    ## $ icv      <dbl> 17.2458479, 0.0357903, 41.9161938, 67.8377679, 41.1796335, 14…
    ## $ dim_soc  <dbl> 0.8761811, 0.9347502, 0.8519725, 0.7666115, 0.8219196, 0.8157…
    ## $ ivi      <dbl> 1.0000000, 1.0000000, 1.0000000, 1.0000000, NA, 1.0000000, 1.…
    ## $ isv      <dbl> 0.9709865, 0.9760766, 0.9924869, 1.0000000, NA, 0.9845917, 0.…
    ## $ iej      <dbl> 16.8, 16.3, 16.5, NA, NA, 15.6, 16.4, 16.4, 16.1, 16.7, 16.5,…
    ## $ irh      <dbl> 0.9411765, 1.0000000, 0.9138381, NA, NA, 0.8789625, 0.9445129…
    ## $ iem      <dbl> 0.9404762, 1.0000000, 0.9521912, NA, NA, 0.9534884, 0.9589354…
    ## $ ipj      <dbl> 1.0000000, 1.0000000, 0.9478261, 0.9528394, 0.9385262, 0.9523…
    ## $ dim_seg  <dbl> 0.9154028, 0.9154028, 0.9449679, 0.9324174, 0.9469987, 0.9253…
    ## $ igpe     <dbl> 0.9746, 0.9746, 0.9935, 0.9830, 0.9768, 0.9835, 0.9746, 0.974…
    ## $ igpr     <dbl> 0.8738, 0.8738, 0.8905, 0.8837, 0.9111, 0.8583, 0.8738, 0.873…
    ## $ ilpe     <dbl> 0.9609, 0.9609, 0.9761, 0.9597, 0.9703, 0.9738, 0.9609, 0.960…
    ## $ ilpr     <dbl> 0.8799, 0.8799, 0.9551, 0.9375, 0.9642, 0.9343, 0.8799, 0.879…
    ## $ AREA     <dbl> 4079.039, 3537.163, 59401.921, 77870.526, 2416.807, 157648.18…
    ## $ TOTAL_V  <dbl> 94.0000, 76.0000, 484.0000, 1.0000, 0.0000, 413.0000, 604.984…
    ## $ HOG_N    <dbl> 68.0000, 66.0000, 383.0000, 0.0000, 0.0000, 347.0000, 455.564…
    ## $ PERSONAS <dbl> 145.0000, 156.0000, 990.0000, 0.0000, 0.0000, 949.0000, 988.0…
    ## $ E0A5     <dbl> 18.00000, 19.00000, 86.00000, 0.00000, 0.00000, 56.00000, 43.…
    ## $ E6A14    <dbl> 8.00000, 6.00000, 90.00000, 0.00000, 0.00000, 62.00000, 33.70…
    ## $ E4A18    <dbl> 14.0000, 10.0000, 153.0000, 0.0000, 0.0000, 105.0000, 57.2966…
    ## $ E0A18    <dbl> 31.00000, 30.00000, 211.00000, 0.00000, 0.00000, 142.00000, 9…
    ## $ E15A24   <dbl> 9.00000, 7.00000, 115.00000, 0.00000, 0.00000, 126.00000, 74.…
    ## $ E65YMAS  <dbl> 26.00000, 26.00000, 197.00000, 0.00000, 0.00000, 189.00000, 9…
    ## $ geom     <POLYGON [m]> POLYGON ((353708.5 6303126,..., POLYGON ((353749.3 63…

## Datos fisicos

Se incluyen imagenes satelitales multiespectrales de 30 metros de
resolucion, para los años 2013 al 2021.

``` r
imagen_landsat8 <- 
  stars::read_stars("data/imagenes/l8_2016.tif")
  
mapview::viewRGB(as(imagen_landsat8, "Raster") , r = 5, g = 4, b = 3, quantiles = c(0.05, .95))
```

![](README_files/figure-gfm/satelitales-1.png)<!-- -->

# Modelo de elevacion digital

Se incluye el modelo de elevacion digital del SRTM, con diferentes
resoluciones

``` r
dem <-   stars::read_stars("data/DEM/z12.tif")

mapview::mapview(dem)
```

![](README_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

# Delitos

Por ultimo, se incluye un registro de los delitos comentidos en Las
Condes durante 2018, donde ademas de la ubicacion del suceso de indica
si fue robo o un hecho de violencia

``` r
delitos <- readr::read_rds("data/delitos_lc.rds")

mapview::mapview(delitos)
```

![](README_files/figure-gfm/delitos-1.png)<!-- -->

Si apilamos las capas se puede ver que las imagenes tienen un area
superior a la extension de la comuna, y tambien se puede ver que mas de
la mitad del area de la comuna se encuentra en territorio de montaña,
por lo que no tiene poligonos de manzanas en su area

``` r
mapview::viewRGB(as(imagen_landsat8, "Raster") , r = 5, g = 4, b = 3, quantiles = c(0.05, .95)) +
  mapview::mapview(perimetro, color = "white", zcol = NULL ) +
  mapview::mapview(bienestar, zcol = "ibt")
```

![](README_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->
