Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports System
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports SQLUtilities.LabelmanUtilities
Public Partial Class Account_Register
    Inherits Page

    Protected Sub CreateUser_Click(sender As Object, e As EventArgs)
        SqlQuery("Select clientid from clienttbl where UserName='" & UserName.Text & "'")
        If dtCommon.Rows.Count > 0 Then
            RadWindowManager1.RadAlert("UserName already exists.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
            LastName.Focus()
            Clear()
            Exit Sub
        End If
        SqlQuery("Select clientid from clienttbl where LastName like '" & LastName.Text & "%' and FirstName like '" & FirstName.Text & "%'")
        If dtCommon.Rows.Count > 0 Then
            RadWindowManager1.RadAlert("Employee already registered.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
            LastName.Focus()
            Clear()
        Else
            SqlQuery("Insert into clienttbl(Lastname,Firstname,Middlename,Username,Password,PhoneNumber,Isverified) values('" & LastName.Text & "','" & FirstName.Text & "','" & MiddleName.Text & "','" & UserName.Text & "','" & Password.Text & "','63" & PhoneNumber.Text & "' , 0)")
            RadWindowManager1.RadAlert("Registered Successfully.", 330, 180, "DENTCAST", "callBackFn1", "/Images/Success.png")
        End If
    End Sub

    Public Sub Clear()
        FirstName.Text = Nothing
        MiddleName.Text = Nothing
        LastName.Text = Nothing
        UserName.Text = Nothing
        Password.Text = Nothing
        ConfirmPassword.Text = Nothing
    End Sub
    Private Sub Account_Register_Load(sender As Object, e As EventArgs) Handles Me.Load
        '   CreateUserBtn.Enabled = False
    End Sub

End Class
