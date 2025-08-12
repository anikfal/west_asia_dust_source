;Author: Amirhossein Nikfal https://github.com/anikfal

f = addfile("DS.nc", "r")

var = f->dustsource(0,0,:,:)
wks = gsn_open_wks("x11","westasia_dust")
lon = f->west_east
lat = f->south_north
lat@units = "degrees_north"
lon@units = "degrees_east"
var!0 = "lat"
var!1 = "lon"
var&lat = lat
var&lon = lon

latdim = dimsizes(lat)
londim = dimsizes(lon)

res = True
res@gsnAddCyclic = False
res@cnFillOn       = True          ; turn on color fill
res@cnLinesOn      = False         ; no contour lines
res@cnFillPalette  = "WhiteYellowOrangeRed" ; choose a nice palette
res@tiMainString   = "Dust Source Activities based on MSG images"
res@mpOutlineDrawOrder    = "PostDraw"
res@mpFillDrawOrder = "PostDraw"
res@mpLandFillColor      = "transparent"

; res@mpProjection        = "LambertConformal"
; res@mpLambertParallel1F = 25
; res@mpLambertParallel2F = 35
; res@mpLambertMeridianF  = 55

res@mpFillOn = True

res@mpLimitMode       = "LatLon" ;"Corners"
res@mpLeftCornerLatF  = 41 ;lat(0) ;min(lat)
res@mpLeftCornerLonF  = lon(0) ;min(lon)
res@mpRightCornerLatF = lat(latdim-1) ;max(lat)
res@mpRightCornerLonF = lon(londim-1)  ;max(lon)
res@mpMinLatF = min(lat)
res@mpMaxLatF = max(lat)
res@mpMinLonF = min(lon)
res@mpMaxLonF = max(lon)


res@mpOutlineOn = True
res@cnFillMode      = "AreaFill"
res@mpOutlineBoundarySets = "AllBoundaries"
res@mpGeophysicalLineColor = "black"
res@mpGeophysicalLineThicknessF = 1.5
res@mpNationalLineColor = "black"
res@mpNationalLineThicknessF = 1.5
res@mpOceanFillColor = "deepskyblue"
res@cnLevelSelectionMode = "ManualLevels"
; res@cnLevelCount = 20
; res@cnfill
res@cnMinLevelValF = 0.02
res@cnMaxLevelValF = 0.28
res@cnLevelSpacingF = 0.02

res@tfDoNDCOverlay        = True

plot = gsn_csm_contour_map(wks, var, res)