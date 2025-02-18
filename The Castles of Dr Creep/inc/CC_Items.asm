; ------------------------------------------------------------------------------------------------------------- ;
; The Castles of Dr Creep - Item and Room Item Data Maps
; ------------------------------------------------------------------------------------------------------------- ;
; Item Data Map
; ------------------------------------------------------------------------------------------------------------- ;
CC_ItemData                   = $00                    ; 
CC_ItemData_Header              = $00                  ;       header start
CC_ItemData_Header_Col            = $00                ;       number of column bytes per pixel row
CC_ItemData_Header_Row            = $01                ;       number ow pixel rows
CC_ItemData_Header_Att            = $02                ;       sprite attributes
CC_ItemData_Data                = $03                  ;       data start
; ------------------------------------------------------------------------------------------------------------- ;
; Room Item Header
; ------------------------------------------------------------------------------------------------------------- ;
CC_Room_ItemAdr               = $00                                   ; 
CC_Room_ItemAdr_Lo              = $00                                 ; 
CC_Room_ItemAdr_Lo_EoD            = $00                               ; Flag: end of room data
CC_Room_ItemAdr_Lo_Door           = <ItemDrawRoutineAdr.ItemAdr_03_08 ;       $03
CC_Room_ItemAdr_Lo_Floor          = <ItemDrawRoutineAdr.ItemAdr_06_08 ;       $06
CC_Room_ItemAdr_Lo_Pole           = <ItemDrawRoutineAdr.ItemAdr_09_08 ;       $09
CC_Room_ItemAdr_Lo_Ladder         = <ItemDrawRoutineAdr.ItemAdr_08_08 ;       $0c
CC_Room_ItemAdr_Lo_DoorBell       = <ItemDrawRoutineAdr.ItemAdr_0f_08 ;       $0f
CC_Room_ItemAdr_Lo_LightMach      = <ItemDrawRoutineAdr.ItemAdr_12_08 ;       $12
CC_Room_ItemAdr_Lo_ForceField     = <ItemDrawRoutineAdr.ItemAdr_15_08 ;       $15
CC_Room_ItemAdr_Lo_Mummy          = <ItemDrawRoutineAdr.ItemAdr_18_08 ;       $18
CC_Room_ItemAdr_Lo_Key            = <ItemDrawRoutineAdr.ItemAdr_1b_08 ;       $1b
CC_Room_ItemAdr_Lo_Lock           = <ItemDrawRoutineAdr.ItemAdr_1e_08 ;       $1e
CC_Room_ItemAdr_Lo_DrawObject     = <ItemDrawRoutineAdr.ItemAdr_21_08 ;       $21
CC_Room_ItemAdr_Lo_RayGun         = <ItemDrawRoutineAdr.ItemAdr_24_08 ;       $24
CC_Room_ItemAdr_Lo_Transmitter    = <ItemDrawRoutineAdr.ItemAdr_27_08 ;       $27
CC_Room_ItemAdr_Lo_TrapDoor       = <ItemDrawRoutineAdr.ItemAdr_2a_08 ;       $2a
CC_Room_ItemAdr_Lo_SideWalk       = <ItemDrawRoutineAdr.ItemAdr_2d_08 ;       $2d
CC_Room_ItemAdr_Lo_Frank          = <ItemDrawRoutineAdr.ItemAdr_30_08 ;       $30
CC_Room_ItemAdr_Lo_TextLine       = <ItemDrawRoutineAdr.ItemAdr_33_08 ;       $33
CC_Room_ItemAdr_Lo_Graphic        = <ItemDrawRoutineAdr.ItemAdr_36_08 ;       $36
CC_Room_ItemAdr_Hi              = $01                                 ; 
CC_Room_ItemAdr_Hi_EoD            = $00                               ; Flag: end of room data
CC_Room_ItemAdr_Hi_Adr            = >ItemDrawRoutineAdr               ;       $08
                              
