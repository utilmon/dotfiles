#InstallKeybdHook

Capslock::Ctrl
return

; to make "Shift + Ctrl" work properly with capslock
+CapsLock::+Ctrl
Return

; Ctrl + CapsLock toggle preventation
^CapsLock::Ctrl
Return

; Win + Capslock toggle preventation
<#CapsLock::

; Always on Top
;^SPACE:: Winset, Alwaysontop, , A ; ctrl + space
;Return

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

; Alt+q to Alt + F4
!q::Send, !{F4}

; show desktop
!a::Send, #d

; Programs
; Explorer
!w::Run, Explorer /n`,/e`,

; Chrome
!e::Run, chrome.exe

; Everything
#o::Run, C:\Program Files\Everything\Everything.exe

;; Customize depending on opened window
;; Use status icon right click spy to probe opened programs

;Chrome and Firefox
#If WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe firefox.exe")

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
#If WinActive("ahk_exe PDFXEdit.exe") || WinActive("ahk_exe SumatraPDF.exe") || WinActive("ahk_exe AcroRd32.exe")
mode:=0

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
		Send, {PgUp}
		}
return

l::
	if(mode){
		Send, l
		}
	else {
		Send, {PgDn}
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

Esc::
	mode:= 0
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
