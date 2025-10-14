# Quantifying Carbon Benefits across the Yellowstone to Yukon Region

## Introduction

This repository contains all code used in the carbon benefits analysis from Nov 2024 - Octobber 2025. I completed some data retrieval and pre-processing on a local machine, but uploaded all relevant data inputs to Google Earth Engine before running the analysis. I ran the analysis in Google Earth Engine (GEE) via the python API and jupyter notebooks. 

I split the analysis into three parts:

1. Quantifying carbon stocks and forest carbon sequestration
2. Quantifying manageable, vulnerable, and irrecoverable carbon
3. Quantifying carbon storage and sequestration in mountains globally

This file serves to describe the structure of this github repository.

## 0. Preprocessing

### [mask_carbon_stocks.ipynb](/mask_carbon_stocks.ipynb)

Many of the data inputs used in this analysis were either available directly on GEE or were downloaded directly from the data provider and uploaded to GEE without any further manipulation. I downloaded the soil organic carbon stock layers from open land map and used this code to sum together the layers corresponding to different soil depth intervals. I output layers representing soil carbon from 0-30cm and 0-100cm depth. I initially used the code to clip all of the raster inputs to the Y2Y extent but in the end I uploaded the raw layers to GEE and let GEE handle clipping, reprojecting, masking, etc.

### [clean_protected_areas_data.R](/clean_protected_area_data.R)

I acquired protected area data from protectedplanet.net. I downloaded the vector file package that included both WDPA and WDOECM data. These data contain many overlapping polygons and therefore need to be pre-processed into a usable polygon layer. This code utilizes the R package 'wdpar' to transform the raw protected areas data into a vector layer that is suitable for analysis.

## 1. Quantifying carbon stocks and forest carbon sequestration

### [calculate_carbon_stock_gee.ipynb](/calculate_carbon_stock_gee.ipynb)

This code calculates plant biomass and soil carbon stocks across Y2Y. It first builds plant carbon and soil carbon layers, and then executes zonal statistics across various delineations of Y2Y. I also compared Y2Y carbon stocks to carbon stocks across Canada.

### [calculate_carbon_sequestration_gee.ipynb](/calculate_carbon_sequestration_gee.ipynb)

This code was adapted from the Global Forest Watch Forest Carbon Emissions, Removals, and Net Flux Zonal Statistics [GEE code](https://code.earthengine.google.com/dd33041a9a8d729da18484a7c378f846). It outputs annual average forest carbon emissions, removals, and net flux for years 2001-2024. It also outputs annual forest carbon emissions, but users need to exercise caution in comparing annual values, as described in the Global Forest Watch documentation.

This code outputs zonal statistics for Y2Y, Canada/USA, and global regions and thus to calculate statistics for a new region one needs to upload polygons to GEE as a feature collection and run the function on that feature collection.

### [carbon_sequestration_plots.ipynb](/carbon_sequestration_plots.ipynb)

This code takes carbon emission and sequestration data across Y2Y and outputs a bar plot. Due to differences in data quality and processing methods throughout time, I only included years 2015-2024 for the annual comparison (this figure was not included in manuscript under consideration).

## 2. Quantifying manageable, vulnerable, and irrecoverable carbon

### [calculate_irrecoverable_carbon.ipynb](/calculate_irrecoverable_carbon.ipynb)

This code calculates manageable, vulnerable, and irrecoverable carbon across Y2Y. It outputs final raster layers as well as zonal statistics across Y2Y. 

## 3. Quantifying carbon storage and sequestration in mountains globally

### [calculate global_carbon_stats_k1.ipynb](/calculate_global_carbon_stats_k1.ipynb)
[calculate global_carbon_stats_k2.ipynb](/calculate_global_carbon_stats_k2.ipynb)
[calculate global_carbon_stats_k3.ipynb](/calculate_global_carbon_stats_k3.ipynb)
[calculate global_carbon_stats_k1_continents.ipynb](/calculate_global_carbon_stats_k1_continents.ipynb)

The above codes were used to output zonal statistics for the global carbon analysis, including carbon stocks and irrecoverable carbon.

### [calculate us_can_carbon_stats_k1.ipynb](/calculate_us_can_carbon_stats_k1.ipynb)
[calculate us_can_carbon_stats_k2.ipynb](/calculate_us_can_carbon_stats_k2.ipynb)
[calculate us_can_carbon_stats_k3.ipynb](/calculate_us_can_carbon_stats_k3.ipynb)

The above codes were used to output zonal statistics for the Canada/USA carbon analysis, including carbon stocks and irrecoverable carbon.

## Data Access

All of the spatial layers and results of this analysis can be generated directly using the code above, since all input data is hosted on GEE. To facilitate ease of access, we also exported all spatial layers built during the analysis as GEE assets, and can therefore be referenced and used without having to re-generate the layers. The layers publically available as GEE assets are listed below.

[biomass_c_t_ha]

[irrecoverable_bio_hotspots_1000m](projects/y2y-climate-benefits/assets/outputs/biomass_c_t_ha)
[irrecoverable_bio_t_ha_top20_1000m]()
[irrecoverable_biomass_t_ha]()
[irrecoverable_soc_m_hotspots_1000m]()
[irrecoverable_soc_m_t_ha]()
[irrecoverable_soc_m_t_ha_top20_1000m]()
[irrecoverable_soc_sl_hotspots_1000m]()
[irrecoverable_soc_sl_t_ha]()
[irrecoverable_soc_sl_t_ha_top20_1000m]()
[manageable_biomass_t_ha]()
[manageable_soc_t_ha]()
[soc_0_1m_t_ha]()
[vulnerable_biomass_t_ha]()
[vulnerable_soc_m_t_ha]()
[vulnerable_soc_sl_t_ha]()