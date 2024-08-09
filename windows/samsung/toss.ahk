#HotIf WinActive("ahk_exe etxc.exe")
toss_mode := 0

w::{
    if (toss_mode) {
        Send("{Up}")
    }
    else {
        Send("w")
    }
    return
}

a::{
    if (toss_mode) {
        Send("{Left}")
    }
    else {
        Send("a")
    }
    return
}

s::{
    if (toss_mode) {
        Send("{Down}")
    }
    else {
        Send("s")
    }
    return
}

d::{
    if (toss_mode) {
        Send("{Right}")
    }
    else {
        Send("d")
    }
    return
}

e::{
    if (toss_mode) {
        Send("{+}")
    }
    else {
        Send("e")
    }
    return
}


^e:: {
	global toss_mode
	Send("{+}")
	toss_mode := 1
	return
}
	
q:: {
	global toss_mode
	Send("-")
	toss_mode := 1
	return
}

^a::{
	global toss_mode
	Send("^a")
	toss_mode := 0
	return
}
c::{
	global toss_mode
	Send("c")
	toss_mode := 0
	return
}

^1::{
    global toss_mode
    if (toss_mode) {
        toss_mode := 0
    }
    else {
        toss_mode := 1
    }
    return
}




#HotIf