CC_Room_ItemAdr_Len            = CC_Room_ItemAdr_Hi - CC_Room_ItemAdr + $01; 
; ------------------------------------------------------------------------------------------------------------- ;
; Room Item Data Maps
; ------------------------------------------------------------------------------------------------------------- ;
; Room - Room Description List entry at start of every loadate Castle Data file
; ------------------------------------------------------------------------------------------------------------- ;
CC_Room                       = $00                    ;  
CC_Room_Map_EoL                 = $40                  ; Flag: End of Room data list entries
CC_Room_Map_Status            = $00                    ; 
CC_Room_Map_Status_Color        = %00001111            ; Mask: room color bits
CC_Room_Map_Status_Visited      = %10000000            ; Flag: room will be painted on castle map
CC_Room_Map_PosX              = $01                    ;       top left corner on castle map
CC_Room_Map_PosY              = $02                    ; 
CC_Room_Map_Size              = $03                    ; Bits: ..xx xyyy - min 2*2  max 7*7
CC_Room_Map_Size_Width_Mask     = %00111000            ; 
CC_Room_Map_Size_Width_Min      = %00010000            ; 
CC_Room_Map_Size_Width_Max      = %00111000            ; 
CC_Room_Map_Size_Height_Mask    = %00000111            ; 
CC_Room_Map_Size_Height_Min     = %00000010            ; 
CC_Room_Map_Size_Height_Max     = %00000111            ; 
CC_Room_Ptr_DoorCount_Lo      = $04                    ; Ptr : address of CC_DoorCount - number of doors in room
CC_Room_Ptr_DoorCount_Hi      = $05                    ; 
CC_Room_Ptr_DoorID_Lo         = $06                    ; Ptr : CC_RoomItemID_Door ($0308)
CC_Room_Ptr_DoorID_Hi         = $07                    ; 
                              
CC_Room_Item_Len              = $08                    ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 03-08 - Door
; ------------------------------------------------------------------------------------------------------------- ;
CC_Door_Count                = $00                     ;       number of doors in room - counter start: 01 
; ------------------------------------------------------------------------------------------------------------- ;
; CC_DoorCount entries
; ------------------------------------------------------------------------------------------------------------- ;
CC_Door                      = $00                     ; 
CC_Door_PosX                   = $00                   ;       top left corner
CC_Door_PosY                   = $01                   ; 
CC_Door_MapWall                = $02                   ;       
CC_Door_MapWall_Open             = %10000000           ; Flag: Door Bell was pressed
CC_Door_MapWall_Mask             = %00000011           ; Mask: Door wall location
CC_Door_MapWall_North            = $00                 ; 
CC_Door_MapWall_East             = $01                 ; 
CC_Door_MapWall_South            = $02                 ; 
CC_Door_MapWall_West             = $03                 ; 
CC_Door_TargetRoomNum          = $03                   ;       counter start: entry 00 of ROOM list
CC_Door_TargetDoorNum          = $04                   ;       counter start: entry 00 of Room DOOR list
CC_Door_MapOffX                = $05                   ; 
CC_Door_MapOffY                = $06                   ; 
CC_Door_Type                   = $07                   ; 
CC_Door_Type_Normal              = $00                 ; 
CC_Door_Type_Exit                = $01                 ; 
                             
CC_Door_Item_Len             = $08                     ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 06-08 - Floor
; ------------------------------------------------------------------------------------------------------------- ;
CC_Floor                     = $00                     ; 
CC_Floor_Len                   = $00                   ;       counter start: 01
CC_Floor_EoD                     = $00                 ; Flag: end of data
CC_Floor_PosX                  = $01                   ;       top left corner
CC_Floor_PosY                  = $02                   ; 
                             
CC_Floor_Item_Len            = $03                     ;
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 09-08 - Pole
; ------------------------------------------------------------------------------------------------------------- ;
CC_Pole                      = $00                     ; 
CC_Pole_Len                    = $00                   ;       counter start: 01  end: 01 above ground
CC_Pole_EoD                      = $00                 ; Flag: end of data
CC_Pole_PosX                   = $01                   ;       top left corner
CC_Pole_PosY                   = $02                   ; 
                             
CC_Pole_Item_Len             = $03                     ;
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 0c-08 - Ladder
; ------------------------------------------------------------------------------------------------------------- ;
CC_Ladder                    = $00                     ; 
CC_Ladder_Len                  = $00                   ;       counter start: 01  end: directly on ground
CC_Ladder_EoD                    = $00                 ; Flag: end of data
CC_Ladder_PosX                 = $01                   ;       top left corner
CC_Ladder_PosY                 = $02                   ; 
                               
