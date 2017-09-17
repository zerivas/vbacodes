Attribute VB_Name = "EnviaEmail"
Sub EnviaEmail()
    Dim olItem As Object
    Dim App As Object
    Dim Email_Subject, Email_To, Email_Cc, Email_Body As String
    Dim Data_Atual As Date

    Set App = CreateObject("Outlook.Application")
    Set olItem = App.CreateItem(olMailItem)

'   // Manter Assinatura
    With olItem
        .Display
    End With

    Data_Atual = DateValue(Now)
    Email_Subject = "Relatório de xx -  " & Data_Atual & ""
    Email_To = "Destinatario"

    Email_Body = "<body>Prezados,<br>" & _
                 "Segue anexo relatório de despesas para a data de " & Data_Atual & " ." & _
                 "<br><br>Att</body>"
     
    With olItem
        .Subject = Email_Subject
        .To = Email_To
        .HTMLBody = Email_Body & vbNewLine & vbNewLine & .HTMLBody
        '.Attachments.Add ("C:\Temp\file001.pdf")
        .Display
    End With

    Set olItem = Nothing
End Sub

