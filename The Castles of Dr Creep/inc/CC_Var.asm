; --------------------------------------------------------------------------------------------------------------------- ;
; Castles of Dr Creep - In game variables
; --------------------------------------------------------------------------------------------------------------------- ;
; memory layout
; ------------------------------------------------------------------------------------------------------------- ;
CC_MemScreenMenu            = $0400 ; - $07e8: Video Screen 1 - Displays Game Options and Castle Load File Names
CC_MemGameCode              = $0800 ; - $77ff: Game Code - Initial load up to 7919
CC_MemGameLevelDataBuf      = $7800 ; - $97ff: Game Level Data (modified during game)
CC_MemDemoMusicDataBuf      = $7800 ; - $97ff: Game Demo Music - Overwrites CC_MemGameLevelDataBuf
CC_MemLoadLevelDataBuf      = $9800 ; - $b7ff: Game Level Data Loaded From Disk (unmodified)
CC_MemGameBestTimesBuf      = $b800 ; - $b8ff: Castle Escape Times for a ONE and a TWO players game
; ------------------------------------------------------------------------------------------------------------- ;
CC_MemUnused                = $b900 ; - $b9ff: not used
; ------------------------------------------------------------------------------------------------------------- ;
CC_Mem_WA_GameMenu          = $ba00 ; - $baff: Work Area Game Options and Castle Load Screen selection row
CC_MemScreenGfxRowPtr_Hi    = $bb00 ; - $bbff: Pointer HiRes Screen Rows: High
CC_MemScreenGfxRowPtr_Lo    = $bc00 ; - $bcff: Pointer HiRes Screen Rows: Low
CC_Mem_WA                   = $bd00 ; - $beff: Work Areas
CC_Mem_WA_Sprite            = $bd00 ; - $bdff: Work Area Sprite           - $08 Blocks of $20 Bytes
CC_Mem_WA_Item              = $be00 ; - $beff: Work Area Item Status      - $20 Blocks of $08 Bytes
CC_Mem_WA_ItemWork          = $bf00 ; - $bfff: Work Area Item Description - $20 Blocks of $08 Bytes
CC_MemRoomMoveCtrl          = $c000 ; - $c7ff: Room Move Control Memory - Floors / Ladders / Poles
CC_MemSpriteDataBuf_1       = $c800 ; - $c9ff: Sprite Data Buffer 1
CC_MemSpriteDataBuf_2       = $ca00 ; - $cbff: Sprite Data Buffer 2
CC_MemScreenMultiColors     = $cc00 ; - $cfe8: Video Screen 2 - Holds Color Values for Multicolour HiRes Screen
CC_MemSpriteDataPtrs        = $cff8 ; - $cfff: Sprites Data Pointer
CC_MemScreenGfxDisplay      = $e000 ; - $fff9: Multicolour HiRes Screen - $fffa=start of system hardware vector area (SHV)
; ------------------------------------------------------------------------------------------------------------- ;
; game control tables
; ------------------------------------------------------------------------------------------------------------- ;
; Game Data - Accessed and modified during play             ; ($7800-$97ff)
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataBuf              = CC_MemGameLevelDataBuf        ;       actual level data modified during play
; ------------------------------------------------------------------------------------------------------------- ;
; Game Data variables part                                  ; ($7800-$78ff)
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar              = CC_GameDataBuf                ; 
CC_GameDataVar_Count_Last     = CC_GameDataVar + $00        ;       number of bytes in last page (counter start: $01)
CC_GameDataVar_Count_Page     = CC_GameDataVar + $01        ;       number of pages - max: 20    (whole data must fit into 7800-97ff)
; ------------------------------------------------------------------------------------------------------------- ;
; Game Status Flag
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar_Game           = CC_GameDataVar + $02        ; flag: show castle escape picture
CC_GameDataVar_Game_ExitPic     = %10000000                 ; 
CC_GameDataVar_Game_Resume      = %00000001                 ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Player Start Room Numbers
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar_StartRoom      = CC_GameDataVar + $03        ;       start room number
CC_GameDataVar_StartRoom_P1     = CC_GameDataVar + $03      ;       player 1 - count start: entry 00 of ROOM list
CC_GameDataVar_StartRoom_P2     = CC_GameDataVar + $04      ;       player 2 - count start: entry 00 of ROOM list
CC_GameDataVar_StartDoor      = CC_GameDataVar + $05        ;       start door number in start room
CC_GameDataVar_StartDoor_P1     = CC_GameDataVar + $05      ;       player 1 - count start: entry 00 of Room DOOR list
CC_GameDataVar_StartDoor_P2     = CC_GameDataVar + $06      ;       player 2 - count start: entry 00 of Room DOOR list
; ------------------------------------------------------------------------------------------------------------- ;
; Player Number of Lives
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar_NumLives       = CC_GameDataVar + $07        ;       number of lives left - 00=dead
CC_GameDataVar_NumLives_P1      = CC_GameDataVar + $07      ;       player1
CC_GameDataVar_NumLives_P2      = CC_GameDataVar + $08      ;       player2
; ------------------------------------------------------------------------------------------------------------- ;
; Player Target Room Numbers
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar_TargRoom       = CC_GameDataVar + $09        ;       target room number
CC_GameDataVar_TargRoom_P1      = CC_GameDataVar + $09      ;       player 1 - count start: entry 00 of ROOM list
CC_GameDataVar_TargRoom_P2      = CC_GameDataVar + $0a      ;       player 2 - count start: entry 00 of ROOM list
; ------------------------------------------------------------------------------------------------------------- ;
; Player Target Door Numbers of Target Room
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar_TargDoor       = CC_GameDataVar + $0b        ;       target door number in target room
CC_GameDataVar_TargDoor_P1      = CC_GameDataVar + $0b      ;       player 1 - count start: entry 00 of Room DOOR list
CC_GameDataVar_TargDoor_P2      = CC_GameDataVar + $0c      ;       player 2 - count start: entry 00 of Room DOOR list
; ------------------------------------------------------------------------------------------------------------- ;
; Player Status Flag
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar_Flag           = CC_GameDataVar + $0d        ; flag: players in game action status
CC_GameDataVar_Flag_P1          = CC_GameDataVar + $0d      ;       player 1
CC_GameDataVar_Flag_P2          = CC_GameDataVar + $0e      ;       player 2
CC_GameDataVar_Flag_InRoom        = $00                     ;       player has arrived in this room
CC_GameDataVar_Flag_Hit           = $02                     ;       something really bad happened in the room
CC_GameDataVar_Flag_Inactive      = $04                     ;       this coward does not take part in the game
CC_GameDataVar_Flag_IO_Room       = $05                     ;       ongoing room In/Out
CC_GameDataVar_Flag_IO_Start      = $06                     ;       start room In/Out through an open door
; ------------------------------------------------------------------------------------------------------------- ;
; Player Health
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar_Health         = CC_GameDataVar + $0f        ; flag: health - 00=dead  01=alive
CC_GameDataVar_Health_P1        = CC_GameDataVar + $0f      ;       player 1
CC_GameDataVar_Health_P2        = CC_GameDataVar + $10      ;       player 2
CC_GameDataVar_Health_Dead        = $00                     ; 
CC_GameDataVar_Health_Alive       = $01                     ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Player Participation
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar_Active         = CC_GameDataVar + $11        ; flag: player pressed fire at start of the game
CC_GameDataVar_Active_P1        = CC_GameDataVar + $11      ;       player 1
CC_GameDataVar_Active_P2        = CC_GameDataVar + $12      ;       player 2
CC_GameDataVar_Active_No          = $00                     ; 
CC_GameDataVar_Active_Yes         = $01                     ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Player Number of Collected Keys
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar_Keys_Got_P1    = CC_GameDataVar + $13        ;       number of keys picked up - count start: 01
CC_GameDataVar_Keys_Got_P2    = CC_GameDataVar + $14        ;       number of keys picked up - count start: 01
; ------------------------------------------------------------------------------------------------------------- ;
; Player Buffer of Collected Keys
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar_Keys_Buf       = CC_GameDataVar + $15        ;       keys are stored unsorted as they were collected
CC_GameDataVar_Keys_Buf_P1      = CC_GameDataVar + $15      ;         $18 entries ($781c-$7834) unused
CC_GameDataVar_Keys_Buf_P2      = CC_GameDataVar + $35      ;         $20 entries ($783c-$785c) unused
CC_GameDataVar_Keys_Buf_Len   = $07                         ;       max entries for each player
; ------------------------------------------------------------------------------------------------------------- ;
; Player Game Times
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar_Times          = CC_GameDataVar + $55        ;       castle escape times (BCD encoded)
CC_GameDataVar_Times_P1         = CC_GameDataVar + $55      ;       values for player #1
CC_GameDataVar_Times_P1_Mil       = CC_GameDataVar + $55    ;       milliseconds
CC_GameDataVar_Times_P1_Sec       = CC_GameDataVar + $56    ;       seconds
CC_GameDataVar_Times_P1_Min       = CC_GameDataVar + $57    ;       minutes
CC_GameDataVar_Times_P1_Hrs       = CC_GameDataVar + $58    ;       hours
CC_GameDataVar_Times_P2         = CC_GameDataVar + $59      ;       values for player #2
CC_GameDataVar_Times_P2_Mil       = CC_GameDataVar + $59    ;       milliseconds
CC_GameDataVar_Times_P2_Sec       = CC_GameDataVar + $5a    ;       seconds
CC_GameDataVar_Times_P2_Min       = CC_GameDataVar + $5b    ;       minutes
CC_GameDataVar_Times_P2_Hrs       = CC_GameDataVar + $5c    ;       hours
CC_GameDataVar_Times_Len      = CC_GameDataVar_Times_P2_Hrs - CC_GameDataVar_Times ; length of the whole time block
; ------------------------------------------------------------------------------------------------------------- ;
; Player Position
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar_Exit           = CC_GameDataVar + $5d        ; flag: player exited the castle
CC_GameDataVar_Exit_Yes         = $01                       ; 
CC_GameDataVar_Exit_No          = $00                       ; 
CC_GameDataVar_Exit_P1        = CC_GameDataVar + $5d        ; 
CC_GameDataVar_Exit_P2        = CC_GameDataVar + $5e        ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Escape Picture ID Pointer
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameDataVar_ExitPicPtr     = CC_GameDataVar + $5f        ; Ptr:  points to (36/08) entry of level data
CC_GameDataVar_ExitPicPtr_Lo    = CC_GameDataVar + $5f      ; 
CC_GameDataVar_ExitPicPtr_Hi    = CC_GameDataVar + $60      ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Game Data Area                                            ;       ($7900-.... no fix end but max $97ff)
; ------------------------------------------------------------------------------------------------------------- ;
; Room Definition List Entry - $08 bytes for each room      ;       
; ------------------------------------------------------------------------------------------------------------- ;
CC_GameData_Room             = CC_GameDataBuf + $100        ;       
CC_GameData_RoomStatus       = CC_GameData_Room + $00       ;       room flag and color
CC_GameData_RoomStatus_Color   = %00001110                  ; flag: end of room data
CC_GameData_RoomStatus_EoD     = %01000000                  ; flag: end of room data
CC_GameData_RoomStatus_Visit   = %10000000                  ; flag: room visited
CC_GameData_RoomMapPosX      = CC_GameData_Room + $01       ;       room map PosX
CC_GameData_RoomMapPosY      = CC_GameData_Room + $02       ;       room map PosY
CC_GameData_RoomMapSize      = CC_GameData_Room + $03       ;       room size coded bits: --XX.Xyyy (min=2*2 max=7*7)
CC_GameData_RoomDoorCount_Lo = CC_GameData_Room + $04       ; ptr : number of Doors in ROOM
CC_GameData_RoomDoorCount_Hi = CC_GameData_Room + $05       ; ptr : number of Doors in ROOM
CC_GameData_RoomDoorID_Lo    = CC_GameData_Room + $06       ; ptr : ID of DOOR (03/08)
CC_GameData_RoomDoorID_Hi    = CC_GameData_Room + $07       ; ptr : ID of DOOR (03/08)
CC_GameData_Room_Len         = $08                          ;       
; ------------------------------------------------------------------------------------------------------------- ;
; Demo Music
; ------------------------------------------------------------------------------------------------------------- ;
CC_DemoMusicData            = CC_MemDemoMusicDataBuf        ; 
CC_DemoMusicData_CountLast  = CC_DemoMusicData + $00        ;       number of bytes in last page (counter start: $01)
CC_DemoMusicData_CountPages = CC_DemoMusicData + $01        ;       number of pages - max: 20    (whole data must fit into 7800-97ff)
CC_DemoMusicData_Start      = CC_DemoMusicData + $02        ;       start of music data
; ------------------------------------------------------------------------------------------------------------- ;
; Original Castle Data - Kept unmodified for restart        ;       ($9800-$b7ff)
; ------------------------------------------------------------------------------------------------------------- ;
CC_LoadDataBuf              = CC_MemLoadLevelDataBuf        ; 
CC_LoadDataBuf_CountLast      = CC_LoadDataBuf + $00        ;       number of bytes in last page (counter start: $01)
CC_LoadDataBuf_CountPages     = CC_LoadDataBuf + $01        ;       number of pages - max: 20    (whole data must fit into 9800-99ff)
CC_LoadDataBuf_Room           = CC_LoadDataBuf + $100       ;       start of room data definitions
; ------------------------------------------------------------------------------------------------------------- ;
; Work Areas                                                ;       ($b800-$bfff)
; ------------------------------------------------------------------------------------------------------------- ;
; Castle Escape Time Leaderboard entries                    ;       ($b800-$b8ff)
; ------------------------------------------------------------------------------------------------------------- ;
CC_TimeDataBuf              = CC_MemGameBestTimesBuf        ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Castle Escape Time Constants
; ------------------------------------------------------------------------------------------------------------- ;
CC_TimeData_EoT             = $ff                           ; flag: end of best times
CC_TimeData_Entry_Max       = $0a                           ;       max number of time entries
CC_TimeData_Entry_Len       = $06                           ;       time entry length
CC_TimeData_Entry_Len_ID      = $03                         ;       time entry ID length
CC_TimeData_Entry_Len_Time    = $03                         ;       time entry time length
                            