CC_Ladder_Item_Len             = $03                   ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 0f-08 - Door Bell
; ------------------------------------------------------------------------------------------------------------- ;
CC_BellCount                 = $00                     ;       number of bells in room - counter start: 01 
                             
CC_DoorBell                  = $00                     ; 
CC_BellPosX                    = $00                   ;       top left corner
CC_BellPosY                    = $01                   ; 
CC_BellTargetDoorNum           = $02                   ;       counter start: entry 00 of Room DOOR list
                               
CC_DoorBellItem_Len            = $03                   ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 12-08 - Lightning Machine
; ------------------------------------------------------------------------------------------------------------- ;
CC_LightMach                 = $00                     ;
CC_LightMach_EoD               = $20                   ; Flag: end of data
CC_LightMach_Mode            = $00                     ; 
CC_LightMach_Mode_Orb           = $00                  ;       sub entry is an orb
CC_LightMach_Mode_Orb_On        = $40                  ; 
CC_LightMach_Mode_Switch_Up     = $40                  ; 
CC_LightMach_Mode_Switch        = $80                  ;       sub entry is a switch
CC_LightMach_Switch          = $01                     ;       top left corner Switch
CC_LightMach_Switch_PosX       = $01                   ;       
CC_LightMach_Switch_PosY       = $02                   ; 
CC_LightMach_Pole            = $01                     ;       top left corner Pole
CC_LightMach_Pole_PosX         = $01                   ;       
CC_LightMach_Pole_PosY         = $02                   ; 
CC_LightMach_Pole_Len          = $03                   ;       start: 01  end: 05 above ground - $00 for switch
CC_LightMach_Switch_Orb      = $04                     ;       orb switch selection list (max $04) - all $00 for pole
CC_LightMach_Switch_Orb_1      = $04                   ;       relative offsets to orb data entry in lighning machine data
CC_LightMach_Switch_Orb_2      = $05                   ;       
CC_LightMach_Switch_Orb_3      = $06                   ; 
CC_LightMach_Switch_Orb_4      = $07                   ; 

CC_LightMach_Off_Orb_00        = $00 * CC_LightMachItem_Len ;  $00 - relative offsets in lighning machine data
CC_LightMach_Off_Orb_01        = $01 * CC_LightMachItem_Len ;  $08
CC_LightMach_Off_Orb_02        = $02 * CC_LightMachItem_Len ;  $10
CC_LightMach_Off_Orb_03        = $03 * CC_LightMachItem_Len ;  $18
CC_LightMach_Off_Orb_04        = $04 * CC_LightMachItem_Len ;  $20
CC_LightMach_Off_Orb_05        = $05 * CC_LightMachItem_Len ;  $28
CC_LightMach_Off_Orb_06        = $06 * CC_LightMachItem_Len ;  $30
CC_LightMach_Off_Orb_07        = $07 * CC_LightMachItem_Len ;  $38
CC_LightMach_Off_Orb_08        = $08 * CC_LightMachItem_Len ;  $40
CC_LightMach_Off_Orb_09        = $09 * CC_LightMachItem_Len ;  $48
CC_LightMach_Off_Orb_10        = $0a * CC_LightMachItem_Len ;  $50
CC_LightMach_Off_Orb_11        = $0b * CC_LightMachItem_Len ;  $58
CC_LightMach_Off_Orb_12        = $0c * CC_LightMachItem_Len ;  $60
CC_LightMach_Off_Orb_13        = $0d * CC_LightMachItem_Len ;  $68
CC_LightMach_Off_Orb_14        = $0e * CC_LightMachItem_Len ;  $70
CC_LightMach_Off_Orb_15        = $0f * CC_LightMachItem_Len ;  $78
CC_LightMach_Off_Orb_None     = $ff                         ;  no orb switched
                             
CC_LightMachItem_Len         = $08                     ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 15-08 - ForceField
; ------------------------------------------------------------------------------------------------------------- ;
CC_ForceField                  = $00                   ; 
CC_ForceField_EoD                = $00                 ; Flag: end of data
CC_ForceField_Switch_PosX      = $00                   ;       top left corner Switch
CC_ForceField_Switch_PosY      = $01                   ; 
CC_ForceField_Emitter_PosX     = $02                   ;       top left corner Emitter
CC_ForceField_Emitter_PosY     = $03                   ; 
                               
