#HotIf WinActive("ahk_exe ALSee.exe")
als_mode := 0

d::Send("{PgDn}")
a::Send("{PgUp}")
;Right::Send("{PgDn}")
;Left::Send("{PgUp}")

f::Send("{NumpadMult}") ; 기본보기
w::Send("{NumpadMult}") ; 기본보기
s::Send("{NumpadMult}") ; 기본보기
e::Send("{NumpadAdd}")
q::Send("{NumpadSub}")

#HotIf

#HotIf WinActive("ahk_class ApplicationFrameWindow") || WinActive("ahk_class Photo_Lightweight_Viewer")

d::Send("{Right}")
a::Send("{Left}")

#HotIf

#HotIf WinActive("ahk_exe Honeyview.exe")
w::Send("9")
^w::Send("9")

#HotIf

#HotIf WinActive("ahk_exe STARGMS.Window.exe")
#LButton::MButton
#HotIf