CC_TimeData_P1_Block_Off    = $00                           ;       start offset time entries ONE players game
CC_TimeData_P2_Block_Off    = CC_TimeData_P1_Block_Off + CC_TimeData_Entry_Len * CC_TimeData_Entry_Max ; start offset time entries TWO players game
CC_TimeData_WA_Block_Off    = CC_TimeData_P2_Block_Off + CC_TimeData_Entry_Len * CC_TimeData_Entry_Max ; start offset time entry work area
; ------------------------------------------------------------------------------------------------------------- ;
; Castle Escape Time Header - Use count                     ; $b800-$b801
; ------------------------------------------------------------------------------------------------------------- ;
CC_TimeData_Count_Last     = CC_TimeDataBuf + $00           ;       number of bytes in last page
CC_TimeData_Count_Page     = CC_TimeDataBuf + $01           ;       number of pages
CC_TimeData_Count_Page_Max   = $00                          ; 
CC_TimeData_Count_Last_Max   = CC_TimeData_Entry_Len * CC_TimeData_Entry_Max * $02 + $02 ; $7a = offset EndOfBestTimesData
; ------------------------------------------------------------------------------------------------------------- ;
; Castle Escape Time ONE player game - max 10 entries       ; $b802-$b83d
; ------------------------------------------------------------------------------------------------------------- ;
CC_TimeData_One_ID          = CC_TimeDataBuf + $02          ;       3 chr initials
CC_TimeData_One_ID_Chr_1      = CC_TimeData_One_ID + $00    ;       
CC_TimeData_One_ID_Chr_2      = CC_TimeData_One_ID + $01    ;       
CC_TimeData_One_ID_Chr_3      = CC_TimeData_One_ID + $02    ;       
CC_TimeData_One_Time        = CC_TimeData_One_ID + $03      ;       bcd encoded castle escape time
CC_TimeData_One_Time_Sec      = CC_TimeData_One_Time + $00  ;       seconds
CC_TimeData_One_Time_Min      = CC_TimeData_One_Time + $01  ;       minutes
CC_TimeData_One_Time_Hrs      = CC_TimeData_One_Time + $02  ;       hours
; ------------------------------------------------------------------------------------------------------------- ;
; Castle Escape Time TWO players game - max 10 entries      ; $b83e-$b8a1
; ------------------------------------------------------------------------------------------------------------- ;
CC_TimeData_Two_ID          = CC_TimeData_One_ID + (CC_TimeData_Entry_Max * CC_TimeData_Entry_Len) ; 3 chr initials
CC_TimeData_Two_ID_Chr_1      = CC_TimeData_Two_ID + $00    ;       
CC_TimeData_Two_ID_Chr_2      = CC_TimeData_Two_ID + $01    ;       
CC_TimeData_Two_ID_Chr_3      = CC_TimeData_Two_ID + $02    ;       
CC_TimeData_Two_Time        = CC_TimeData_Two_ID + $03      ;       bcd encoded castle escape time
CC_TimeData_Two_Time_Sec      = CC_TimeData_Two_Time + $00  ;       seconds
CC_TimeData_Two_Time_Min      = CC_TimeData_Two_Time + $01  ;       minutes
CC_TimeData_Two_Time_Hrs      = CC_TimeData_Two_Time + $02  ;       hours
; ------------------------------------------------------------------------------------------------------------- ;
; Castle Escape Time work area                              ; $b8a2-$b888
; ------------------------------------------------------------------------------------------------------------- ;
CC_TimeData_WA              = CC_TimeDataBuf + CC_TimeData_Count_Last_Max ; 
CC_TimeData_WA_Id             = CC_TimeData_WA              ; 
CC_TimeData_WA_Id_Chr_1         = CC_TimeData_WA_Id  + $00  ; 
CC_TimeData_WA_Id_Chr_2         = CC_TimeData_WA_Id  + $01  ; 
CC_TimeData_WA_Id_Chr_3         = CC_TimeData_WA_Id  + $02  ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Castle Escape Time work area for top ten color - max 10   ; $b889-$b893
; ------------------------------------------------------------------------------------------------------------- ;
CC_TimeData_WA_ColorsOff    = CC_TimeData_WA_Id + $0f       ;       color table offset for output ID
; ------------------------------------------------------------------------------------------------------------- ;
; Room Move Control data - Floors / Ladders / Poles         ; $c000-$c7ff
; ------------------------------------------------------------------------------------------------------------- ;
CC_MoveCtrl                 = CC_MemRoomMoveCtrl            ;       castle room move control data
CC_MoveCtrl_Up                = %00000001                   ;       $01 - ladder      - only allowed to move down
CC_MoveCtrl_Bit1              = %00000010                   ;       $02 - 
CC_MoveCtrl_Right             = %00000100                   ;       $04 - floor       - only allowed to move right
CC_MoveCtrl_Bit3              = %00001000                   ;       $08 - 
CC_MoveCtrl_Down              = %00010000                   ;       $10 - ladder/pole - only allowed to move down
CC_MoveCtrl_Bit5              = %00100000                   ;       $20 - 
CC_MoveCtrl_Left              = %01000000                   ;       $40 - floor       - only allowed to move left
CC_MoveCtrl_Bit7              = %10000000                   ;       $80 - 
CC_MoveCtrl_Entry_Len       = $02                           ;       move control data entry length
CC_MoveCtrl_Len             = $0400 * CC_MoveCtrl_Entry_Len ;       move memory length
; ------------------------------------------------------------------------------------------------------------- ;
; For a ladder (up/do) or a floor (le/ri) the corresponding control data bytes have to be combined
; ------------------------------------------------------------------------------------------------------------- ;
CC_MoveCtrl_Le_Ri             = CC_MoveCtrl_Left | CC_MoveCtrl_Right ; $44 - floor
CC_MoveCtrl_Up_Do             = CC_MoveCtrl_Up   | CC_MoveCtrl_Down  ; $11 - ladder
; ------------------------------------------------------------------------------------------------------------- ;
; Screen memory locations
; ------------------------------------------------------------------------------------------------------------- ;
CC_ScreenMenu               = CC_MemScreenMenu              ;       Options/LoadData screen         $0400-$07ff
CC_ScreenMultiColors        = CC_MemScreenMultiColors       ;       HiRes colors screen             $cc00-$cfe8
CC_ScreenGfxDisplay         = CC_MemScreenGfxDisplay        ;       Hires draw screen               $e000-$fff9
; ------------------------------------------------------------------------------------------------------------- ;
; HiRes row pointer table
; ------------------------------------------------------------------------------------------------------------- ;
CC_ScreenGfxRowPtr_Hi       = CC_MemScreenGfxRowPtr_Hi      ;       pointer hires screen row high   $bb00-$bbff
CC_ScreenGfxRowPtr_Lo       = CC_MemScreenGfxRowPtr_Lo      ;       pointer hires screen row low    $bc00-$bcff
; ------------------------------------------------------------------------------------------------------------- ;
; Game Menu Work Area - max $40 entries of $04 bytes        ; $ba00-$baff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_GameMenu                 = CC_Mem_WA_GameMenu         ; 
CC_WA_GameMenu_Col               = CC_WA_GameMenu + $00     ;       start column
CC_WA_GameMenu_Col_Le              = $03                    ;       start column of left  text screen output area
CC_WA_GameMenu_Col_Ri              = $16                    ;       start column of right text screen output area
CC_WA_GameMenu_Row               = CC_WA_GameMenu + $01     ;       screen row number
CC_WA_GameMenu_Row_Dyn_Top         = $0c                    ;       first row dynamically filled data file names
CC_WA_GameMenu_Row_Dyn_Bot         = $18                    ;       last  row dynamically filled data file names
CC_WA_GameMenu_Type              = CC_WA_GameMenu + $02     ;       menu entry type id
CC_WA_GameMenu_Type_Lives          = $00                    ;       lives on/off
CC_WA_GameMenu_Type_Exit           = $01                    ;       exit menu
CC_WA_GameMenu_Type_File           = $02                    ;       dynamic castle data file entry
CC_WA_GameMenu_Type_Resume         = $03                    ;       resume a saved game
CC_WA_GameMenu_Type_Times          = $04                    ;       view high scores
CC_WA_GameMenu_Type_Text           = $ff                    ;       info text entry
CC_WA_GameMenu_File_Len          = CC_WA_GameMenu + $03     ;       castle data file name length
CC_WA_GameMenu_File_Len_Max        = DIR_FILE_NAME_LEN      ;       castle data file name length max length
                               
