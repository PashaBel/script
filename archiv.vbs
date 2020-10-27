InputFolder = "D:\zip\" 
OutputFolder = "D:\zipout\" 
ZipFile = OutputFolder & Year(Date) & "_" & Month(Date) & ".zip"
FileType = "CSV"

CreateObject("Scripting.FileSystemObject").CreateTextFile(ZipFile, True).Write "PK" & Chr(5) & Chr(6) & String(18, vbNullChar)
Set objShell = CreateObject("Shell.Application")
Set source = objShell.NameSpace(InputFolder).Items
source.Filter 64 + 128, "*." & FileType
For Each objFile In source
    objShell.NameSpace(ZipFile).CopyHere(source)
Next
Do Until objShell.NameSpace(ZipFile).Items.Count = source.Count
   WScript.Sleep 500 ' Arbitrary polling delay
Loop

Set FSO = CreateObject("Scripting.FileSystemObject")
Set Folder = FSO.GetFolder(InputFolder)
Set FC = Folder.Files
For Each F1 in FC 
	If InStr(F1, FileType) <> 0 Then 
		F1.Delete
	End If
Next