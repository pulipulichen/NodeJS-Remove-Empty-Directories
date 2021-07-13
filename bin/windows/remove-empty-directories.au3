#pragma compile(Icon, '../../assets/icon/clean.ico')

FileChangeDir(@ScriptDir)

Local $jsFilename = "remove-empty-directories"
Local $fileList = ""
For $i = 1 To $CmdLine[0]
   ;MsgBox($MB_SYSTEMMODAL, FileExists(GetFileName($CmdLine[$i])), GetFileName($CmdLine[$i]))
   If FileExists($CmdLine[$i]) Then
	  Local $f = $CmdLine[$i]
	  $fileList = $fileList & ' "' & $f & '"'
   EndIf
Next

RunWait('node ../../' & $jsFilename &'.js'& $fileList, "", @SW_HIDE)