CC_ForceFieldItem_Len          = $04                   ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 18-08 - Mummy
; ------------------------------------------------------------------------------------------------------------- ;
CC_Mummy                       = $00                   ; 
CC_Mummy_EoD                     = $00                 ; Flag: end of data
CC_Mummy_Status                = $00                   ; 
CC_Mummy_Status_In               = $01                 ; 
CC_Mummy_Status_Out              = $02                 ; 
CC_Mummy_Status_Gone             = $03                 ; 
CC_Mummy_Status_Dead             = $04                 ; 
CC_Mummy_Ankh_PosX             = $01                   ;       top left corner Ankh
CC_Mummy_Ankh_PosY             = $02                   ; 
CC_Mummy_Tomb_PosX             = $03                   ;       top left corner Tomb Wall
CC_Mummy_Tomb_PosY             = $04                   ; 
CC_Mummy_Sprt_PosX             = $05                   ;       constantly updated during play
CC_Mummy_Sprt_PosY             = $06                   ;       constantly updated during play
                             
CC_MummyItem_Len               = $07                   ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 1b-08 - Key
; ------------------------------------------------------------------------------------------------------------- ;
CC_Key                         = $00                   ; 
CC_Key_EoD                       = $00                 ; Flag: end of data
CC_Key_Color                   = $00                   ;       relative offset of key work area
CC_Key_Color_White               = WHITE               ;       type1: size: 2*3 start: 03 above ground
CC_Key_Color_Red                 = RED                 ;       type2: size: 3*2 start: 02 or 03 above ground
CC_Key_Color_Cyan                = CYAN                ;       type1: size: 2*3 start: 03 above ground
CC_Key_Color_Purple              = PURPLE              ;       type2: size: 3*2 start: 02 or 03 above ground
CC_Key_Color_Green               = GREEN               ;       type2: size: 3*2 start: 02 or 03 above ground
CC_Key_Color_Blue                = BLUE                ;       type1: size: 2*3 start: 03 above ground
CC_Key_Color_Yellow              = YELLOW              ;       type2: size: 3*2 start: 02 or 03 above ground
CC_Key_Status                  = $01                   ; 
CC_Key_Status_Avail_No           = $00                 ;       key already taken
; ------------------------------------------------------------------------------------------------------------- ;
; item numbers of the different key colors in standard castle data
; ------------------------------------------------------------------------------------------------------------- ;
CC_Key_Status_Avail_White        = $50 | CC_Key_Color_White  ; type1: size: 2*3 start: 03 above ground
CC_Key_Status_Avail_Red          = $50 | CC_Key_Color_Red    ; type2: size: 3*2 start: 02 or 03 above ground
CC_Key_Status_Avail_Cyan         = $50 | CC_Key_Color_Cyan   ; type1: size: 2*3 start: 03 above ground
CC_Key_Status_Avail_Purple       = $50 | CC_Key_Color_Purple ; type2: size: 3*2 start: 02 or 03 above ground
CC_Key_Status_Avail_Green        = $50 | CC_Key_Color_Green  ; type2: size: 3*2 start: 02 or 03 above ground
CC_Key_Status_Avail_Blue         = $50 | CC_Key_Color_Blue   ; type1: size: 2*3 start: 03 above ground
CC_Key_Status_Avail_Yellow       = $50 | CC_Key_Color_Yellow ; type2: size: 3*2 start: 02 or 03 above ground
CC_Key_PosX                    = $02                   ;       top left corner
CC_Key_PosY                    = $03                   ; 
                               
