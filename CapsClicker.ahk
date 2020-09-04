; Jonas Vollhaase Mikkelsen, september 2020
; Contact: JM@TheMarketingGuy.dk
; Version 4
;
; Use capslock as a fifth modifier to provide extra functionality within windows
;

#SingleInstance force		; Cannot have multiple instances of program
#MaxHotkeysPerInterval 200	; Won't crash if button held down
;#NoTrayIcon					; App not visible in tray
#NoEnv						; Avoids checking empty variables to see if they are environment variables
#Persistent					; Script will stay running after auto-execute section completes 

SendMode Input
SetWorkingDir %A_ScriptDir% 
SetCapsLockState, AlwaysOff

; ######################################################################## Functionality ########################################################################

; Left Side Enter
CapsLock:: Send {Enter}

;terminate window, shut down, restart script, delete key
CapsLock & q:: !F4
CapsLock & Escape:: ControlSend, , !{F4}, ahk_class Progman ; shutdown dialogue

;Keyboard arrowkeys
CapsLock & h:: Left
CapsLock & j:: Down
CapsLock & k:: Up
CapsLock & l:: Right

;Vimlike bindings
CapsLock & a:: Send {end}
CapsLock & x:: Send {delete}
CapsLock & i:: Send {home}
CapsLock & u:: Send {PGUP}
CapsLock & d:: Send {PGDN}

;media
CapsLock & Insert:: Media_Play_Pause
CapsLock & Home:: Media_Next
CapsLock & PGUP:: Volume_Up
CapsLock & Delete:: Media_Stop
CapsLock & End:: Media_Prev
CapsLock & PGDN:: Volume_Down

; Chrome f6 fix, rwin to rclick
$F6::^l
RWin:: AppsKey

;Admin menu
CapsLock & 0::
MsgBox, 50, Restart or kill %A_ScriptName%, Press "Abort" to kill %A_ScriptName%`, `nPress "Retry" to restart %A_ScriptName%`nPress "Ignore" to do nothing
IfMsgBox Abort
	ExitApp

IfMsgBox Retry
	Reload
return

; ######################################################################## Functions ########################################################################

