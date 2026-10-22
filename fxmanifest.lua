-- Resource Metadata
fx_version 'cerulean'
game 'gta5'

-- Resource Information
author 'EnderDevelopment'
description 'Modern Police Station MLO with SWAT and IAA sections'
version '1.0.0'

-- What to run
client_script 'client/main.lua'
server_script 'server/main.lua'

-- Files included in this resource
files {
    'stream/police_station.ytyp',
    'stream/swat_section.ytyp',
    'stream/iaa_section.ytyp'
}

-- This ensures the parent is loaded first
data_file 'DLC_ITYP_REQUEST' 'stream/police_station.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/swat_section.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/iaa_section.ytyp'
