mon_cry: MACRO
; index, pitch, length
	dw \1, \2, \3
ENDM

PokemonCries::
; entries correspond to constants/pokemon_constants.asm
	mon_cry CRY_BULBASAUR,   $080,  $081 ; BULBASAUR
	mon_cry CRY_BULBASAUR,   $020,  $100 ; IVYSAUR
	mon_cry CRY_BULBASAUR,   $000,  $140 ; VENUSAUR
	mon_cry CRY_CHARMANDER,  $060,  $0c0 ; CHARMANDER
	mon_cry CRY_CHARMANDER,  $020,  $0c0 ; CHARMELEON
	mon_cry CRY_CHARMANDER,  $000,  $100 ; CHARIZARD
	mon_cry CRY_SQUIRTLE,    $060,  $0c0 ; SQUIRTLE
	mon_cry CRY_SQUIRTLE,    $020,  $0c0 ; WARTORTLE
	mon_cry CRY_BLASTOISE,   $000,  $100 ; BLASTOISE
	mon_cry CRY_CATERPIE,    $080,  $0a0 ; CATERPIE
	mon_cry CRY_METAPOD,     $0cc,  $081 ; METAPOD
	mon_cry CRY_CATERPIE,    $077,  $0c0 ; BUTTERFREE
	mon_cry CRY_WEEDLE,      $0ee,  $081 ; WEEDLE
	mon_cry CRY_BLASTOISE,   $0ff,  $081 ; KAKUNA
	mon_cry CRY_BLASTOISE,   $060,  $100 ; BEEDRILL
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PIDGEY
	mon_cry CRY_PIDGEOTTO,   $028,  $140 ; PIDGEOTTO
	mon_cry CRY_PIDGEOTTO,   $011,  $17f ; PIDGEOT
	mon_cry CRY_RATTATA,     $000,  $100 ; RATTATA
	mon_cry CRY_RATTATA,     $020,  $17f ; RATICATE
	mon_cry CRY_SPEAROW,     $000,  $100 ; SPEAROW
	mon_cry CRY_FEAROW,      $040,  $120 ; FEAROW
	mon_cry CRY_EKANS,       $012,  $0c0 ; EKANS
	mon_cry CRY_EKANS,       $0e0,  $090 ; ARBOK
	mon_cry CRY_BULBASAUR,   $0ee,  $081 ; PIKACHU
	mon_cry CRY_RAICHU,      $0ee,  $088 ; RAICHU
	mon_cry CRY_NIDORAN_M,   $020,  $0c0 ; SANDSHREW
	mon_cry CRY_NIDORAN_M,   $0ff,  $17f ; SANDSLASH
	mon_cry CRY_NIDORAN_F,   $000,  $100 ; NIDORAN_F
	mon_cry CRY_NIDORAN_F,   $02c,  $160 ; NIDORINA
	mon_cry CRY_NIDOQUEEN,   $000,  $100 ; NIDOQUEEN
	mon_cry CRY_NIDORAN_M,   $000,  $100 ; NIDORAN_M
	mon_cry CRY_NIDORAN_M,   $02c,  $140 ; NIDORINO
	mon_cry CRY_RAICHU,      $000,  $100 ; NIDOKING
	mon_cry CRY_CLEFAIRY,    $0cc,  $081 ; CLEFAIRY
	mon_cry CRY_CLEFAIRY,    $0aa,  $0a0 ; CLEFABLE
	mon_cry CRY_VULPIX,      $04f,  $090 ; VULPIX
	mon_cry CRY_VULPIX,      $088,  $0e0 ; NINETALES
	mon_cry CRY_PIDGEY,      $0ff,  $0b5 ; JIGGLYPUFF
	mon_cry CRY_PIDGEY,      $068,  $0e0 ; WIGGLYTUFF
	mon_cry CRY_SQUIRTLE,    $0e0,  $100 ; ZUBAT
	mon_cry CRY_SQUIRTLE,    $0fa,  $100 ; GOLBAT
	mon_cry CRY_ODDISH,      $0dd,  $081 ; ODDISH
	mon_cry CRY_ODDISH,      $0aa,  $0c0 ; GLOOM
	mon_cry CRY_VILEPLUME,   $022,  $17f ; VILEPLUME
	mon_cry CRY_PARAS,       $020,  $160 ; PARAS
	mon_cry CRY_PARAS,       $042,  $17f ; PARASECT
	mon_cry CRY_VENONAT,     $044,  $0c0 ; VENONAT
	mon_cry CRY_VENONAT,     $029,  $100 ; VENOMOTH
	mon_cry CRY_DIGLETT,     $0aa,  $081 ; DIGLETT
	mon_cry CRY_DIGLETT,     $02a,  $090 ; DUGTRIO
	mon_cry CRY_CLEFAIRY,    $077,  $090 ; MEOWTH
	mon_cry CRY_CLEFAIRY,    $099,  $17f ; PERSIAN
	mon_cry CRY_PSYDUCK,     $020,  $0e0 ; PSYDUCK
	mon_cry CRY_PSYDUCK,     $0ff,  $0c0 ; GOLDUCK
	mon_cry CRY_NIDOQUEEN,   $0dd,  $0e0 ; MANKEY
	mon_cry CRY_NIDOQUEEN,   $0af,  $0c0 ; PRIMEAPE
	mon_cry CRY_GROWLITHE,   $020,  $0c0 ; GROWLITHE
	mon_cry CRY_WEEDLE,      $000,  $100 ; ARCANINE
	mon_cry CRY_PIDGEY,      $0ff,  $17f ; POLIWAG
	mon_cry CRY_PIDGEY,      $077,  $0e0 ; POLIWHIRL
	mon_cry CRY_PIDGEY,      $000,  $17f ; POLIWRATH
	mon_cry CRY_METAPOD,     $0c0,  $081 ; ABRA
	mon_cry CRY_METAPOD,     $0a8,  $140 ; KADABRA
	mon_cry CRY_METAPOD,     $098,  $17f ; ALAKAZAM
	mon_cry CRY_GROWLITHE,   $0ee,  $081 ; MACHOP
	mon_cry CRY_GROWLITHE,   $048,  $0e0 ; MACHOKE
	mon_cry CRY_GROWLITHE,   $008,  $140 ; MACHAMP
	mon_cry CRY_PSYDUCK,     $055,  $081 ; BELLSPROUT
	mon_cry CRY_WEEPINBELL,  $044,  $0a0 ; WEEPINBELL
	mon_cry CRY_WEEPINBELL,  $066,  $14c ; VICTREEBEL
	mon_cry CRY_VENONAT,     $000,  $100 ; TENTACOOL
	mon_cry CRY_VENONAT,     $0ee,  $17f ; TENTACRUEL
	mon_cry CRY_VULPIX,      $0f0,  $090 ; GEODUDE
	mon_cry CRY_VULPIX,      $000,  $100 ; GRAVELER
	mon_cry CRY_GOLEM,       $0e0,  $0c0 ; GOLEM
	mon_cry CRY_WEEPINBELL,  $000,  $100 ; PONYTA
	mon_cry CRY_WEEPINBELL,  $020,  $140 ; RAPIDASH
	mon_cry CRY_SLOWPOKE,    $000,  $100 ; SLOWPOKE
	mon_cry CRY_GROWLITHE,   $000,  $100 ; SLOWBRO
	mon_cry CRY_METAPOD,     $080,  $0e0 ; MAGNEMITE
	mon_cry CRY_METAPOD,     $020,  $140 ; MAGNETON
	mon_cry CRY_SPEAROW,     $0dd,  $081 ; FARFETCH_D
	mon_cry CRY_DIGLETT,     $0bb,  $081 ; DODUO
	mon_cry CRY_DIGLETT,     $099,  $0a0 ; DODRIO
	mon_cry CRY_SEEL,        $088,  $140 ; SEEL
	mon_cry CRY_SEEL,        $023,  $17f ; DEWGONG
	mon_cry CRY_GRIMER,      $000,  $100 ; GRIMER
	mon_cry CRY_MUK,         $0ef,  $17f ; MUK
	mon_cry CRY_FEAROW,      $000,  $100 ; SHELLDER
	mon_cry CRY_FEAROW,      $06f,  $160 ; CLOYSTER
	mon_cry CRY_METAPOD,     $000,  $100 ; GASTLY
	mon_cry CRY_METAPOD,     $030,  $0c0 ; HAUNTER
	mon_cry CRY_MUK,         $000,  $17f ; GENGAR
	mon_cry CRY_EKANS,       $0ff,  $140 ; ONIX
	mon_cry CRY_DROWZEE,     $088,  $0a0 ; DROWZEE
	mon_cry CRY_DROWZEE,     $0ee,  $0c0 ; HYPNO
	mon_cry CRY_KRABBY,      $020,  $160 ; KRABBY
	mon_cry CRY_KRABBY,      $0ee,  $160 ; KINGLER
	mon_cry CRY_VOLTORB,     $0ed,  $100 ; VOLTORB
	mon_cry CRY_VOLTORB,     $0a8,  $110 ; ELECTRODE
	mon_cry CRY_DIGLETT,     $000,  $100 ; EXEGGCUTE
	mon_cry CRY_DROWZEE,     $000,  $100 ; EXEGGUTOR
	mon_cry CRY_CLEFAIRY,    $000,  $100 ; CUBONE
	mon_cry CRY_ODDISH,      $04f,  $0e0 ; MAROWAK
	mon_cry CRY_GOLEM,       $080,  $140 ; HITMONLEE
	mon_cry CRY_SEEL,        $0ee,  $140 ; HITMONCHAN
	mon_cry CRY_SEEL,        $000,  $100 ; LICKITUNG
	mon_cry CRY_GOLEM,       $0e6,  $15d ; KOFFING
	mon_cry CRY_GOLEM,       $0ff,  $17f ; WEEZING
	mon_cry CRY_CHARMANDER,  $000,  $100 ; RHYHORN
	mon_cry CRY_RHYDON,      $000,  $100 ; RHYDON
	mon_cry CRY_PIDGEOTTO,   $00a,  $140 ; CHANSEY
	mon_cry CRY_GOLEM,       $000,  $100 ; TANGELA
	mon_cry CRY_KANGASKHAN,  $000,  $100 ; KANGASKHAN
	mon_cry CRY_CLEFAIRY,    $099,  $090 ; HORSEA
	mon_cry CRY_CLEFAIRY,    $03c,  $081 ; SEADRA
	mon_cry CRY_CATERPIE,    $080,  $0c0 ; GOLDEEN
	mon_cry CRY_CATERPIE,    $010,  $17f ; SEAKING
	mon_cry CRY_PARAS,       $002,  $0a0 ; STARYU
	mon_cry CRY_PARAS,       $000,  $100 ; STARMIE
	mon_cry CRY_KRABBY,      $008,  $0c0 ; MR__MIME
	mon_cry CRY_CATERPIE,    $000,  $100 ; SCYTHER
	mon_cry CRY_DROWZEE,     $0ff,  $17f ; JYNX
	mon_cry CRY_VOLTORB,     $08f,  $17f ; ELECTABUZZ
	mon_cry CRY_CHARMANDER,  $0ff,  $0b0 ; MAGMAR
	mon_cry CRY_PIDGEOTTO,   $000,  $100 ; PINSIR
	mon_cry CRY_SQUIRTLE,    $011,  $0c0 ; TAUROS
	mon_cry CRY_EKANS,       $080,  $080 ; MAGIKARP
	mon_cry CRY_EKANS,       $000,  $100 ; GYARADOS
	mon_cry CRY_LAPRAS,      $000,  $100 ; LAPRAS
	mon_cry CRY_PIDGEY,      $0ff,  $17f ; DITTO
	mon_cry CRY_VENONAT,     $088,  $0e0 ; EEVEE
	mon_cry CRY_VENONAT,     $0aa,  $17f ; VAPOREON
	mon_cry CRY_VENONAT,     $03d,  $100 ; JOLTEON
	mon_cry CRY_VENONAT,     $010,  $0a0 ; FLAREON
	mon_cry CRY_WEEPINBELL,  $0aa,  $17f ; PORYGON
	mon_cry CRY_GROWLITHE,   $0f0,  $081 ; OMANYTE
	mon_cry CRY_GROWLITHE,   $0ff,  $0c0 ; OMASTAR
	mon_cry CRY_CATERPIE,    $0bb,  $0c0 ; KABUTO
	mon_cry CRY_FEAROW,      $0ee,  $081 ; KABUTOPS
	mon_cry CRY_VILEPLUME,   $020,  $170 ; AERODACTYL
	mon_cry CRY_GRIMER,      $055,  $081 ; SNORLAX
	mon_cry CRY_RAICHU,      $080,  $0c0 ; ARTICUNO
	mon_cry CRY_FEAROW,      $0ff,  $100 ; ZAPDOS
	mon_cry CRY_RAICHU,      $0f8,  $0c0 ; MOLTRES
	mon_cry CRY_BULBASAUR,   $060,  $0c0 ; DRATINI
	mon_cry CRY_BULBASAUR,   $040,  $100 ; DRAGONAIR
	mon_cry CRY_BULBASAUR,   $03c,  $140 ; DRAGONITE
	mon_cry CRY_PARAS,       $099,  $17f ; MEWTWO
	mon_cry CRY_PARAS,       $0ee,  $17f ; MEW
	mon_cry CRY_CHIKORITA,  -$010,  $0b0 ; CHIKORITA
	mon_cry CRY_CHIKORITA,  -$022,  $120 ; BAYLEEF
	mon_cry CRY_CHIKORITA,  -$0b7,  $200 ; MEGANIUM
	mon_cry CRY_CYNDAQUIL,   $347,  $080 ; CYNDAQUIL
	mon_cry CRY_CYNDAQUIL,   $321,  $120 ; QUILAVA
	mon_cry CRY_TYPHLOSION,  $f00,  $0d4 ; TYPHLOSION
	mon_cry CRY_TOTODILE,    $46c,  $0e8 ; TOTODILE
	mon_cry CRY_TOTODILE,    $440,  $110 ; CROCONAW
	mon_cry CRY_TOTODILE,    $3fc,  $180 ; FERALIGATR
	mon_cry CRY_SENTRET,     $08a,  $0b8 ; SENTRET
	mon_cry CRY_SENTRET,     $06b,  $102 ; FURRET
	mon_cry CRY_HOOTHOOT,    $091,  $0d8 ; HOOTHOOT
	mon_cry CRY_HOOTHOOT,    $000,  $1a0 ; NOCTOWL
	mon_cry CRY_LEDYBA,      $000,  $0de ; LEDYBA
	mon_cry CRY_LEDYBA,     -$096,  $138 ; LEDIAN
	mon_cry CRY_SPINARAK,    $011,  $200 ; SPINARAK
	mon_cry CRY_SPINARAK,   -$0ae,  $1e2 ; ARIADOS
	mon_cry CRY_SQUIRTLE,   -$010,  $140 ; CROBAT
	mon_cry CRY_CYNDAQUIL,   $3c9,  $140 ; CHINCHOU
	mon_cry CRY_CYNDAQUIL,   $2d0,  $110 ; LANTURN
	mon_cry CRY_PICHU,       $000,  $140 ; PICHU
	mon_cry CRY_CLEFFA,      $061,  $091 ; CLEFFA
	mon_cry CRY_CHIKORITA,   $0e8,  $0e8 ; IGGLYBUFF
	mon_cry CRY_TOGEPI,      $010,  $100 ; TOGEPI
	mon_cry CRY_TOGETIC,     $03b,  $038 ; TOGETIC
	mon_cry CRY_NATU,       -$067,  $100 ; NATU
	mon_cry CRY_NATU,       -$0a7,  $168 ; XATU
	mon_cry CRY_MAREEP,      $022,  $0d8 ; MAREEP
	mon_cry CRY_MAREEP,     -$007,  $180 ; FLAAFFY
	mon_cry CRY_AMPHAROS,   -$07c,  $0e8 ; AMPHAROS
	mon_cry CRY_CLEFFA,      $084,  $150 ; BELLOSSOM
	mon_cry CRY_MARILL,      $11b,  $120 ; MARILL
	mon_cry CRY_MARILL,      $0b6,  $180 ; AZUMARILL
	mon_cry CRY_CLEFFA,      $f40,  $180 ; SUDOWOODO
	mon_cry CRY_CLEFFA,     -$2a3,  $1c8 ; POLITOED
	mon_cry CRY_CLEFFA,      $03b,  $0c8 ; HOPPIP
	mon_cry CRY_CLEFFA,      $027,  $138 ; SKIPLOOM
	mon_cry CRY_CLEFFA,      $000,  $180 ; JUMPLUFF
	mon_cry CRY_AIPOM,      -$051,  $0e8 ; AIPOM
	mon_cry CRY_MARILL,      $12b,  $0b8 ; SUNKERN
	mon_cry CRY_SUNFLORA,   -$020,  $180 ; SUNFLORA
	mon_cry CRY_TOTODILE,    $031,  $0c8 ; YANMA
	mon_cry CRY_WOOPER,      $093,  $0af ; WOOPER
	mon_cry CRY_WOOPER,     -$0c6,  $140 ; QUAGSIRE
	mon_cry CRY_AIPOM,       $0a2,  $140 ; ESPEON
	mon_cry CRY_VENONAT,    -$0e9,  $0f0 ; UMBREON
	mon_cry CRY_MARILL,     -$01f,  $180 ; MURKROW
	mon_cry CRY_SLOWKING,    $104,  $200 ; SLOWKING
	mon_cry CRY_HOOTHOOT,    $130,  $0e8 ; MISDREAVUS
	mon_cry CRY_HOOTHOOT,    $162,  $100 ; UNOWN
	mon_cry CRY_AMPHAROS,    $27b,  $144 ; WOBBUFFET
	mon_cry CRY_GIRAFARIG,   $041,  $200 ; GIRAFARIG
	mon_cry CRY_SLOWKING,    $080,  $100 ; PINECO
	mon_cry CRY_SLOWKING,    $000,  $180 ; FORRETRESS
	mon_cry CRY_DUNSPARCE,   $1c4,  $100 ; DUNSPARCE
	mon_cry CRY_GLIGAR,     -$102,  $100 ; GLIGAR
	mon_cry CRY_TYPHLOSION,  $0ef,  $0f7 ; STEELIX
	mon_cry CRY_DUNSPARCE,   $112,  $0e8 ; SNUBBULL
	mon_cry CRY_DUNSPARCE,   $000,  $180 ; GRANBULL
	mon_cry CRY_SLOWKING,    $160,  $0e0 ; QWILFISH
	mon_cry CRY_AMPHAROS,    $000,  $160 ; SCIZOR
	mon_cry CRY_DUNSPARCE,   $290,  $0a8 ; SHUCKLE
	mon_cry CRY_AMPHAROS,    $035,  $0e0 ; HERACROSS
	mon_cry CRY_WOOPER,      $053,  $0af ; SNEASEL
	mon_cry CRY_TEDDIURSA,   $7a2,  $06e ; TEDDIURSA
	mon_cry CRY_TEDDIURSA,   $640,  $0d8 ; URSARING
	mon_cry CRY_SLUGMA,     -$1d8,  $140 ; SLUGMA
	mon_cry CRY_MAGCARGO,   -$20d,  $1c0 ; MAGCARGO
	mon_cry CRY_CYNDAQUIL,   $1fe,  $140 ; SWINUB
	mon_cry CRY_MAGCARGO,   -$109,  $100 ; PILOSWINE
	mon_cry CRY_MAGCARGO,    $0a1,  $0e8 ; CORSOLA
	mon_cry CRY_SUNFLORA,    $00d,  $100 ; REMORAID
	mon_cry CRY_TOTODILE,    $000,  $180 ; OCTILLERY
	mon_cry CRY_TEDDIURSA,   $002,  $06a ; DELIBIRD
	mon_cry CRY_MANTINE,    -$0be,  $0f0 ; MANTINE
	mon_cry CRY_AMPHAROS,    $8a9,  $180 ; SKARMORY
	mon_cry CRY_CYNDAQUIL,   $039,  $140 ; HOUNDOUR
	mon_cry CRY_TOTODILE,   -$10a,  $100 ; HOUNDOOM
	mon_cry CRY_SLUGMA,      $2fb,  $100 ; KINGDRA
	mon_cry CRY_SENTRET,     $048,  $230 ; PHANPY
	mon_cry CRY_DONPHAN,     $000,  $1a0 ; DONPHAN
	mon_cry CRY_GIRAFARIG,   $073,  $240 ; PORYGON2
	mon_cry CRY_AIPOM,      -$160,  $180 ; STANTLER
	mon_cry CRY_PICHU,      -$21a,  $1f0 ; SMEARGLE
	mon_cry CRY_AIPOM,       $02c,  $108 ; TYROGUE
	mon_cry CRY_SLUGMA,      $000,  $100 ; HITMONTOP
	mon_cry CRY_MARILL,      $068,  $100 ; SMOOCHUM
	mon_cry CRY_SUNFLORA,   -$2d8,  $0b4 ; ELEKID
	mon_cry CRY_TEDDIURSA,   $176,  $03a ; MAGBY
	mon_cry CRY_GLIGAR,     -$1cd,  $1a0 ; MILTANK
	mon_cry CRY_SLOWKING,    $293,  $140 ; BLISSEY
	mon_cry CRY_RAIKOU,      $22e,  $120 ; RAIKOU
	mon_cry CRY_ENTEI,       $000,  $1a0 ; ENTEI
	mon_cry CRY_MAGCARGO,    $000,  $180 ; SUICUNE
	mon_cry CRY_RAIKOU,      $05f,  $0d0 ; LARVITAR
	mon_cry CRY_SPINARAK,   -$1db,  $150 ; PUPITAR
	mon_cry CRY_RAIKOU,     -$100,  $180 ; TYRANITAR
	mon_cry CRY_TYPHLOSION,  $000,  $100 ; LUGIA
	mon_cry CRY_AIPOM,       $000,  $180 ; HO_OH
	mon_cry CRY_ENTEI,       $14a,  $111 ; CELEBI
	mon_cry CRY_KRABBY,      $0bf,  $0b0 ; TREECKO SourApple
	mon_cry CRY_VENONAT,     $edb,  $170 ; GROVYLE SourApple
	mon_cry CRY_VENONAT,     $f0b,  $200 ; SCEPTILE SourApple
	mon_cry CRY_HOOTHOOT,    $0ff,  $0c8 ; TORCHIC Celadonk
	mon_cry CRY_HOOTHOOT,    $0b9,  $124 ; COMBUSKEN Celadonk
	mon_cry CRY_TYPHLOSION,  $f43,  $100 ; BLAZIKEN SourApple
	mon_cry CRY_PSYDUCK,     $725,  $091 ; MUDKIP Celadonk
	mon_cry CRY_ODDISH,      $0ea,  $0e0 ; MARSHTOMP SourApple
	mon_cry CRY_ODDISH,      $50d,  $1b2 ; SWAMPERT Celadonk
	mon_cry CRY_PIDGEY,      $52d,  $0f2 ; POOCHYENA Celadonk
	mon_cry CRY_BLASTOISE,   $000,  $150 ; MIGHTYENA Celadonk
	mon_cry CRY_WEEDLE,      $80b,  $081 ; ZIGZAGOON Celadonk
	mon_cry CRY_WEEDLE,      $609,  $1b1 ; LINOONE Celadonk
	mon_cry CRY_PIDGEY,      $0df,  $084 ; WRUMPLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SILCOON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BEUTIFLY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CASCOON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DUSTOX PLACEHOLDER
	mon_cry CRY_SPINARAK,    $ff3,  $060 ; LOTAD SourApple
	mon_cry CRY_FEAROW,      $680,  $090 ; LOMBRE Celadonk
	mon_cry CRY_KRABBY,      $0d0,  $0fa ; LUDICOLO SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SEEDOT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; NUZLEAF PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SHIFTRY PLACEHOLDER
	mon_cry CRY_SPEAROW,     $06f,  $080 ; TAILLOW Monstarules
	mon_cry CRY_SPEAROW,     $020,  $090 ; SWELLOW Monstarules
	mon_cry CRY_SUNFLORA,    $d73,  $100 ; WINGULL SourApple
	mon_cry CRY_MAGCARGO,    $f30,  $100 ; PELIPPER SourApple
	mon_cry CRY_GLIGAR,      $ffc,  $110 ; RALTS SourApple
	mon_cry CRY_VILEPLUME,   $008,  $100 ; KIRLIA Celadonk
	mon_cry CRY_VILEPLUME,   $f22,  $163 ; GARDEVOIR Celadonk
	mon_cry CRY_GROWLITHE,   $1bd,  $0f0 ; SURSKIT SourApple
	mon_cry CRY_KRABBY,      $1b0,  $0c0 ; MASQUERAIN SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SHROOMISH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BRELOOM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SLAKOTH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VIGOROTH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SLAKING PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; NINCADA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; NINJASK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SHEDINJA PLACEHOLDER
	mon_cry CRY_TOGETIC,     $00b,  $04a ; WHISMUR SourApple
	mon_cry CRY_SLOWKING,    $8df,  $10a ; LOUDRED SourApple
	mon_cry CRY_TEDDIURSA,   $6dd,  $100 ; EXPLOUD SourApple
	mon_cry CRY_MUK,         $02d,  $0a0 ; MAKUHITA SourApple
	mon_cry CRY_MUK,         $e22,  $1d0 ; HARIYAMA SourApple
	mon_cry CRY_MARILL,      $124,  $0D0 ; AZURILL SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; NOSEPASS PLACEHOLDER
	mon_cry CRY_GIRAFARIG,   $076,  $100 ; SKITTY SourApple
	mon_cry CRY_GIRAFARIG,   $058,  $400 ; DELCATTY SourApple
	mon_cry CRY_CATERPIE,    $ee3,  $100 ; SABLEYE SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MAWILE PLACEHOLDER
	mon_cry CRY_GROWLITHE,   $080,  $0b0 ; ARON Celadonk
	mon_cry CRY_WEEDLE,      $040,  $090 ; LAIRON Celadonk
	mon_cry CRY_SLOWKING,    $207,  $1b2 ; AGGRON Celadonk
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MEDITITE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MEDICHAM PLACEHOLDER
	mon_cry CRY_PICHU,       $f17,  $270 ; ELECTRIKE SourApple
	mon_cry CRY_UNUSED,      $f27,  $080 ; MANECTRIC SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PLUSLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MINUN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VOLBEAT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ILLUMISE PLACEHOLDER
	mon_cry CRY_AIPOM,       $041,  $0ae ; ROSELIA SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GULPIN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SWALOT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CARVANHA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SHARPEDO PLACEHOLDER
	mon_cry CRY_TEDDIURSA,   $58e,  $0c8 ; WAILMER SourApple
	mon_cry CRY_TEDDIURSA,   $5bf,  $188 ; WAILORD SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; NUMEL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CAMERUPT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TORKOAL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SPOINK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GRUMPIG PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SPINDA PLACEHOLDER
	mon_cry CRY_CYNDAQUIL,   $2f4,  $129 ; TRAPINCH SourApple
	mon_cry CRY_SLUGMA,      $2c2,  $0f3 ; VIBRAVA SourApple
	mon_cry CRY_KRABBY,      $cda,  $132 ; FLYGON SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CACNEA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CACTURNE PLACEHOLDER
	mon_cry CRY_TOGETIC,     $010,  $017 ; SWABLU FrostedGeulleisia
	mon_cry CRY_NIDORAN_M,   $045,  $155 ; ALTARIA SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ZANGOOSE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SEVIPER PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LUNATONE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SOLROCK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BARBOACH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; WHISCASH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CORPHISH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CRAWDAUNT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BALTOY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CLAYDOL PLACEHOLDER
	mon_cry CRY_RATTATA,     $1fd,  $170 ; LILEEP SourApple
	mon_cry CRY_VILEPLUME,   $eea,  $200 ; CRADILY SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ANORITH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ARMALDO PLACEHOLDER
	mon_cry CRY_GRIMER,      $04d,  $0f0 ; FEEBAS SourApple
	mon_cry CRY_SQUIRTLE,    $084,  $23c ; MILOTIC SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CASTFORM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KECLEON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SHUPPET PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BANETTE PLACEHOLDER
	mon_cry CRY_CYNDAQUIL,   $10e,  $050 ; DUSKULL SourApple
	mon_cry CRY_NATU,        $a5e,  $160 ; DUSCLOPS SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TROPIUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CHIMECHO PLACEHOLDER
	mon_cry CRY_SPEAROW,     $795,  $0A7 ; ABSOL SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; WYNAUT PLACEHOLDER
	mon_cry CRY_PSYDUCK,     $26f,  $0dd ; SNORUNT SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GLALIE PLACEHOLDER
	mon_cry CRY_SEEL,        $130,  $060 ; SPHEAL SourApple
	mon_cry CRY_CLEFFA,      $e88,  $140 ; SEALEO SourApple
	mon_cry CRY_WOOPER,      $e82,  $480 ; WALREIN SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CLAMPERL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HUNTAIL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GOREBYSS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; RELICANTH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LUVDISC PLACEHOLDER
	mon_cry CRY_NIDORAN_F,   $f26,  $0c0 ; BAGON SourApple
	mon_cry CRY_NIDORAN_F,   $e15,  $200 ; SHELGON SourApple
	mon_cry CRY_RAICHU,      $f1f,  $130 ; SALAMENCE SourApple
	mon_cry CRY_CYNDAQUIL,   $40c,  $140 ; BELDUM SourApple
	mon_cry CRY_SLOWKING,    $6af,  $17a ; METANG SourApple
	mon_cry CRY_METAPOD,     $def,  $25a ; METAGROSS SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; REGIROCK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; REGICE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; REGISTEEL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LATIAS PLACEHOLDER
	mon_cry CRY_MAGCARGO,    $f1c,  $20a ; LATIOS SourApple
	mon_cry CRY_METAPOD,     $689,  $20a ; KYOGRE SourApple
	mon_cry CRY_TYPHLOSION,  $d18,  $18a ; GROUDON SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; RAYQUAZA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; JIRACHI PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DEOXYS PLACEHOLDER
	mon_cry CRY_TOGETIC,     $d00,  $050 ; TURTWIG SourApple
	mon_cry CRY_MARILL,      $eec,  $180 ; GROTLE SourApple
	mon_cry CRY_ENTEI,       $eee,  $480 ; TORTERRA SourApple
	mon_cry CRY_CLEFAIRY,    $06a,  $200 ; CHIMCHAR SourApple
	mon_cry CRY_PIDGEOTTO,   $fef,  $200 ; MONFERNO SourApple
	mon_cry CRY_PIDGEOTTO,   $ef6,  $300 ; INFERNAPE SourApple
	mon_cry CRY_PSYDUCK,     $250,  $0a0 ; PIPLUP walshyb edited by chaos_lord2
	mon_cry CRY_RAICHU,     -$006,  $0b0 ; PRINPLUP Ax6
	mon_cry CRY_BLASTOISE,   $093,  $15a ; EMPOLEON Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; STARLY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; STARAVIA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; STARAPTOR PLACEHOLDER
	mon_cry CRY_MARILL,      $030,  $190 ; BIDOOF Monstarules
	mon_cry CRY_RAIKOU,      $030,  $150 ; BIBAREL Monstarules
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KRIKETOT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KRIKETUNE PLACEHOLDER
	mon_cry CRY_RATTATA,     $065,  $270 ; SHINX walshyb
	mon_cry CRY_PIDGEOTTO,   $010,  $180 ; LUXIO Ax6
	mon_cry CRY_RAICHU,     -$038,  $0c8 ; LUXRAY Ax6
	mon_cry CRY_VENONAT,     $00e,  $0be ; BUDEW Ax6
	mon_cry CRY_PICHU,      -$047,  $266 ; ROSERADE Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CRANIDOS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; RAMPADOS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SHIELDON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BASTIODON PLACEHOLDER
	mon_cry CRY_CHATOT,      $03c,  $128 ; BURMY Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; WORMADAM PLACEHOLDER
	mon_cry CRY_NIDOQUEEN,  -$05c,  $0d8 ; MOTHIM Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; COMBEE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VESPIQUEN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PACHIRISU PLACEHOLDER
	mon_cry CRY_BLASTOISE,   $203,  $0c4 ; BUIZEL Ax6
	mon_cry CRY_PIDGEOTTO,  -$0ca,  $240 ; FLOATZEL Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CHERUBI PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CHERIM PLACEHOLDER
	mon_cry CRY_WEEDLE,      $0ff,  $0aa ; SHELLOS walshyb
	mon_cry CRY_GASTRODON,   $830,  $050 ; GASTRODON myRattata
	mon_cry CRY_PIDGEY,      $0df,  $084 ; AMBIPOM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DRIFLOON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DRIFBLIM PLACEHOLDER
	mon_cry CRY_BUNEARY,    -$012,  $09a ; BUNEARY Ax6
	mon_cry CRY_VULPIX,     -$00f,  $0a9 ; LOPUNNY Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MISMAGIUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HONCHKROW PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GLAMEOW PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PURUGLY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CHINGLING PLACEHOLDER
	mon_cry CRY_SLOWPOKE,   -$016,  $1c4 ; STUNKY Ax6
	mon_cry CRY_BLASTOISE,   $0bc,  $0cd ; SKUNTANK Ax6
	mon_cry CRY_EKANS,       $101,  $086 ; BRONZOR Ax6
	mon_cry CRY_EKANS,       $12a,  $170 ; BRONZONG Ax6
	mon_cry CRY_SLOWPOKE,    $03c,  $15a ; BONSLY Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MIME_JR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HAPPINY PLACEHOLDER
	mon_cry CRY_CHATOT,      $002,  $120 ; CHATOT Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SPIRITOMB PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GIBLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GABITE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GARCHOMP PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MUNCHLAX PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; RIOLU PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LUCARIO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HIPPOPOTAS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HIPPOWDON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SKORUPI PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DRAPION PLACEHOLDER
	mon_cry CRY_DIGLETT,    -$133,  $125 ; CROAGUNK Ax6
	mon_cry CRY_SLOWKING,    $002,  $2c6 ; TOXICROAK Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CARNIVINE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FINNEON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LUMINEON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MANTYKE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SNOWVER PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ABOMASNOW PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; WEAVILE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MAGNEZONE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LICKYLICKY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; RHYPERIOR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TANGROWTH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ELECTRIVE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MAGMORTAR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TOGEKISS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; YANMEGA PLACEHOLDER
	mon_cry CRY_VENONAT,     $03d,  $160 ; LEAFEON Polisheddevs
	mon_cry CRY_TYPHLOSION,  $014,  $118 ; GLACEON FrostedGeulleisia
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GLISCOR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MAMOSWINE PLACEHOLDER
	mon_cry CRY_SEEL,        $212,  $270 ; PORYGON_Z SourApple
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GALLADE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PROBOPASS PLACEHOLDER
	mon_cry CRY_MAGCARGO,   -$01a,  $2e2 ; DUSKNOIR Ax6
	mon_cry CRY_BLASTOISE,   $12b,  $0eb ; FROSLASS Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ROTOM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; UXIE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MESPIRIT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; AZELF PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DIALGA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PALKIA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HEATRAN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; REGIGIGAS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GIRATINA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CRESSILIA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PHIONE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MANAPHY PLACEHOLDER
	mon_cry CRY_RAICHU,     -$1f8,  $0e8 ; DARKRAI Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SHAYMIN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ARCEUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VICTINI PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SNIVY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SERVINE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SERPERIOR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TEPIG PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PIGNITE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; EMBOAR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; OSHAWOTT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DEWOTT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SAMUROTT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PATRAT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; WATCHOG PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LILLIPUP PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HERDIER PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; STOUTLAND PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PURRLOIN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LIEPARD PLACEHOLDER
	mon_cry CRY_PSYDUCK,     $16b,  $09c ; PANSAGE Ax6
	mon_cry CRY_NIDORAN_M,  -$013,  $0d5 ; SIMISAGE Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PANSEAR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SIMISEAR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PANPOUR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SIMIPOUR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MUNNA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MUSHANA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PIDOVE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TRANQUILL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; UNFEZANT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BLITZLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ZEBSTRIKA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ROGGENROLA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BOLDORE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GIGALITH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; WOOBAT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SWOOBAT PLACEHOLDER
	mon_cry CRY_TEDDIURSA,  -$018,  $0b3 ; DRILBUR Ax6
	mon_cry CRY_NIDOQUEEN,  -$108,  $14d ; EXCADRILL Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; AUDINO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TIMBURR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GURDURR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CONKLEDURR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TYMPOLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PALPITOAD PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SEISMITOAD PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; THROH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SAWK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SEWADDLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SWADLOON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LEAVANNY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VENIPEDE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; WHIRLIPEDE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SCOILIPEDE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; COTTONEE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; WHIMSICOTT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PETILIL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LILLIGANT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BASCULIN PLACEHOLDER
	mon_cry CRY_PIDGEOTTO,  -$099,  $0f3 ; SANDILE Ax6
	mon_cry CRY_LAPRAS,     -$1d8,  $15d ; KROKOROK Ax6
	mon_cry CRY_LAPRAS,     -$209,  $1ca ; KROOKODILE Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DARUMAKA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DARMANITAN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MARACTUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DWEBBLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CRUSTLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SCRAGGY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SCRAFTY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SIGILITH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; YAMASK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; COFAGRIGUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TIRTOUGA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CARRACOSTA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ARCHEN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ARCHEOPS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TRUBBISH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GARBADOR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ZORUA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ZOROARK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MINCCINO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CINCCINO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GOTHITA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GOTHORITA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GOTHITELLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SOLOSIS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DUOSION PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; REUNICLUS PLACEHOLDER
	mon_cry CRY_LEDYBA,     -$0cd,  $0ec ; DUCKLETT Ax6
	mon_cry CRY_TEDDIURSA,  -$022,  $0ca ; SWANNA Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VANILLITE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VANILLISH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VANILLUXE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DEARLING PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SAWSBUCK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; EMOLGA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KERRABLAST PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ESCAVALIER PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FOONGUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; AMOONGUSS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FRILLISH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; JELLICANT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ALOLAMOLA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; JOLTIK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GAVANTULA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FERROSEED PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FERROTHORN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KLINK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KLANG PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KLINKLANG PLACEHOLDER
	mon_cry CRY_SENTRET,     $03a,  $2a8 ; TYNAMO Ax6
	mon_cry CRY_LAPRAS,     -$159,  $145 ; EELEKTRIK Ax6
	mon_cry CRY_BLASTOISE,   $06f,  $148 ; EELEKTROSS Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ELGYEM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BEHEEYEM PLACEHOLDER
	mon_cry CRY_WOOPER,      $030,  $0d0 ; LITWICK Ax6
	mon_cry CRY_CLEFAIRY,   -$02e,  $1dd ; LAMPENT Ax6
	mon_cry CRY_ENTEI,       $078,  $4c0 ; CHANDELURE Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; AXEW PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FRAXURE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HAXORUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CUBCHOO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BEARTIC PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CRYOGONAL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SHELMET PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ACCELGOR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; STUNFISK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MIENFOO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MIENSHAO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DRUDDIGON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GOLETT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GOLURK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PAWNIARD PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BISHARP PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BOUFFALANT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; RUFFLET PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BRAVIARY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VULLABY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MANDIBUZZ PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HEATMOR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DURANT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DEINO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ZWEILOUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HYDREIGON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LARVESTA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VOLCARONA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; COBALION PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TERRAKION PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VIRIZION PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TORNADUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; THUNDERUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; RESHIRAM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ZEKROM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LANDEROUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KYUREM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KELDEO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MELOETTA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GENESECT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CHESPIN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; QUILLADIN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CHESTNAUGHT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FENNEKIN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BRAIXEN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DELPHOX PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FROAKIE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FROGADIER PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GRENINJA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BUNNELBY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DIGGERSBY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FLETCHLING PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FLETCHINDER PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TALONFLAME PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SCATTERBUG PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SPEWPA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VIVILLON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LITLEO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PYROAR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FLABEBE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FLOETTE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FLORGES PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SKIDDO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GOGOAT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PANCHAM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PANGORO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FURFROU PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ESPURR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MEOWSTIC PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HONEDGE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DOUBLADE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; AEGISLASH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SPRITZEE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; AROMATISSE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SWIRLIX PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SLURPUFF PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; INKAY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MALAMAR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BIANCLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BARBANCLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SKRELP PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DRAGALGE PLACEHOLDER
	mon_cry CRY_KRABBY,      $035,  $0ac ; CLAUNCHER Ax6
	mon_cry CRY_SQUIRTLE,   -$026,  $097 ; CLAWITZER Ax6
	mon_cry CRY_PARAS,       $059,  $12a ; HELIOPTILE Ax6
	mon_cry CRY_HELIOLISK,  -$005,  $0f8 ; HELIOLISK Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TYRUNT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TYRANTRUM PLACEHOLDER
	mon_cry CRY_AMAURA,     -$002,  $13d ; AMAURA Ax6
	mon_cry CRY_BLASTOISE,   $103,  $0ea ; AURORUS Ax6
	mon_cry CRY_VENONAT,     $0b0,  $16f ; SYLVEON Polisheddevs
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HAWLUCHA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DEDENNE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CARBINK PLACEHOLDER
	mon_cry CRY_GOOMY,       $0b4,  $0ea ; GOOMY myRattata
	mon_cry CRY_CHATOT,     -$01a,  $2e6 ; SLIGGOO Ax6
	mon_cry CRY_VULPIX,     -$107,  $0ca ; GOODRA Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KLEFKI PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PHANTUMP PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TREVENANT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PUMPKABOO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GOURGEIST PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BERGMITE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; AVALUGG PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; NOIBAT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; NOIVERN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; XERNEAS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; YVELTAL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ZYGARDE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DIANCIE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HOOPA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VOLCANION PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ROWLET PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DARTRIX PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DECIDUEYE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LITTEN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TORRACAT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; INCINEROAR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; POPPLIO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BRIONNE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PRIMARINA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PIKIPEK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TRUMBEAK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TOUCANNON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; YUNGOOS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GUMSHOOS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GRUBBIN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CHARJABUG PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; VIKAVOLT PLACEHOLDER
	mon_cry CRY_CRABRAWLER, -$349,  $0ab ; CRABRAWLER Ax6
	mon_cry CRY_KRABBY,     -$009,  $170 ; CRABOMINABLE Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ORICORIO PLACEHOLDER
	mon_cry CRY_PICHU,      -$03e,  $0fc ; CUTIEFLY Ax6
	mon_cry CRY_PICHU,      -$029,  $3a0 ; RIBOMBEE Ax6
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ROCKRUFF PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LYCANROC PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; WISHIWASHI PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MAREANIE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TOXAPEX PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MUDBRAY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MUDSDALE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DEWPIDER PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ARAQUANID PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FOMANTIS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LURANTIS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MORELULL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SHIINOTIC PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SALANDIT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SALAZZLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; STUFFUL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BEWEAR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BOUNSWEET PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; STEENEE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TSAREENA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; COMFEY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ORANGURU PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PASSIMIAN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; WIMPOD PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GOLISOPOD PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SANDYGAST PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PALOSSAND PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PYUKUMUKU PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TYPENULL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SILVALLY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MINIOR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KOMALA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TURTONATOR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TOGEDEMARU PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MIMIKYU PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BRUXISH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DRAMPA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DHELMISE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; JANGMO-O PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HAKAMO-O PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KOMMO-O PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TAPU_KOKO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TAPU_LELE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TAPU_BULU PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TAPU_FINI PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; COSMOG PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; COSMOEM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SOLGALEO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; LUNALA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; NIHILEGO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BUZZWOLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PHEROMOSA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; XURKITREE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CELESTEELA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KARTANA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GUZZLORD PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; NECROZMA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MAGEARNA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MARSHADOW PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; POIPOLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; NAGANADEL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; STAKATAKA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BLACEPHALON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ZERAORA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MELTAN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MELMETAL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GROOKEY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; THWACKEY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; RILLABOOM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SCORBUNNY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; RABOOT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CINDERACE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SOBBLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DRIZZILE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; INTELEON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SKWOVET PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GREEDENT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ROOKIDEE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CORVISQUIRE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CORVIKNIGHT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BLIPBUG PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DOTTLER PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ORBEETLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; NICKIT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; THIEVUL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GOSSIFLEUR PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ELDEGOSS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; WOOLOO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DUBWOOL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CHEWTLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DREDNAW PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; YAMPER PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BOLTUND PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ROLYCOLY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CARKOL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; COALOSSAL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; APPLIN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FLAPPLE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; APPLETUN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SILICOBRA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SANDACONDA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CRAMORANT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ARROKUDA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; BARRASKEWDA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TOXEL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; TOXTRICITY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SIZZLIPEDE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CENTISKORCH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CLOBBOPUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GRAPPLOCT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SINISTEA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; POLTEAGEIST PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HATENNA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HATTREM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; HATTERENE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; IMPIDIMP PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MORGREM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GRIMMSNARL PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; OBSTAGOON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PERRSERKER PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CURSOLA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SIRFETCHD PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MRRIME PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; RUNERIGUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MILCERY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ALCREMIE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FALINKS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; PINCURCHIN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SNOM PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; FROSMOTH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; STONJOURNER PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; EISCUE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; INDEEDEE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; MORPEKO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CUFANT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; COPPERAJAH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DRACOZOLT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ARCTOZOLT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DRACOVISH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ARCTOVISH PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DURALUDON PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DREEPY PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DRAKLOAK PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; DRAGAPULT PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ZACIAN PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ZAMAZENTA PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ETERNATUS PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; KUBFU PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; URSHIFU PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; ZARUDE PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; REGIELEKI PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; REGIDRAGO PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; GLASTRIER PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; SPECTRIER PLACEHOLDER
	mon_cry CRY_PIDGEY,      $0df,  $084 ; CALYREX PLACEHOLDER
