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

RControl::Capslock

; ctrl + ; for end
^;::Send, {End}

; Mouse click
#space:: MouseClick

; Alt+q to Alt + F4
!q::Send, !{F4}

; show desktop
!a::Send, #d

; Scroll up (alt k)
!k::Send, {WheelUp 1}

; Scroll down (alt j)
!j::Send, {WheelDown 1}


; Programs
; Explorer
!w::Run, Explorer /n`,/e`,

; Chrome
!e::Run, chrome.exe

; Everything
#o::Run, C:\Program Files\Everything\Everything.exe
