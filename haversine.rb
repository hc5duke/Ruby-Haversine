#!/usr/bin/ruby

#
# Author: almartin <alex.m.martineau@gmail.com>
# Version: 1.0
# Date: 03/14/2011
# Language: Ruby
# Descrption: Example script implementing Haversine formula to identify distance in KM between 2 coordinates
# Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
#
# Ruby-fied by @hc5duke 2012-06-03


def coor_dist(lat1, lon1, lat2, lon2)
  def to_radian(value)
    value * Math::PI / 180.0
  end
  earth_radius = 6371 # Earth's radius in KM

  lat1_radian = to_radian(lat1)
  lat2_radian = to_radian(lat2)
  delta_lat_radian = to_radian(lat2 - lat1)
  delta_lon_radian = to_radian(lon2 - lon1)

  # Calculate square of half the chord length between latitude and longitude
  a = Math.sin(delta_lat_radian / 2) * Math.sin(delta_lat_radian / 2) +
      Math.cos(lat1_radian) * Math.cos(lat2_radian) *
      Math.sin(delta_lon_radian / 2) * Math.sin(delta_lon_radian / 2)

  # Calculate the angular distance in radians
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

  earth_radius * c
end



# hardcoded example coordinates #
lat1 = 41.5592880250001
lat2 = 41.8574079970001
lon1 = -73.0371704099999
lon2 = -72.00779572399991
#################################

puts coor_dist(lat1, lon1, lat2, lon2)