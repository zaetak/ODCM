Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports Microsoft.Owin.Security
Imports SQLUtilities.LabelmanUtilities
Partial Class _Default
    Inherits Page

    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        RegisterHyperLink.NavigateUrl = "Account/Register"
        'OpenAuthLogin.ReturnUrl = Request.QueryString("ReturnUrl")
        Dim returnUrl = HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
        If Not [String].IsNullOrEmpty(returnUrl) Then
            RegisterHyperLink.NavigateUrl += "?ReturnUrl=" & returnUrl
        End If
        If Me.Page.User.Identity.IsAuthenticated Then
            'Response.Redirect("~/Default.aspx")
            loginForm.Visible = False

        End If
    End Sub

    Protected Sub LogIn(sender As Object, e As EventArgs)

        ' Validate the user password
        SqlQuery("Select clientid from clienttbl where IsVerified=0 and Username='" & UserName.Text & "'")
        If dtCommon.Rows.Count > 0 Then
            RadWindowManager1.RadAlert("Your account is not yet approved by Administrator.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
            UserName.Text = Nothing
            Password.Text = Nothing
            Exit Sub
        End If


        Dim User, AdminPassword, Age, Role As String
        SqlQuery("select username,Password,age,role from clienttbl where Username='" & UserName.Text & "'")
        If dtCommon.Rows.Count = 0 Then
            RadWindowManager1.RadAlert("Account not registered.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
            Exit Sub
        End If
        User = dtCommon.Rows(0).Item(0).ToString
        AdminPassword = dtCommon.Rows(0).Item(1).ToString

        If AdminPassword = Password.Text Then
            FormsAuthentication.SetAuthCookie(User, checked)
            Age = dtCommon.Rows(0).Item(2).ToString
            Role = dtCommon.Rows(0).Item(3).ToString
            If Role = "Administrator" Then
                Response.Redirect("~/ODCMAdmin/SupplyGraph.aspx")
            End If

            If Age = Nothing And Role = "User" Then
                Response.Redirect("~/AddClient.aspx")
            Else
                Response.Redirect("~/ODCMUser/Reservation.aspx")
            End If
        Else
            RadWindowManager1.RadAlert("Incorrect Password.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Dim checked As Boolean
    Private Sub RememberMe_CheckedChanged(sender As Object, e As EventArgs) Handles RememberMe.CheckedChanged
        If RememberMe.Checked = True Then
            checked = True
        ElseIf RememberMe.Checked = False Then
            checked = False
        End If
    End Sub
End Class