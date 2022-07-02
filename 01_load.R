# Copyright 2022 Province of British Columbia
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.

library(tidyverse)

rd <- sf::st_read(here::here("data","rd-polygon.shp"))[-c(33,35),]%>%
  mutate(id=row_number(),
         regional_district=c(
           "capital",
           "cowichan",
           "alberni_clayoquot",
           "nanaimo",
           "metro_vancouver",
           "fraser_valley",
           "okanagan_similkameen",
           "kootenay_boundary",
           "central_kootenay",
           "sunshine_coast",
           "comox_valley",
           "east_kootenay",
           "strathcona",
           "squamish_lillooet",
           "qathet",
           "thompson_nicola",
           "central_okanagan",
           "mount_waddington",
           "strathcona",
           "north_okanagan",
           "mount_waddington",
           "columbia_shuswap",
           "cariboo",
           "central_coast",
           "north_coast",
           "kitamat_stikine",
           "fraser_fort_george",
           "bulkley_nechako",
           "north_coast",
           "north_coast",
           "peace_river",
           "stikine",
           "northern_rockies"
         ))

write_rds(rd, here::here("out","bc_regional_districts_sf.rds"))

# example usage---------
plt <- ggplot(rd)+
  geom_sf(aes(fill=regional_district),lwd=0)+
  theme_void()+
  theme(legend.position = "none")

plotly::ggplotly(plt)%>%
  plotly::style(hoveron = "fill")