CC_KeyItem_Len                 = $04                   ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 1e-08 - Lock
; ------------------------------------------------------------------------------------------------------------- ;
CC_Lock                        = $00                   ; 
CC_Lock_EoD                      = $00                 ; Flag: end of data
CC_Lock_Color                  = $00                   ;       
CC_Lock_Color_White              = CC_Key_Color_White  ;       
CC_Lock_Color_Red                = CC_Key_Color_Red    ;       
CC_Lock_Color_Cyan               = CC_Key_Color_Cyan   ;       
CC_Lock_Color_Purple             = CC_Key_Color_Purple ;       
CC_Lock_Color_Green              = CC_Key_Color_Green  ;       
CC_Lock_Color_Blue               = CC_Key_Color_Blue   ;       
CC_Lock_Color_Yellow             = CC_Key_Color_Yellow ;       
CC_Lock_Status                 = $01                   ;        not used - CC_WA_Item_Door_Status used instead
; ------------------------------------------------------------------------------------------------------------- ;
; item numbers of the different lock colors in standard castle data - not used
; ------------------------------------------------------------------------------------------------------------- ;
CC_Lock_Status_Locked_White      = $57 | CC_Lock_Color_White  ; 
CC_Lock_Status_Locked_Red        = $57 | CC_Lock_Color_Red    ; 
CC_Lock_Status_Locked_Cyan       = $57 | CC_Lock_Color_Cyan   ; 
CC_Lock_Status_Locked_Purple     = $57 | CC_Lock_Color_Purple ; 
CC_Lock_Status_Locked_Green      = $57 | CC_Lock_Color_Green  ; 
CC_Lock_Status_Locked_Blue       = $57 | CC_Lock_Color_Blue   ; 
CC_Lock_Status_Locked_Yellow     = $57 | CC_Lock_Color_Yellow ; 
CC_Lock_TargetDoorNum          = $02                   ;       counter start: entry 00 of rooms Door list
CC_Lock_PosX                   = $03                   ;       top left corner
CC_Lock_PosY                   = $04                   ; 
                               
CC_LockItem_Len                = $05                   ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 21-08 - DrawObject
; ------------------------------------------------------------------------------------------------------------- ;
CC_Graphic                     = $00                   ; 
CC_Graphic_EoD                   = $00                 ; Flag: end of data
CC_Graphic_Count               = $00                   ;       counter start: 01
CC_Graphic_ItemNum             = $01                   ;       item number to be drawn
CC_Graphic_PosX                = $02                   ;       top left corner Object
CC_Graphic_PosY                = $03                   ; 
CC_Graphic_Next_OffX           = $04                   ;       offset from top left corner if CC_ObjCount > $00
CC_Graphic_Next_OffY           = $05                   ; 
                               
CC_GraphicItem_Len             = $06                   ;
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 24-08 - RayGun
; ------------------------------------------------------------------------------------------------------------- ;
CC_Gun                         = $00                   ; 
CC_Gun_EoD                       = %10000000           ; flag: end of data
CC_Gun_Laser                   = $00                   ; 
CC_Gun_Laser_Dir_Ri              = %00000000           ; flag: $00 - laser head points right
CC_Gun_Laser_Dir_Le              = %00000001           ; flag: $01 - laser head points left
CC_Gun_Laser_Move_None           = %00000000           ; flag: $00 - initial value
CC_Gun_Laser_Move_Do             = %00000010           ; flag: $02 - laser moves down
CC_Gun_Laser_Move_Up             = %00000100           ; flag: $04 - laser moves up
CC_Gun_Laser_Move_Fire           = %00001000           ; flag: $08 - a player has pressed the fire button
CC_Gun_Laser_Move_Halt           = %00100000           ; flag: $20 - a player has stopped the laser
CC_Gun_Laser_Move_Fires          = %01000000           ; flag: $40 - active shot
CC_Gun_Pole_PosX               = $01                   ;       top left corner of Pole
CC_Gun_Pole_PosY               = $02                   ; 
CC_Gun_Pole_Len                = $03                   ; 
CC_Gun_Laser_PosY              = $04                   ;       ray gun laser position on pole
CC_Gun_Switch_PosX             = $05                   ;       top left corner of Switch
CC_Gun_Switch_PosY             = $06                   ; 
                                    