CC_WA_GameMenu_Len             = $04                        ; 
; --------------------------------------------------------------------------------------------------------------------- ;
; Game header of menu screen text entries (TabTextMenu)
; --------------------------------------------------------------------------------------------------------------------- ;
CC_TextMenu_Hdr                = $00                        ; 
CC_TextMenu_Hdr_Pos              = CC_TextMenu_Hdr   + $00  ; 
CC_TextMenu_Hdr_Pos_Col            = CC_TextMenu_Hdr + $00  ; 
CC_TextMenu_Hdr_Pos_Row            = CC_TextMenu_Hdr + $01  ; 
CC_TextMenu_Hdr_Type             = CC_TextMenu_Hdr   + $02  ; 
CC_TextMenu_Hdr_Len            = $03                        ; 
; --------------------------------------------------------------------------------------------------------------------- ;
; Sprite Work Area - max $08 blocks of $20 bytes            ; $bd00-$bdff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Sprite                = CC_Mem_WA_Sprite              ;       sprites - max $08 blocks of $20 bytes
CC_WA_Sprite_Type             = CC_WA_Sprite + $00          ; 
CC_WA_Sprite_Type_Player        = $00                       ;       a player
CC_WA_Sprite_Type_Spark         = $01                       ;       a lightning machine spark
CC_WA_Sprite_Type_Force         = $02                       ;       a force field
CC_WA_Sprite_Type_Mummy         = $03                       ;       a mummy
CC_WA_Sprite_Type_Beam          = $04                       ;       a ray gun beam
CC_WA_Sprite_Type_Frank         = $05                       ;       a frankenstein
CC_WA_Sprite_PosX             = CC_WA_Sprite + $01          ; 
CC_WA_Sprite_PosY             = CC_WA_Sprite + $02          ; 
CC_WA_Sprite_Num              = CC_WA_Sprite + $03          ; 
CC_WA_Sprite_Flag             = CC_WA_Sprite + $04          ; 
CC_WA_Sprite_Flag_WA_Free       = %00000001                 ; flag: $01 - WA not used
CC_WA_Sprite_Flag_Coll_Mask     = %00000110                 ; flag:     - sprite collision bit mask
CC_WA_Sprite_Flag_Coll_Sprt     = %00000010                 ; flag: $02 - sprite-sprite     collision
CC_WA_Sprite_Flag_Coll_Back     = %00000100                 ; flag: $04 - sprite-background collision
CC_WA_Sprite_Flag_Disable       = %00001000                 ; flag: $08 - sprite to be disabled in CastleRoomSpriteHandler
CC_WA_Sprite_Flag_Moves         = %00010000                 ; flag: $10 - sprite to be moved    in CastleRoomSpriteHandler
CC_WA_Sprite_Flag_Dies          = %00100000                 ; flag: $20 - sprite active death animation
CC_WA_Sprite_Flag_Dead          = %01000000                 ; flag: $40 - sprite is dead
CC_WA_Sprite_Flag_WA_Init       = %10000000                 ; flag: $80 - sprite work area initialized and read to use
CC_WA_Sprite_SeqNum_Sav       = CC_WA_Sprite + $05          ;       sprite sequence number before death
CC_WA_Sprite_SeqNum           = CC_WA_Sprite + $06          ;       sprite sequence number
CC_WA_Sprite_DeathSfxTone     = CC_WA_Sprite + $08          ;       death tune sound phase
CC_WA_Sprite_Attr             = CC_WA_Sprite + $09          ;     
CC_WA_Sprite_Attr_Color         = %00001111                 ;       Bit3-0: Color 0
CC_WA_Sprite_Attr_MColor        = %00010000                 ;       Bit4  : MultiColor
CC_WA_Sprite_Attr_PrioBG        = %00100000                 ;       Bit5  : Spr/BG-Prio
CC_WA_Sprite_Attr_ExpandY       = %01000000                 ;       Bit6  : Y-expand
CC_WA_Sprite_Attr_ExpandX       = %10000000                 ;       Bit7  : X-expand
CC_WA_Sprite_Cols             = CC_WA_Sprite + $0a          ; 
CC_WA_Sprite_Rows             = CC_WA_Sprite + $0b          ; 
CC_WA_Sprite_Width            = CC_WA_Sprite + $0c          ;       
CC_WA_Sprite_Height           = CC_WA_Sprite + $0d          ;       
; --------------------------------------------------------- ; ------------------------------------------------- ;
CC_WA_Sprite_Unused_0e        = CC_WA_Sprite + $0e          ;       free
CC_WA_Sprite_Unused_0f        = CC_WA_Sprite + $0f          ;       free
CC_WA_Sprite_Unused_10        = CC_WA_Sprite + $10          ;       free
CC_WA_Sprite_Unused_11        = CC_WA_Sprite + $11          ;       free
CC_WA_Sprite_Unused_12        = CC_WA_Sprite + $12          ;       free
CC_WA_Sprite_Unused_13        = CC_WA_Sprite + $13          ;       free
CC_WA_Sprite_Unused_14        = CC_WA_Sprite + $14          ;       free
CC_WA_Sprite_Unused_15        = CC_WA_Sprite + $15          ;       free
CC_WA_Sprite_Unused_16        = CC_WA_Sprite + $16          ;       free
CC_WA_Sprite_Unused_17        = CC_WA_Sprite + $17          ;       free
CC_WA_Sprite_Len            = $20                           ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Multi Purpose Area                                        ; Work: Different content
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Sprite_Player_Move_No   = CC_WA_Sprite + $18          ;       special stop move control value for occupied ladders and poles
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Sprite_WA_Wrk           = CC_WA_Sprite + $19          ;       copy of CC_WA_Sprite_WA_Obj which is set to $ff
CC_WA_Sprite_Player_SwDataOff = CC_WA_Sprite + $19          ;       offset this player sprite work area
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Sprite_TrapSw_DataOff   = CC_WA_Sprite + $1a          ;       trap castle data offset if a trap switch was touched
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Sprite_RoomIO_Block_Off = CC_WA_Sprite + $1b          ;       offset TabPlayerRoomInOut block
                              
