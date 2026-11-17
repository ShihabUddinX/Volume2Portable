${SegmentFile}
!include LogicLib.nsh

${SegmentPrePrimary}
	${IfNot} ${FileExists} "$EXEDIR\Data\PortableApps.comLauncherRuntimeData-Volume2Portable.ini"
		${IfNot} ${FileExists} "$EXEDIR\Data\Config\Config.ini"
		${AndIfNot} ${FileExists} "$EXEDIR\App\Volume2\Config.ini"
			FileOpen $0 "$EXEDIR\Data\Config\Config.ini" w ;Opens a Empty File and fills it
			FileWrite $0 ";Warning! Editing this file, can cause Volume² to stop work"
			FileClose $0 ;Closes the filled file
		${EndIf}
	${EndIf}

	ReadINIStr $0 "$EXEDIR\Volume2Portable.ini" "Volume2Portable" "AutoStartPM"

	${If} $0 == "true"
    	WriteINIStr "$EXEDIR\Data\Config\Config.ini" "Main" "ShowPeakMeter" "1"
	${ElseIf} $0 == "false"
		WriteINIStr "$EXEDIR\Data\Config\Config.ini" "Main" "ShowPeakMeter" "0"
	${EndIf}
	
	WriteINIStr "$EXEDIR\Data\Config\Config.ini" "Main" "Autorun" "0"
!macroend