CC_GunItem_Len                 = $07                   ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 27-08 - MatterTranmitter
; ------------------------------------------------------------------------------------------------------------- ;
CC_Xmit                        = $00                   ; 
CC_Xmit_EoD                      = $00                 ; Flag: end of data
CC_Xmit_Booth                  = $00                   ;       
CC_Xmit_Booth_PosX               = $00                 ;       top left corner booth
CC_Xmit_Booth_PosY               = $01                 ; 
CC_Xmit_Booth_Color              = $02                 ;       booth color number
CC_Xmit_Booth_Color_Red            = RED     - $02     ;       $00
CC_Xmit_Booth_Color_Cyan           = CYAN    - $02     ;       $01
CC_Xmit_Booth_Color_Purple         = PURPLE  - $02     ;       $02
CC_Xmit_Booth_Color_Green          = GREEN   - $02     ;       $03
CC_Xmit_Booth_Color_Blue           = BLUE    - $02     ;       $04
CC_Xmit_Booth_Color_Yellow         = YELLOW  - $02     ;       $05
CC_Xmit_Booth_Color_Orange         = ORANGE  - $02     ;       $06
CC_Xmit_Booth_Color_Brown          = BROWN   - $02     ;       $07
CC_Xmit_Booth_Color_Lt_Red         = LT_RED  - $02     ;       $08
CC_Xmit_Booth_Color_DK_Grey        = DK_GREY - $02     ;       $09
                               
CC_Xmit_BoothItem_Len          = $03                   ;       
                               
CC_Xmit_Target                 = $00                   ;       receiver list start - min $01  max $09
CC_Xmit_Target_EoD                 = $00               ; Flag: end of receiver data
CC_Xmit_Target_PosX              = $03                 ;       
CC_Xmit_Target_PosY              = $04                 ; 
                               
CC_XmitTargetItem_Len          = $02                   ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 2a-08 - TrapDoor
; ------------------------------------------------------------------------------------------------------------- ;
CC_TrapDoor                    = $00                   ; 
CC_TrapDoor_EoD                  = %10000000           ; Flag: end of data
CC_TrapDoor_Mode               = $00                   ; 
CC_TrapDoor_Mode_Closed           = %00000000          ; Flag: door closed
CC_TrapDoor_Mode_Open             = %00000001          ; Flag: door open
CC_TrapDoor_PosX               = $01                   ;       top left corner of Door
CC_TrapDoor_PosY               = $02                   ; 
CC_TrapDoor_Switch_PosX        = $03                   ;       top left corner of Control
CC_TrapDoor_Switch_PosY        = $04                   ; 
                               
CC_TrapDoorItem_Len            = $05                   ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 2d-08 - MovingSideWalk
; ------------------------------------------------------------------------------------------------------------- ;
CC_SideWalk                    = $00                   ; 
CC_SideWalk_EoD                  = %10000000           ; Flag: end of data
CC_SideWalk_Mode               = $00                   ; 
CC_SideWalk_Mode_Stop            = %00000000           ; 
CC_SideWalk_Mode_Stop_Ri         = %00000000           ; 
CC_SideWalk_Mode_Stop_Le         = %00000010           ; 
CC_SideWalk_Mode_Move            = %00000001           ; 
CC_SideWalk_Mode_MoveDir         = %00000010           ; 
CC_SideWalk_Mode_Press_P1        = %00000100           ; Flag: player one pressed the walk switch
CC_SideWalk_Mode_Press_P2        = %00001000           ; Flag: player two pressed the walk switch
CC_SideWalk_Mode_Save_P1         = %00010000           ; Flag: save player one pressed control
CC_SideWalk_Mode_Save_P2         = %00100000           ; Flag: save player two pressed control
CC_SideWalk_PosX               = $01                   ;       top left corner Sidewalk
CC_SideWalk_PosY               = $02                   ; 
CC_SideWalk_Switch_PosX        = $03                   ;       top left corner Switch
CC_SideWalk_Switch_PosY        = $04                   ; 
                          
