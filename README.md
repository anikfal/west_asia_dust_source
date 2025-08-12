# West Asia Dust Source activities for the WRF/Chem model

## Dust source activities based on MSG SEVIRI data, and the warm months of the years 2017 and 2018

Replace your WPS geog file (e.g. `geo_em.d01.nc`), in the `westasia_dustsource_implementation.ncl` file, and run the code to apply the updated dust sources (soil erodibility or `EROD` variable) from `DS.nc` into your own WRF model domain.

<img width="858" height="745" alt="plot" src="https://github.com/user-attachments/assets/dcb13e99-81f2-49e1-b872-99e53cbd8abd" />


### Warning:
Running `westasia_dustsource_implementation.ncl` will overwrite the WPS geog file. Get a copy of your file before running the code.

### Paper:
https://www.ijgeophysics.ir/article_138601.html?lang=en
