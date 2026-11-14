# playlot-maps

Custom sandbox maps for [Playlot](https://github.com/zees-games/game-playlot), as JSON documents: boxes, a spawn, and the places a player is not meant to reach. Playlot loads them as custom maps.

## Using it

The game picks the maps up through a link (`maps/custom` in the game, made by dot-bootstrap) or, when delivered as a pack, through the game's `dependencies`. To change one of our own maps, edit `tools/build_maps.py` and run it. The format is defined and validated by the game's `maps/pg_data.gd`. See `docs/maps.md` and `docs/building.md` here for details.

## Our maps

Original maps by TMC, MIT licensed.

| Map | Name | What is in it |
| --- | --- | --- |
| `pgc_bowl` | Fling Bowl | A 30-degree bowl with two ice chutes and a rim walkway, boulders and sleds to send down it, and a diving board |
| `pgc_canyon` | Canyon | Two mesas either side of a canyon with a river, a road bridge, a balance beam and a broken bridge to jump in a buggy |
| `pgc_harbour` | Harbour | Piers over a basin with slipways, boats to jump onto, quay cranes, a freighter and a lighthouse with a spiral to throw things off |
| `pgc_islands` | Sky Islands | Six floating islands on bridges over a lava lake, and an ice slide from the top one back to the first |
| `pgc_nature` | Nature | A meadow with a snow field, ice rink, mud pit, sand beach, pond, lava pit, frozen lake, slime swamp, bushes and a greenhouse |
| `pgc_obstacle` | Obstacle Park | Steps, stepping stones, a beam over a splash pool, a gate on a button, and a spiral of ledges up a tower with a vault |
| `pgc_plots` | Build Plots | Eight plots of eight grounds (ice and rubber among them) with claim pads round a spawn plaza, a depot of planks and crates, trampolines, a pond and a viewing deck |
| `pgc_quarry` | Quarry | A two-terrace pit with ramps, rails and a cart, a flooded sump, boulders, barrels to blow up, and a blasting hut with a lever |
| `pgc_site` | Construction Site | A half-built frame climbed by switchback ramps, a tower crane, material piles, a flooded excavation and a site office |
| `pgc_slopes` | Slide Hill | A hill to a high deck, sleds at the head of a snow slope with an ice run-out, a halfpipe and a frozen pond with thin ice |
| `pgc_town` | Town | Two roads, five buildings with glass windows and doors on buttons, a fountain plaza with a stage, and a car park with two buggies |
| `pgc_warehouse` | Warehouse | Racking full of crates, a catwalk with barrels, a glazed office, a cold store with an ice floor and a yard of containers |

## Converted maps

These are community maps converted with the author's credit. Only the geometry is converted. The authors' textures are not carried: surfaces use the game's materials over Kenney's Prototype Textures (CC0). `tools/import_bsp.py` is the converter (`python3 -I tools/import_bsp.py <map.bsp> <config>`). Each map's document has an `attribution` field.

## Credits

| Map | Name | Author | Source | Licence |
| --- | --- | --- | --- | --- |
| `pgc_asheville` | Asheville | VanderAGSN | [rp_asheville](https://steamcommunity.com/sharedfiles/filedetails/?id=2595136841) | Steam Workshop (no licence stated) |
| `pgc_balkans` | Balkans | Lg | [gm_balkans](https://steamcommunity.com/sharedfiles/filedetails/?id=1307357127) | Steam Workshop (no licence stated) |
| `pgc_bigisland` | Big Island | Comrade Stinger and Hiyu | [gm_bigisland](https://steamcommunity.com/sharedfiles/filedetails/?id=169600867) | Steam Workshop (no licence stated) |
| `pgc_boreas` | Boreas | Blueberry_pie | [gm_boreas](https://steamcommunity.com/sharedfiles/filedetails/?id=1572373847) | Steam Workshop (no licence stated) |
| `pgc_construct_small` | Construct Small | Wylie | [gm_construct_small](https://gamebanana.com/mods/60385) | CC BY-NC-ND 4.0 |
| `pgc_deadcity` | Dead City | NuclearGhost | [rp_deadcity](https://steamcommunity.com/sharedfiles/filedetails/?id=1864156937) | Steam Workshop (no licence stated) |
| `pgc_fork` | Fork | Blueberry_pie | [gm_fork](https://steamcommunity.com/sharedfiles/filedetails/?id=326332456) | Steam Workshop (no licence stated) |
| `pgc_mallparking` | Mall Parking | bean | [gm_mallparking](https://steamcommunity.com/sharedfiles/filedetails/?id=2619660952) | Steam Workshop (no licence stated) |
| `pgc_mountain_resort` | Mountain Resort | prvec | [gm_mountainresort](https://steamcommunity.com/sharedfiles/filedetails/?id=2312309380) | Steam Workshop (no licence stated) |
| `pgc_rooftops` | Rooftops | youmenow1 | [ttt_rooftops_2016](https://steamcommunity.com/sharedfiles/filedetails/?id=534491717) | Steam Workshop (no licence stated) |
| `pgc_shambles` | Shambles | Fartomaticatron | [gm_shambles](https://steamcommunity.com/sharedfiles/filedetails/?id=151544081) | Steam Workshop (no licence stated) |
| `pgc_smallbase` | Small Base | Rouglead | [gm_smallbase](https://gamebanana.com/mods/60684) | CC BY-NC-ND 4.0 |
| `pgc_southside` | South Side | Fishke | [rp_southside](https://steamcommunity.com/sharedfiles/filedetails/?id=2010286798) | Steam Workshop (no licence stated) |
| `pgc_valley` | Valley | SuspiciouslyAwesome (Tim Richter) | [gm_valley](https://steamcommunity.com/sharedfiles/filedetails/?id=104483504) | Steam Workshop (no licence stated) |
| `pgc_vyten` | Vyten | Raxten | [gm_vyten](https://steamcommunity.com/sharedfiles/filedetails/?id=1449731878) | Steam Workshop (no licence stated) |

The two GameBanana maps carry the site's default licence, CC BY-NC-ND 4.0, and are shared non-commercially with credit. The Workshop maps state no licence on their pages. All are credited here, and a map is taken down when its author asks: open an issue at https://github.com/zees-games/playlot-maps/issues.

The repository's own code and original maps are MIT licensed.