CC_SideWalkItem_Len            = $05                   ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 30-08 - Frankenstein
; ------------------------------------------------------------------------------------------------------------- ;
CC_Frank                       = $00                   ; 
CC_Frank_EoD                     = %10000000           ; Flag: end of data
CC_Frank_Coffin                = $00                   ; 
CC_Frank_Coffin_Dir              = %00000001           ; Flag:     - coffin open direction
CC_Frank_Coffin_Dir_Ri           = %00000000           ; Flag: $00 - coffin open to the right
CC_Frank_Coffin_Dir_Le           = %00000001           ; Flag: $01 - coffin open to the left
CC_Frank_Coffin_Empty            = %00000010           ; Flag: $02 - frankenstein has left his coffin
CC_Frank_Coffin_Dead             = %00000100           ; Flag: $04 - frankenstein is dead and gone
CC_Frank_Coffin_PosX           = $01                   ;       
CC_Frank_Coffin_PosY           = $02                   ; 
CC_Frank_Sprite_PosX           = $03                   ; 
CC_Frank_Sprite_PosY           = $04                   ; 
CC_Frank_Sprite_Num            = $05                   ; 
CC_Frank_CtrlTabOff            = $06                   ;       offset move control table
CC_Frank_CtrlTabOff_Ladder       = $00                 ;       Ladder   
CC_Frank_CtrlTabOff_FloorSta     = $02                 ;       FloorStart
CC_Frank_CtrlTabOff_LadderTop    = $04                 ;       LadderTop
CC_Frank_CtrlTabOff_FloorEnd     = $06                 ;       FloorEnd
                               
CC_FrankItem_Len               = $07                   ; 
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 33-08 - TextLine
; ------------------------------------------------------------------------------------------------------------- ;
CC_TextLine                    = $00                   ; 
CC_TextLine_EoD                  = $00                 ; Flag: EndOfData
CC_TextLine_EoL                  = %10000000           ; Flag: EndOfLine
CC_TextLine_PosX               = $00                   ; 
CC_TextLine_PosY               = $01                   ; 
CC_TextLine_Color              = $02                   ; 
CC_TextLine_Style              = $03                   ; 
CC_TextLine_Style_Height_Mask    = %00000011           ;       mask height part
CC_TextLine_Style_Height_Sng     = %00000001           ;       single   height
CC_TextLine_Style_Height_Dbl     = %00000010           ;       double   height
CC_TextLine_Style_Height_Tri     = %00000011           ;       triple   height
                                 
CC_TextLine_Style_Set_Mask       = %00110000           ;       mask charset
CC_TextLine_Style_Set_Norml      = %00100000           ;       normal   charset
CC_TextLine_Style_Set_Revrs      = %00110000           ;       reversed charset
;
CC_TextLineItem_Len             = $04                  ; 
;
CC_TextLine_Len_Max             = $14                  ;       text start - max 20 chrs per text line
; ------------------------------------------------------------------------------------------------------------- ;
; ItemAdr: 36-08 - Graphic
; ------------------------------------------------------------------------------------------------------------- ;
CC_ExitGfx                      = $00                  ; 
CC_ExitGfx_Hdr                    = $00                ; 
CC_ExitGfx_Hdr_Cols               = $00                ;       number of exit graphic part bytes per row
CC_ExitGfx_Hdr_Rows               = $01                ;       number of exit graphic part rows
CC_ExitGfx_Hdr_End                = $02                ;       end of exit graphic header
CC_ExitGfx_Hdr_End_EoD              = $00              ; Flag: end of graphic header data
                                  
CC_ExitGfx_Hdr_Len                = $03                ;
; ------------------------------------------------------------------------------------------------------------- ;
; variable amount of exit graphic part data bytes
; ------------------------------------------------------------------------------------------------------------- ;
CC_Exit_Gfx_Data_Start            = $04                ; CC_GfxCols * CC_GfxRows graphic part data bytes
; ------------------------------------------------------------------------------------------------------------- ;
; variable amount of exit graphic part data bytes - one byte for each 8*8 grid
; ------------------------------------------------------------------------------------------------------------- ;
; CC_Gfx_Color_HiRes              = $00 ; (((CC_GfxRows - 1) / 8) + 1) * CC_GfxCols video ram bytes
; CC_Gfx_Color_ColorRam           = $01 ; (((CC_GfxRows - 1) / 8) + 1) * CC_GfxCols color ram bytes
; ------------------------------------------------------------------------------------------------------------- ;
; variable amount of exit graphic part locations
; ------------------------------------------------------------------------------------------------------------- ;
CC_ExitGfx_Ptr_PosX               = $00                ;       top left corner of Graphic
CC_ExitGfx_Ptr_PosX_EoD             = %00000000        ; Flag: end of position list
CC_ExitGfx_Ptr_PosY               = $01                ; 
                                
CC_Exit_Gfx_Ptr_Len               = $02                ; 
; ------------------------------------------------------------------------------------------------------------- ;