CC_WA_Sprite_Mummy_WA_Off     = CC_WA_Sprite + $1b          ;       offset this mummy sprite work area
CC_WA_Sprite_Frank_SwDataOff  = CC_WA_Sprite + $1b          ;       offset this frankenstein sprite work area
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Sprite_PlayerNum        = CC_WA_Sprite + $1c          ;       player number

CC_WA_Sprite_Player_CtrlVal   = CC_WA_Sprite + $1c          ;       player move control value
CC_WA_Sprite_Frank_CtrlVal    = CC_WA_Sprite + $1c          ;       frankenstein move control value
                              
CC_WA_Sprite_MummyStatus      = CC_WA_Sprite + $1c          ;       mummy
CC_WA_Sprite_Mummy_SwDataOff  = CC_WA_Sprite + $1c          ;       offset Trap in castle data
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Sprite_Mummy_DataOff    = CC_WA_Sprite + $1d          ;       offset Mummy in castle data
                              
CC_WA_Sprite_Frank_CtrlTabOff = CC_WA_Sprite + $1d          ;       this frankenstein control bit table offset
                              
CC_WA_Sprite_FireButton       = CC_WA_Sprite + $1d          ; 
CC_WA_Sprite_FireButton_No      = $00                       ; 
CC_WA_Sprite_FireButton_Yes     = $01                       ; 
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Sprite_Move_Subst       = CC_WA_Sprite + $1e          ;       players joystick move direction
CC_WA_Sprite_Move_Subst_Up      = TabJoy_Move_Subst_U       ;       $00 - Up  
CC_WA_Sprite_Move_Subst_UR      = TabJoy_Move_Subst_UR      ;       $01 - Up/right  
CC_WA_Sprite_Move_Subst_R       = TabJoy_Move_Subst_R       ;       $02 - Right     
CC_WA_Sprite_Move_Subst_DR      = TabJoy_Move_Subst_DR      ;       $03 - Down/right
CC_WA_Sprite_Move_Subst_D       = TabJoy_Move_Subst_D       ;       $04 - Down
CC_WA_Sprite_Move_Subst_DL      = TabJoy_Move_Subst_DL      ;       $05 - Down/left
CC_WA_Sprite_Move_Subst_L       = TabJoy_Move_Subst_L       ;       $06 - Left     
CC_WA_Sprite_Move_Subst_UL      = TabJoy_Move_Subst_UL      ;       $07 - Up/left  
CC_WA_Sprite_Move_Subst_None    = TabJoy_Move_Subst_None    ;       $80 - no move or illegal
                              
