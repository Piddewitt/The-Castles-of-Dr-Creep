; --------------------------------------------------------------------------------------------------------------------- ;
; Castles of Dr Creep - Zero Page Equates
; --------------------------------------------------------------------------------------------------------------------- ;
; VIC register save area
; --------------------------------------------------------------------------------------------------------------------- ;
CCZ_VIC_SPnX_Long           = $0010                         ; sprite PosX table
CCZ_VIC_SP0X                  = $10                         ; 
CCZ_VIC_SP1X                  = $11                         ; 
CCZ_VIC_SP2X                  = $12                         ; 
CCZ_VIC_SP3X                  = $13                         ; 
CCZ_VIC_SP4X                  = $14                         ; 
CCZ_VIC_SP5X                  = $15                         ; 
CCZ_VIC_SP6X                  = $16                         ; 
CCZ_VIC_SP7X                  = $17                         ; 
                            
CCZ_VIC_SPnY_Long           = $0018                         ; sprite PosY table
CCZ_VIC_SP0Y                  = $18                         ; 
CCZ_VIC_SP1Y                  = $19                         ; 
CCZ_VIC_SP2Y                  = $1a                         ; 
CCZ_VIC_SP3Y                  = $1b                         ; 
CCZ_VIC_SP4Y                  = $1c                         ; 
CCZ_VIC_SP5Y                  = $1d                         ; 
CCZ_VIC_SP6Y                  = $1e                         ; 
CCZ_VIC_SP7Y                  = $1f                         ; 
                            
CCZ_VIC_MSIGX               = $20                           ; sprite attributes
CCZ_VIC_SPENA               = $21                           ; 
CCZ_VIC_VMCSB               = $22                           ; 
CCZ_VIC_EXTCOL              = $23                           ; 
CCZ_VIC_SCROLX              = $25                           ; 
; --------------------------------------------------------------------------------------------------------------------- ;
; sprite pointers
; --------------------------------------------------------------------------------------------------------------------- ;
CCZ_TabSprtDataPtrs           = $26                         ; 
CCZ_TabSprtDataPtrs_Long      = $0026                       ; 
CCZ_TabSprtDataPtr_00           = $26                       ; 
CCZ_TabSprtDataPtr_01           = $27                       ; 
CCZ_TabSprtDataPtr_02           = $28                       ; 
CCZ_TabSprtDataPtr_03           = $29                       ; 
CCZ_TabSprtDataPtr_04           = $2a                       ; 
CCZ_TabSprtDataPtr_05           = $2b                       ; 
CCZ_TabSprtDataPtr_06           = $2c                       ; 
CCZ_TabSprtDataPtr_07           = $2d                       ; 
                              
CCZ_TabSprtDataPtrs_Len       = CCZ_TabSprtDataPtr_07 - CCZ_TabSprtDataPtr_00 ; 
; --------------------------------------------------------------------------------------------------------------------- ;
; data addresses
; --------------------------------------------------------------------------------------------------------------------- ;
CCZ_ExitGfxPosDataPtr_Lo    = $30                           ;       castle exit graphics parts
CCZ_ExitGfxPosDataPtr_Hi    = $31                           ; 
                            
CCZ_HiResScreenRowAdr_Lo    = $30                           ;       hires screen row
CCZ_HiResScreenRowAdr_Hi    = $31                           ; 
                            
CCZ_TextScreenRowAdr_Lo     = $30                           ;       text screen row
CCZ_TextScreenRowAdr_Hi     = $31                           ; 
                            
CCZ_SpritePosX_Lo           = $30                           ;       to caluculate the most significant bit of MSGIX
CCZ_SpritePosX_Hi           = $31                           ; 

CCZ_ExitGfxNumRows          = $32                           ;       castle exit graphics parts number of rows
                            
CCZ_LevelDataCountLast      = $34                           ;       copy data number of bytes in the last page
CCZ_LevelDataCountPage      = $35                           ;       copy data number of pages
                            
CCZ_HiReScreenGfxRowAdr_Lo  = $34                           ;       another hires screen row
CCZ_HiReScreenGfxRowAdr_Hi  = $35                           ; 

