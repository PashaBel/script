Dim FSO, File
Set FSO = CreateObject("Scripting.FileSystemObject")
Set File = FSO.GetFile("D:\Zip\DB1111.CSV")

for i = 0 to 10000
File.Copy "D:\Zip\" & i & "DB1111.CSV"
next


'File.Copy "C:\Ne File.txt"
'File.Move "C:\"
'File.Delete