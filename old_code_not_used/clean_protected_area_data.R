#################################
### INSTALL AND LOAD PACKAGES ###
#################################

# install wdpar package
# install.packages('wdpar')

# load libraries
library(sf)
library(wdpar)

###########################
## WDPA_WDOECM JAN 2025 ###
###########################

# read WDPA_WDOECM shapefile
wdpa_wdoecm <- st_read('/Users/ethanberman/Team Braintree Dropbox/Ethan Berman/Python Projects/y2y-carbon/land_cover/protected_areas_WDPA_WDOECM.shp')

# clean WDPA data
wdpa_wdoecm_clean <- wdpa_clean(wdpa_wdoecm, geometry_precision = 10000)

# export to disk
st_write(wdpa_wdoecm_clean, '/Users/ethanberman/Team Braintree Dropbox/Ethan Berman/Python Projects/y2y-carbon/land_cover/protected_areas_WDPA_WDOECM_clean.shp')