CC_WA_Sprite_Force_Mode       = CC_WA_Sprite + $1e          ; 
CC_WA_Sprite_Force_Mode_Shut    = $00                       ; 
CC_WA_Sprite_Force_Mode_Open    = $01                       ; 
                              
CC_WA_Sprite_Mummy_Mode       = CC_WA_Sprite + $1e          ; 
CC_WA_Sprite_Mummy_Mode_In      = $00                       ;       
CC_WA_Sprite_Mummy_Mode_Out     = $01                       ;       
CC_WA_Sprite_Mummy_Mode_Dead    = $03                       ;       
                              
CC_WA_Sprite_Gun_DataOff      = CC_WA_Sprite + $1e          ;       offset this ray gun in castle data
                              
CC_WA_Sprite_Frank_Mode       = CC_WA_Sprite + $1e          ;       
CC_WA_Sprite_Frank_Mode_In      = $00                       ;       
CC_WA_Sprite_Frank_Mode_Awake   = $02                       ;       
CC_WA_Sprite_Frank_Mode_Dead    = $04                       ;       
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Sprite_Light_DataOff    = CC_WA_Sprite + $1f          ;       offset this lightning machine in castle data
CC_WA_Sprite_Frank_DataOff    = CC_WA_Sprite + $1f          ;       offset this frankenstein in castle data
                            