CCZ_Draw_T0_PosY_Top_Hi     = $38                           ;       for some reason here and not a table entry
                            
CCZ_Draw_T0_PosX_Start_Lo   = $38                           ;       for some reason here and not a table entry
CCZ_Draw_T0_PosX_Start_Hi   = $39                           ; 
                            
CCZ_CopyProtDataTabOff      = $fb                           ; off : to TabRoomCorrection
; --------------------------------------------------------------------------------------------------------------------- ;
; data pointers
; --------------------------------------------------------------------------------------------------------------------- ;
CCZ_IniMoveCtrlPtr          = $30                           ; ptr : init the move control memory
CCZ_IniMoveCtrlPtr_Lo         = $30                         ; 
CCZ_IniMoveCtrlPtr_Hi         = $31                         ; 
                            
CCZ_IniHiResScreenPtr       = $30                           ; ptr : init the HiRes screen
CCZ_IniHiResScreenPtr_Lo      = $30                         ; 
CCZ_IniHiResScreenPtr_Hi      = $31                         ; 
                            
CCZ_IniColorRamPtr          = $30                           ; ptr : init coloram
CCZ_IniColorRamPtr_Lo         = $30                         ; 
CCZ_IniColorRamPtr_Hi         = $31                         ; 
                            
CCZ_DirFileNameBufPtr       = $30                           ; ptr : buffer contaning the disk directory list
CCZ_DirFileNameBufPtr_Lo      = $30                         ; 
CCZ_DirFileNameBufPtr_Hi      = $31                         ; 
                            
CCZ_SaveFileSourcePtr       = $30                           ; ptr : start of save file source memory
CCZ_SaveFileSourcePtr_Lo      = $30                         ; 
CCZ_SaveFileSourcePtr_Hi      = $31                         ; 
                            
CCZ_DataCopySourcePtr       = $30                           ; ptr : copy castle data source
CCZ_DataCopySourcePtr_Lo      = $30                         ; 
CCZ_DataCopySourcePtr_Hi      = $31                         ; 
                            
CCZ_MusicDataSourcePtr      = $30                           ; ptr : copy music data source
CCZ_MusicDataSourcePtr_Lo     = $30                         ; 
CCZ_MusicDataSourcePtr_Hi     = $31                         ; 
                            
CCZ_CastleTimePtr           = $30                           ; ptr : castle escape time in castles data variables area
CCZ_CastleTimePtr_Lo          = $30                         ; 
CCZ_CastleTimePtr_Hi          = $31                         ; 
                            
CCZ_SpriteDataSourcePtr     = $30                           ; ptr : sprite source data for the selected sprite
CCZ_SpriteDataSourcePtr_Lo    = $30                         ; 
CCZ_SpriteDataSourcePtr_Hi    = $31                         ; 
                            
CCZ_CopyDataTargetPtr       = $30                           ; ptr : copy Sound Effect data to GameMenuScreenInit to free memory for CC_GameDataBuf
CCZ_CopyDataTargetPtr_Lo      = $30                         ; 
CCZ_CopyDataTargetPtr_Hi      = $31                         ; 
                            
CCZ_HiResColor_RowPtr       = $30                           ; ptr : HiRes multi color screen
CCZ_HiResColor_RowPtr_Lo      = $30                         ; 
CCZ_HiResColor_RowPtr_Hi      = $31                         ; 
                            
CCZ_ItemDataPtr             = $30                           ; ptr : data to draw or delete the selected item
CCZ_ItemDataPtr_Lo            = $30                         ; 
CCZ_ItemDataPtr_Hi            = $31                         ; 
                            
CCZ_ItemCharPtr             = $30                           ; ptr : char data of the selected CHAR ROM
CCZ_ItemCharPtr_Lo            = $30                         ; 
CCZ_ItemCharPtr_Hi            = $31                         ; 
                            
