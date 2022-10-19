pacman::p_load(tidyverse, stars, sf, patchwork)


dat1 <- read_rds("data/MBHT_LC.rds")
dat2 <- read_rds("data/manzanas_lc.rds") %>% st_as_sf()

(ggplot() + 
  geom_sf(data=dat1)) + (ggplot() +  geom_sf(data=dat2))

dat2b <- dat2 %>% st_buffer(dist=30)


ggplot() + 
  geom_sf(data=dat2b)

dat2v <- dat2 %>% 
  st_simplify(dTolerance = 10) %>% 
  st_snap(dat2, tolerance = 30)

ggplot() + 
  geom_sf(data=dat2v)


dat3 <- read_rds("data/censo_lc.rds")
dat5 <- read_sf("data/shapefile/LasCondes.shp")

img <- read_stars("data/landsat8_30m/l8_2013.tif")

plotRGB(img, r=2, g=3,b=4, stretch="hist")
plot(dat1) # puntos, mantener
plot(dat2)
plot(dat3)
plot(dat4)
plot(dat5)

img_crop <- img %>% st_crop(dat5)
plot(img_crop)