CC_WA_Sprite_Mummy_BirthStep  = CC_WA_Sprite + $1f          ;       
                              
CC_WA_Sprite_Beam_ShootStep   = CC_WA_Sprite + $1f          ;       actual laser beam shoot step left/right
                              
CC_WA_Sprite_Force_Num        = CC_WA_Sprite + $1f          ; 
                              
CC_WA_Sprite_Player_Move      = CC_WA_Sprite + $1f          ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Room Item Description Work Area - max $20 blocks of $08 bytes ; $bf00-$bfff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_ItemDef               = CC_Mem_WA_ItemWork            ; 
CC_WA_ItemDef_Type            = CC_WA_ItemDef + $00         ; 
CC_WA_ItemDef_Type_Door         = $00                       ;       Door
CC_WA_ItemDef_Type_Bell         = $01                       ;       Door Bell
CC_WA_ItemDef_Type_LightOrb     = $02                       ;       Lightning Machine Orb
CC_WA_ItemDef_Type_LightCtrl    = $03                       ;       Lightning Machine Switch
CC_WA_ItemDef_Type_ForceField   = $04                       ;       Force Field
CC_WA_ItemDef_Type_Mummy        = $05                       ;       Mummy
CC_WA_ItemDef_Type_Key          = $06                       ;       Key
CC_WA_ItemDef_Type_Lock         = $07                       ;       Lock
CC_WA_ItemDef_Type_Gun          = $08                       ;       Ray Gun Phaser
CC_WA_ItemDef_Type_GunCtrl      = $09                       ;       Ray Gun Switch
CC_WA_ItemDef_Type_Xmit         = $0a                       ;       Matter Transmitter Booth Color Change Hot Spot
CC_WA_ItemDef_Type_TrapDoor     = $0b                       ;       Trap Door
CC_WA_ItemDef_Type_TrapCtrl     = $0c                       ;       Trap Door Switch
CC_WA_ItemDef_Type_Walk         = $0d                       ;       Moving Sidewalk
CC_WA_ItemDef_Type_WalkCtrl     = $0e                       ;       Moving Sidewalk Switch
CC_WA_ItemDef_Type_Frank        = $0f                       ;       Frankenstein
CC_WA_ItemDef_PosX            = CC_WA_ItemDef + $01         ; 
CC_WA_ItemDef_PosY            = CC_WA_ItemDef + $02         ; 
CC_WA_ItemDef_ItemNum         = CC_WA_ItemDef + $03         ; 
CC_WA_ItemDef_Status          = CC_WA_ItemDef + $04         ; 
CC_WA_ItemDef_Status_Gone       = %00100000                 ; flag: $20 - item not available anymore
CC_WA_ItemDef_Status_Ready      = %01000000                 ; flag: $40 - ready to be dispatched in RoomItemMoveHandler
CC_WA_ItemDef_Status_Init       = %10000000                 ; flag: $80 - initialized but inactive
CC_WA_ItemDef_Width           = CC_WA_ItemDef + $05         ; 
CC_WA_ItemDef_Rows            = CC_WA_ItemDef + $06         ; 
CC_WA_ItemDef_NotUsed         = CC_WA_ItemDef + $07         ;       fill up to CC_WA_ItemDef_Len
CC_WA_ItemDef_Len           = $08                           ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Room Item Work Areas - max $20 blocks of $08 bytes        ; $be00-$beff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Item                  = CC_Mem_WA_Item                ; 
CC_WA_Item_Len              = $08                           ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Door - All work areas start with the doors                ; $be00-$beff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Item_Door               = CC_WA_Item   + $00          ; 
CC_WA_Item_Door_Num             = CC_WA_Item + $00          ;       door number starting with $00
CC_WA_Item_Door_Status          = CC_WA_Item + $01          ; Flag: door status
CC_WA_Item_Door_Status_Shut       = $00                     ; 
CC_WA_Item_Door_Status_Open       = $01                     ; 
CC_WA_Item_Door_GrateLift       = CC_WA_Item + $02          ;       grate lifting process counter
CC_WA_Item_Door_GrateLift_Ini     = $0e                     ;       
CC_WA_Item_Door_TargColor       = CC_WA_Item + $03          ;       target room color
                                
