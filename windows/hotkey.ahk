﻿#InstallKeybdHook

Capslock::Ctrl
return

; to make "Shift + Ctrl" work properly with capslock
+CapsLock::+Ctrl
Return

; Ctrl + CapsLock toggle prevention
^CapsLock::Ctrl
Return

; Win + Capslock toggle prevention
<#CapsLock::

; Always on Top
;^SPACE:: Winset, Alwaysontop, , A ; ctrl + space
;Return

; window key to powertoys
;LWin Up::Send, !{Space}

; map ` to esc, but keep +` as ~
`::Escape
Escape::`
+Escape::Send, ~
^`::^`

; ctrl shift esc
^+Escape::^+Escape
^+`::^+Escape

; arrow keys
<#j::Send, {Down} ; left window + j
<#k::Send, {Up}
<#h::Send, {Left}
<#l::Send, {Right}

; ctrl + arrowkeys
^#j::Send, ^{Down}
^#l::Send, ^{Right}
^#h::Send, ^{Left}
^#k::Send, ^{Up}

RControl::Capslock

; ctrl + ; for end
^;::Send, {End}

; Mouse click
#space:: MouseClick

^#SPACE::
	WinGetActiveStats, Title, Width, Height, X, Y
	MPosX := (Width - 50)
	MPosY := (350)
	MouseMove, %MPosX%, %MPosY%
	MouseClick
return

; Alt+q to Alt + F4
;!q::Send, !{F4}
!q::WinClose, A

; show desktop
;https://autohotkey.com/board/topic/150310-1-hotkey-to-activate-and-minimize-windows/
!a::
WinGetClass, var, A
If (var="WorkerW" || var="Shell_TrayWnd") ; I get WorkerW if I use the #d shortcut, but ShellTrayWnd if I use this hotkey
{
WinGet, myList, list
Loop %myList%
WinRestore, % "ahk_id " myList%A_Index% ; this is the trickiest step to understand
}
else
WinMinimize, A
return

; Toggle window maximize, restore
!s::
WinGet MMX, MinMax, A
IfEqual MMX, 0, WinMaximize, A
IfEqual MMX, 1, WinRestore, A
return

#If not WinActive("ahk_exe Code.exe")
; Volume control
F12::Send {Volume_Up}
F11::Send {Volume_Down}
F10::Send {Volume_Mute}
AppsKey & F12::Send {F12}
AppsKey & F11::Send {F11}
AppsKey & F10::Send {F10}
AppsKey::Send, {AppsKey}
return

; Programs
; Explorer
!w::Run, Explorer /n`,/e`,

; Web browser
!e::Run, msedge.exe
!f::Run, firefox.exe

; Terminal
!1::Run, wt

; Everything
#o::Run, C:\Program Files\Everything\Everything.exe

;; Customize depending on opened window
;; Use status icon right click spy to probe opened programs

;Chrome and Firefox and explorer
#If WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe firefox.exe") || WinActive("ahk_exe explorer.exe") || WinActive("ahk_exe msedge.exe") || WinActive("ahk_exe brave.exe")

; Scroll up (alt k)
!k::Send, {WheelUp 1}

; Scroll down (alt j)
!j::Send, {WheelDown 1}

; Go back
!h::Send, !{Left}

; Go forward
!l::Send, !{Right}
#IfWinActive

; Cmder (paste): shift + ctrl + v = shift + insert
#IfWinActive ahk_class VirtualConsoleClass
+^v::Send, +{Insert}
#IfWinActive

; PDF-XChange Editor, SumatraPDF
#If WinActive("ahk_exe PDFXEdit.exe") || WinActive("ahk_exe SumatraPDF.exe")
mode:=0

#SPACE::
	WinGetActiveStats, Title, Width, Height, X, Y
	MPosX := (Width - 50)
	MPosY := (350)
	MouseMove, %MPosX%, %MPosY%
	MouseClick
	mode=0
return

^#SPACE::
	WinGetActiveStats, Title, Width, Height, X, Y
	MPosX := (Width - 50)
	MPosY := (350)
	MouseMove, %MPosX%, %MPosY%
	MouseClick
	mode=0
return

j::
	if(mode){
		Send, j
		}
	else {
		Send, {WheelDown 1}
		}
return

k::
	if(mode){
		Send, k
		}
	else {
		Send, {WheelUp 1}
		}
return

h::
	if(mode){
		Send, h
		}
	else {
		Send, {Left}
		}
return

l::
	if(mode){
		Send, l
		}
	else {
		Send, {Right}
		}
return

u::
	if(mode){
		Send, u
		}
	else {
		Send, {WheelUp 5}
		}
return

d::
	if(mode){
		Send, d
		}
	else {
		Send, {WheelDown 5}
		}
return

^h::
	Send, {Left 6}
return

^l::
	Send, {Right 6}
return

g::
	if(mode){
		Send, g
		}
	else {
		Send, {Home}
		}
return

+g::
	if(mode){
		Send, G
		}
	else {
		Send, {End 2}
		}
return

n::
	if(mode){
		Send, n
		}
	else {
		Send, {F3}
		}
return

+n::
	if(mode){
		Send, N
		}
	else {
		Send, +{F3}
		}
return

+j::
	if(mode){
		Send, J
		}
	else {
		Send, +^{Tab}
		}
return

+k::
	if(mode){
		Send, K
		}
	else {
		Send, ^{Tab}
		}
return

i::
	if(mode){
		Send, i
		}
	else {
		mode:= 1
		}
return

; Jump to page
^n::
	mode:= 1
	Send, ^+n
return

; zoom
^j::Send, ^{WheelDown 1}
^k::Send, ^{WheelUp 1}

; Go back
!h::Send, !{Left}

; Go forward
!l::Send, !{Right}

/::
	if(mode){
		Send, /
		}
	else {
		Send, ^f
		mode:= 1
		}
return

^f::
	Send, ^f
	mode := 1
return

`::
	mode:= 0
	Send, ^f
	Send, {Esc}
return

Enter::
	if(mode) {
		mode:=0
		Send, {Enter}
		MouseClick
		}
	else {
		Send, {F3}
	}
return

#IfWinActive