CCZ_ItemCharColorPtr        = $30                           ; ptr : char item colors
CCZ_ItemCharColorPtr_Lo       = $30                         ; 
CCZ_ItemCharColorPtr_Hi       = $31                         ; 
                            
CCZ_KeyCollectBufPtr        = $30                           ; ptr : list of picked keys memory in castls data variales area
CCZ_KeyCollectBufPtr_Lo       = $30                         ; 
CCZ_KeyCollectBufPtr_Hi       = $31                         ; 
                            
CCZ_MenuScrnEntryPtr        = $30                           ; ptr : selected game menu entry
CCZ_MenuScrnEntryPtr_Lo       = $30                         ; 
CCZ_MenuScrnEntryPtr_Hi       = $31                         ; 
                            
CCZ_PlayerTimeSourcePtr     = $30                           ; ptr : copy player castle escape time source
CCZ_PlayerTimeSourcePtr_Lo    = $30                         ; 
CCZ_PlayerTimeSourcePtr_Hi    = $31                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
CCZ_PlayerTimeTargetPtr     = $32                           ; ptr : copy player castle escape time target
CCZ_PlayerTimeTargetPtr_Lo    = $32                         ; 
CCZ_PlayerTimeTargetPtr_Hi    = $33                         ; 
                            
CCZ_MenuScrnFileNamePtr     = $32                           ; ptr : selected game menu file name
CCZ_MenuScrnFileNamePtr_Lo    = $32                         ; 
CCZ_MenuScrnFileNamePtr_Hi    = $33                         ; 
                            
CCZ_ItemData_T0_Ptr         = $32                           ; ptr : draw item data
CCZ_ItemData_T0_Ptr_Lo        = $32                         ; 
CCZ_ItemData_T0_Ptr_Hi        = $33                         ; 
                            
CCZ_SpriteDataTargetPtr     = $32                           ; ptr : sprite target data for the selected sprite
CCZ_SpriteDataTargetPtr_Lo    = $32                         ; 
CCZ_SpriteDataTargetPtr_Hi    = $33                         ; 
                            
CCZ_CopyDataSourcePtr       = $32                           ; ptr : copy Sound Effect data to GameMenuScreenInit to free memory for CC_GameDataBuf
CCZ_CopyDataSourcePtr_Lo      = $32                         ; 
CCZ_CopyDataSourcePtr_Hi      = $33                         ; 
                            
CCZ_DataCopyTargetPtr       = $32                           ; ptr : copy castle data target
CCZ_DataCopyTargetPtr_Lo      = $32                         ; 
CCZ_DataCopyTargetPtr_Hi      = $33                         ; 
                            
CCZ_MusicDataTargetPtr      = $32                           ; ptr : copy music data target
CCZ_MusicDataTargetPtr_Lo     = $32                         ; 
CCZ_MusicDataTargetPtr_Hi     = $33                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
CCZ_HiReScreenGfxAdr        = $36                           ; ptr : draw item hires screen row
CCZ_HiReScreenGfxAdr_Lo       = $36                         ; 
CCZ_HiReScreenGfxAdr_Hi       = $37                         ; 

CCZ_SprtDataAdrTabPtr       = $38                           ; ptr : table containing the addresses of item and sprite data
CCZ_SprtDataAdrTabPtr_Lo      = $38                         ; 
CCZ_SprtDataAdrTabPtr_Hi      = $39                         ; 
                            
CCZ_ItemDataAdrTabPtr       = $38                           ; ptr : item data
CCZ_ItemDataAdrTabPtr_Lo      = $38                         ; 
CCZ_ItemDataAdrTabPtr_Hi      = $39                         ; 
                            
CCZ_MoveCtrlDataPtr         = $3c                           ; ptr : move contral data
CCZ_MoveCtrlDataPtr_Lo        = $3c                         ; 
CCZ_MoveCtrlDataPtr_Hi        = $3d                         ; 
                            
CCZ_DrawItemDataPtr         = $3e                           ; ptr : draw item data
CCZ_DrawItemDataPtr_Lo        = $3e                         ; 
CCZ_DrawItemDataPtr_Hi        = $3f                         ; 
                            