CC_WA_Item_Door_UnUsed_4        = CC_WA_Item + $04          ; 
CC_WA_Item_Door_UnUsed_5        = CC_WA_Item + $05          ; 
CC_WA_Item_Door_UnUsed_6        = CC_WA_Item + $06          ; 
CC_WA_Item_Door_UnUsed_7        = CC_WA_Item + $07          ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Door Bell                                                 ; $be00-$beff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Item_Bell               = CC_WA_Item   + $00          ; 
CC_WA_Item_Bell_Door_Num        = CC_WA_Item_Bell + $00     ;       target door number starting with $00
                                
CC_WA_Item_Bell_UnUsed_1        = CC_WA_Item_Bell + $01     ; 
CC_WA_Item_Bell_UnUsed_2        = CC_WA_Item_Bell + $02     ; 
CC_WA_Item_Bell_UnUsed_3        = CC_WA_Item_Bell + $03     ; 
CC_WA_Item_Bell_UnUsed_4        = CC_WA_Item_Bell + $04     ; 
CC_WA_Item_Bell_UnUsed_5        = CC_WA_Item_Bell + $05     ; 
CC_WA_Item_Bell_UnUsed_6        = CC_WA_Item_Bell + $06     ; 
CC_WA_Item_Bell_UnUsed_7        = CC_WA_Item_Bell + $07     ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Lightning Machine                                         ; $be00-$beff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Item_Light              = CC_WA_Item   + $00          ; 
CC_WA_Item_Light_Orb_DataOff    = CC_WA_Item + $00          ;       offset this lightning machine orb in castle data
CC_WA_Item_Light_Sprt_Init      = CC_WA_Item + $01          ; 
CC_WA_Item_Light_Sprt_Init_Yes    = $01                     ; 
CC_WA_Item_Light_Sprt_Init_No     = $00                     ; 
CC_WA_Item_Light_Pole_Step      = CC_WA_Item + $02          ;       active pole color step
CC_WA_Item_Light_Pole_Len       = CC_WA_Item + $03          ; 

CC_WA_Item_Light_UnUsed_4       = CC_WA_Item + $04          ; 
CC_WA_Item_Light_UnUsed_5       = CC_WA_Item + $05          ; 
CC_WA_Item_Light_UnUsed_6       = CC_WA_Item + $06          ; 
CC_WA_Item_Light_UnUsed_7       = CC_WA_Item + $07          ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Force Field                                               ; $be00-$beff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_ItemForce_Num             = CC_WA_Item + $00          ; 
CC_WA_ItemForce_PingTime        = CC_WA_Item + $01          ;       time between two pings
CC_WA_ItemForce_PingTime_Ini      = $1e                     ;       
CC_WA_ItemForce_CloseStep       = CC_WA_Item + $02          ;       counter closing steps
                                
CC_WA_Item_Force_UnUsed_3       = CC_WA_Item + $03          ; 
CC_WA_Item_Force_UnUsed_4       = CC_WA_Item + $04          ; 
CC_WA_Item_Force_UnUsed_5       = CC_WA_Item + $05          ; 
CC_WA_Item_Force_UnUsed_6       = CC_WA_Item + $06          ; 
CC_WA_Item_Force_UnUsed_7       = CC_WA_Item + $07          ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Mummy                                                     ; $be00-$beff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Item_Mummy_DataOff        = CC_WA_Item + $00          ; 
CC_WA_Item_Mummy_AnkhTimer      = CC_WA_Item + $01          ; 
CC_WA_Item_Mummy_AnkhTimer_Ini    = $08                     ;             
CC_WA_Item_Mummy_Ankh_Color     = CC_WA_Item + $02          ; 
                                
CC_WA_Item_Mummy_UnUsed_3       = CC_WA_Item + $03          ; 
CC_WA_Item_Mummy_UnUsed_4       = CC_WA_Item + $04          ; 
CC_WA_Item_Mummy_UnUsed_5       = CC_WA_Item + $05          ; 
CC_WA_Item_Mummy_UnUsed_6       = CC_WA_Item + $06          ; 
CC_WA_Item_Mummy_UnUsed_7       = CC_WA_Item + $07          ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Key                                                       ; $be00-$beff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Item_Key_DataOff          = CC_WA_Item + $00          ;       offset this key in castle data
                                
CC_WA_Item_Key_UnUsed_1         = CC_WA_Item + $01          ; 
CC_WA_Item_Key_UnUsed_2         = CC_WA_Item + $02          ; 
CC_WA_Item_Key_UnUsed_3         = CC_WA_Item + $03          ; 
CC_WA_Item_Key_UnUsed_4         = CC_WA_Item + $04          ; 
CC_WA_Item_Key_UnUsed_5         = CC_WA_Item + $05          ; 
CC_WA_Item_Key_UnUsed_6         = CC_WA_Item + $06          ; 
CC_WA_Item_Key_UnUsed_7         = CC_WA_Item + $07          ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Lock                                                      ; $be00-$beff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Item_Lock_Color           = CC_WA_Item + $00          ; 
CC_WA_Item_Lock_Door_Num        = CC_WA_Item + $01          ; 
                                
