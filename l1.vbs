'********************************************************
'Урок VBScript №9:
'Строковые функции. Работа с текстом
'file_1.vbs
'********************************************************

Dim a, b
a = "Строка в которой что-то ищут"
b = "что-то"

MsgBox InStr(a,b) & vbCrlf & InStr(3,a,b) & vbCrlf & InStr(3,a,b,1) & vbCrlf & InStr(19,a,b,1)

MsgBox InStrRev(a,b,23) & vbCrlf & InStrRev(a,b,23,1) & vbCrlf & InStrRev(a,b,-1,1)