CCZ_TabTextMenuPtr          = $3e                           ; ptr : game menu screen text entries
CCZ_TabTextMenuPtr_Lo         = $3e                         ; 
CCZ_TabTextMenuPtr_Hi         = $3f                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
CCZ_LightSwitchDataPtr      = $30                           ; ptr : lightnig machine switch data
CCZ_LightSwitchDataPtr_Lo     = $30                         ; 
CCZ_LightSwitchDataPtr_Hi     = $31                         ; 
                            
CCZ_LightOrbDataPtr         = $32                           ; ptr : lightnig machine orb data
CCZ_LightOrbDataPtr_Lo        = $32                         ; 
CCZ_LightOrbDataPtr_Hi        = $33                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
CCZ_ItemMiscDataPtr         = $40                           ; ptr : misc sprite data in castle data
CCZ_ItemMiscDataPtr_Lo        = $40                         ; 
CCZ_ItemMiscDataPtr_Hi        = $41                         ; 
                            
CCZ_DoorDataPtr             = $40                           ; ptr : door data in castle data
CCZ_DoorDataPtr_Lo            = $40                         ; 
CCZ_DoorDataPtr_Hi            = $41                         ; 
                            
CCZ_LightPoleDataPtr        = $40                           ; ptr : lightnig machine pole data in castle data
CCZ_LightPoleDataPtr_Lo       = $40                         ; 
CCZ_LightPoleDataPtr_Hi       = $41                         ; 
                            
CCZ_MummyDataPtr            = $40                           ; ptr : mummy data in castle data
CCZ_MummyDataPtr_Lo           = $40                         ; 
CCZ_MummyDataPtr_Hi           = $41                         ; 
                            
CCZ_KeyDataPtr              = $40                           ; ptr : key data in castle data
CCZ_KeyDataPtr_Lo             = $40                         ; 
CCZ_KeyDataPtr_Hi             = $41                         ; 
                            
CCZ_RayGunDataPtr           = $40                           ; ptr : ray gun data in castle data
CCZ_RayGunDataPtr_Lo          = $40                         ; 
CCZ_RayGunDataPtr_Hi          = $41                         ; 
                            
CCZ_XmitterDataPtr          = $40                           ; ptr : matter xmitter data in castle data
CCZ_XmitterDataPtr_Lo         = $40                         ; 
CCZ_XmitterDataPtr_Hi         = $41                         ; 
                            
CCZ_TrapDataPtr             = $40                           ; ptr : trap door data in castle data
CCZ_TrapDataPtr_Lo            = $40                         ; 
CCZ_TrapDataPtr_Hi            = $41                         ; 
                            
CCZ_FrankDataPtr            = $40                           ; ptr : frankenstein data in castle data
CCZ_FrankDataPtr_Lo           = $40                         ; 
CCZ_FrankDataPtr_Hi           = $41                         ; 
                            
CCZ_WalkDataPtr             = $40                           ; ptr : moving sidewalk data in castle data
CCZ_WalkDataPtr_Lo            = $40                         ; 
CCZ_WalkDataPtr_Hi            = $41                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
CCZ_RoomListDataPtr         = $42                           ; ptr : room description list at start of castle data
CCZ_RoomListDataPtr_Lo        = $42                         ; 
CCZ_RoomListDataPtr_Hi        = $43                         ; 
                            
CCZ_SoundDataPtr            = $44                           ; ptr : music or sound effect data
CCZ_SoundDataPtr_Lo            = $44                        ; 
CCZ_SoundDataPtr_Hi            = $45                        ; 
                            
CCZ_SidVoiceRegsBasePtr     = $46                           ; ptr : SID voices base address
CCZ_SidVoiceRegsBasePtr_Lo    = $46                         ; 
CCZ_SidVoiceRegsBasePtr_Hi    = $47                         ; 
                            
CCZ_SidValVoicePtr          = $48                           ; ptr : SID voices work values
CCZ_SidValVoicePtr_Lo         = $48                         ; 
CCZ_SidValVoicePtr_Hi         = $49                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