CC_WA_Item_Lock_UnUsed_2        = CC_WA_Item + $02          ; 
CC_WA_Item_Lock_UnUsed_3        = CC_WA_Item + $03          ; 
CC_WA_Item_Lock_UnUsed_4        = CC_WA_Item + $04          ; 
CC_WA_Item_Lock_UnUsed_5        = CC_WA_Item + $05          ; 
CC_WA_Item_Lock_UnUsed_6        = CC_WA_Item + $06          ; 
CC_WA_Item_Lock_UnUsed_7        = CC_WA_Item + $07          ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Ray Gun                                                   ; $be00-$beff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Item_Gun_DataOff          = CC_WA_Item + $00          ;      offset this ray gun in castle data
CC_WA_Item_Gun_Laser_EndY       = CC_WA_Item + $01          ;      max position down on the pole for the ray gun
                                
CC_WA_Item_Gun_UnUsed_1         = CC_WA_Item + $01          ; 
CC_WA_Item_Gun_UnUsed_2         = CC_WA_Item + $02          ; 
CC_WA_Item_Gun_UnUsed_3         = CC_WA_Item + $03          ; 
CC_WA_Item_Gun_UnUsed_4         = CC_WA_Item + $04          ; 
CC_WA_Item_Gun_UnUsed_5         = CC_WA_Item + $05          ; 
CC_WA_Item_Gun_UnUsed_6         = CC_WA_Item + $06          ; 
CC_WA_Item_Gun_UnUsed_7         = CC_WA_Item + $07          ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Matter Transmitter                                        ; $be00-$beff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Item_Xmit_Hdr             = CC_WA_Item + $00          ; 
CC_WA_Item_Xmit_Ptr_Lo            = CC_WA_Item + $00        ; 
CC_WA_Item_Xmit_Ptr_Hi            = CC_WA_Item + $01        ; 
CC_WA_Item_Xmit_Color             = CC_WA_Item + $02        ; 
CC_WA_Item_Xmit_FlashTime         = CC_WA_Item + $03        ; 
CC_WA_Item_Xmit_FlashTime_Ini       = $08                   ; 
CC_WA_Item_Xmit_Target          = CC_WA_Item + $00          ; 
CC_WA_Item_Xmit_Target_PosX       = CC_WA_Item + $04        ; 
CC_WA_Item_Xmit_Target_PosY       = CC_WA_Item + $05        ; 
                                
CC_WA_Item_Xmit_UnUsed_6        = CC_WA_Item + $06          ; 
CC_WA_Item_Xmit_UnUsed_7        = CC_WA_Item + $07          ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Trap Door                                                 ; $be00-$beff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Item_Trap_DataOff         = CC_WA_Item + $00          ;       offset this trap door in castle data
CC_WA_Item_Trap_Status          = CC_WA_Item + $01          ; 
CC_WA_Item_Trap_Status_Open       = $00                     ; 
CC_WA_Item_Trap_Status_Closed     = $01                     ; 
CC_WA_Item_Trap_PhaseNum        = CC_WA_Item + $02          ;       actual trap door open/close step item number
                                
CC_WA_Item_Trap_UnUsed_3        = CC_WA_Item + $03          ; 
CC_WA_Item_Trap_UnUsed_4        = CC_WA_Item + $04          ; 
CC_WA_Item_Trap_UnUsed_5        = CC_WA_Item + $05          ; 
CC_WA_Item_Trap_UnUsed_6        = CC_WA_Item + $06          ; 
CC_WA_Item_Trap_UnUsed_7        = CC_WA_Item + $07          ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Moving Sidewalk                                           ; $be00-$beff
; ------------------------------------------------------------------------------------------------------------- ;
CC_WA_Item_Walk_DataOff         = CC_WA_Item + $00          ;       offset this side walk in castle data
                                
CC_WA_Item_Walk_UnUsed_1        = CC_WA_Item + $01          ; 
CC_WA_Item_Walk_UnUsed_2        = CC_WA_Item + $02          ; 
CC_WA_Item_Walk_UnUsed_3        = CC_WA_Item + $03          ; 
CC_WA_Item_Walk_UnUsed_4        = CC_WA_Item + $04          ; 
CC_WA_Item_Walk_UnUsed_5        = CC_WA_Item + $05          ; 
CC_WA_Item_Walk_UnUsed_6        = CC_WA_Item + $06          ; 
CC_WA_Item_Walk_UnUsed_7        = CC_WA_Item + $07          ; 
; ------------------------------------------------------------------------------------------------------------- ;
; sprite data buffers
; ------------------------------------------------------------------------------------------------------------- ;
CC_SpriteDataBuf_1              = CC_MemSpriteDataBuf_1     ; $c800-$c9ff
CC_SpriteDataBuf_2              = CC_MemSpriteDataBuf_2     ; $ca00-$cbff
; ------------------------------------------------------------------------------------------------------------- ;
; misc variables
; ------------------------------------------------------------------------------------------------------------- ;
CC_DiskRead                     = $01 ; flag: read  from disk
CC_DiskWrite                    = $02 ; flag: write to   disk
; ------------------------------------------------------------------------------------------------------------- ;
; copy protection bad room item jump addresses
; ------------------------------------------------------------------------------------------------------------- ;
DrawDoor_Bad                    = $730c ; 
DrawFloor_Bad                   = $246a ; 
DrawPole_Bad                    = $2047 ; 
DrawBell_Bad                    = $752a ; 
; ------------------------------------------------------------------------------------------------------------- ;
RoomItemDataMapping            .include "CC_Items.asm"      ; Castle Room Item Data Maps
; ------------------------------------------------------------------------------------------------------------- ;
