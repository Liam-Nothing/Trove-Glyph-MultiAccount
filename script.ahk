; Define a list of users with all necessary data
users := [
    {email: "your@email.com", password: "yourpassword", x: -5, y: -5},
    {email: "your@email.com", password: "yourpassword", x: 295, y: -5},
    {email: "your@email.com", password: "yourpassword", x: -5, y: 230},
    {email: "your@email.com", password: "yourpassword", x: 295, y: 230},
    {email: "your@email.com", password: "yourpassword", x: -5, y: 460},
    {email: "your@email.com", password: "yourpassword", x: 295, y: 460},
]

Pid_Trove := []
SetKeyDelay(50)

for index, user in users {
	; To debug a specific user
    ; if (index > 1) {
    ;     break
    ; }

    ProcessUser(user)
	ToolTip("")
}

for index, PID in Pid_Trove {
    if (!ProcessExist(PID)) {
        if (index = 2) {
            ProcessUser(users[index])
            Pid_Trove[index] := WinGetPID("A")
        }
    }
}

ProcessUser(user) {
	ToolTip(
		"User: " user.email
	)

    WinActivate("Glyph")

	; Open modal login glyph account
	Sleep(250)
    Click(860, 20)
    Sleep(250)
    Click(860, 147)

	Loop {
		; Change the title of the window to match the title of the login modal
        if WinExist("Connexion à Glyph") {
			ToolTip (
				"User: " user.email
				"`nMessage: " "Login modal found"
			)
            break
        }else{
			ToolTip (
				"User: " user.email
				"`nMessage: " "Login modal not found"
			)
		}
        Sleep(500)
    }

	Send(user.email)
    Send("{Tab}")
    Send(user.password "{Enter}")

	Loop {
        if not WinExist("Connexion à Glyph") {
			ToolTip (
				"User: " user.email
				"`nMessage: " "Login modal not found"
			)
            break
        }else{
			ToolTip (
				"User: " user.email
				"`nMessage: " "Login modal found"
			)
		}
        Sleep(500)
    }

	Sleep(500)
    Click(900, 100)
    ; Sleep(3210)

    Loop {
        APID := WinGetPID("A")
        process := WinGetProcessName("ahk_pid " APID)
        if (process = "Trove.exe") {
			WinMove(user.x, user.y, 50, 50, "ahk_pid " APID)
            Pid_Trove.Push(APID)
			ToolTip (
				"User: " user.email
				"`nMessage: " "Trove found"
				"`nProcess: " process
			)
            break
        }else{
			ToolTip (
				"User: " user.email
				"`nMessage: " "Trove not found"
				"`nProcess: " process
			)
		}
        Sleep(500)
    }
}

^Numpad1:: {
    for _, v in Pid_Trove {
		ControlSend "o",, "ahk_pid " v
    }
}

^Numpad2:: {
    for _, v in Pid_Trove {
        WinActivate("ahk_pid " v)
        Click(60, 44)
    }
}

^Numpad3:: {
    for _, v in Pid_Trove {
		ControlSend "e",, "ahk_pid " v
    }
}

^Numpad4:: {
    for _, v in Pid_Trove {
		ControlSend "{Space}",, "ahk_pid " v
    }
}

^Numpad5:: {
    for _, v in Pid_Trove {
		ControlSend "b",, "ahk_pid " v
    }
}

;Restart bomb game
^Numpad9:: {
    for _, v in Pid_Trove {
        WinActivate("ahk_pid " v)
        Click(250, 170)
    }
}

;Recup loot
^Numpad8:: {
    for _, v in Pid_Trove {
		ControlSend "l",, "ahk_pid " v
    }
    for _, v in Pid_Trove {
        WinActivate("ahk_pid " v)
        Click(150, 154)
    }
    for _, v in Pid_Trove {
		ControlSend "l",, "ahk_pid " v
    }
}

^Numpad7:: {
    for _, v in Pid_Trove {
		ControlSend "1",, "ahk_pid " v
    }
}