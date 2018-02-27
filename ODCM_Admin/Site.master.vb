Imports System.Collections.Generic
Imports System.Security.Claims
Imports System.Security.Principal
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports SQLUtilities.LabelmanUtilities
Public Partial Class SiteMaster
    Inherits MasterPage
    Private Const AntiXsrfTokenKey As String = "__AntiXsrfToken"
    Private Const AntiXsrfUserNameKey As String = "__AntiXsrfUserName"
    Private _antiXsrfTokenValue As String

    Protected Sub MSSQLCONNECT()
        ServerName = "localhost"
        DatabaseName = "ODCMDB"
        UserID = "root"
        Password = ""
        SQLConnect()
    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs)
        ' The code below helps to protect against XSRF attacks
        Dim requestCookie = Request.Cookies(AntiXsrfTokenKey)
        Dim requestCookieGuidValue As Guid
        If requestCookie IsNot Nothing AndAlso Guid.TryParse(requestCookie.Value, requestCookieGuidValue) Then
            ' Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value
            Page.ViewStateUserKey = _antiXsrfTokenValue
        Else
            ' Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N")
            Page.ViewStateUserKey = _antiXsrfTokenValue

            Dim responseCookie = New HttpCookie(AntiXsrfTokenKey) With {
                .HttpOnly = True,
                .Value = _antiXsrfTokenValue
            }
            If FormsAuthentication.RequireSSL AndAlso Request.IsSecureConnection Then
                responseCookie.Secure = True
            End If
            Response.Cookies.[Set](responseCookie)
        End If

        AddHandler Page.PreLoad, AddressOf master_Page_PreLoad
    End Sub

    Protected Sub master_Page_PreLoad(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            ' Set Anti-XSRF token
            ViewState(AntiXsrfTokenKey) = Page.ViewStateUserKey
            ViewState(AntiXsrfUserNameKey) = If(Context.User.Identity.Name, [String].Empty)
        Else
            ' Validate the Anti-XSRF token
            If DirectCast(ViewState(AntiXsrfTokenKey), String) <> _antiXsrfTokenValue OrElse DirectCast(ViewState(AntiXsrfUserNameKey), String) <> (If(Context.User.Identity.Name, [String].Empty)) Then
                Throw New InvalidOperationException("Validation of Anti-XSRF token failed.")
            End If
        End If
    End Sub

    Protected Sub LoginStatus_LoggedOut(sender As Object, e As System.EventArgs)
        Session.Abandon()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        MSSQLCONNECT()
        SqlQuery("select count(*) from reservationtbl where status='Pending'")
        NotiCount.Text = dtCommon.Rows(0).Item(0)
        SupplyNeeded()
        PendingClient()

        Try
            SqlQuery("select clientid,role from clienttbl where username='" & Me.Page.User.Identity.Name.ToString & "'")
            If dtCommon.Rows(0).Item(1) = "Administrator" Then
                Page.Session("Role") = "Administrator"
                Page.Session("LoginID") = dtCommon.Rows(0).Item(0)
            Else
                Page.Session("Role") = "User"
                Page.Session("LoginID") = dtCommon.Rows(0).Item(0)
            End If
        Catch ex As Exception
            Page.Session("Role") = Nothing
        End Try

        If Page.Session("Role") = "Administrator" Then
            clientadmin.Visible = True
            reservationadmin.Visible = True
            suppliesadmin.Visible = True
            serviceadmin.Visible = True
            statgraph.Visible = True
            pictureadmin.Visible = True

            reservationuser.Visible = False
            recorduser.Visible = False
            aboutuser.Visible = False
            aboutservice.Visible = False
        ElseIf Page.Session("Role") = "User" Then
            reservationuser.Visible = True
            recorduser.Visible = True
            aboutuser.Visible = True
            aboutservice.Visible = True


            clientadmin.Visible = False
            reservationadmin.Visible = False
            suppliesadmin.Visible = False
            serviceadmin.Visible = False
            statgraph.Visible = False
            pictureadmin.Visible = False
        Else
            clientadmin.Visible = False
            reservationadmin.Visible = False
            suppliesadmin.Visible = False
            serviceadmin.Visible = False
            reservationuser.Visible = False
            recorduser.Visible = False
            aboutuser.Visible = False
            aboutservice.Visible = False
            statgraph.Visible = False
            pictureadmin.Visible = False
        End If

    End Sub

    Public Sub SupplyNeeded()
        SqlQuery("select count(*) from suppliestbl where quantity<20")
        SupplyCount.Text = dtCommon.Rows(0).Item(0)
    End Sub

    Public Sub PendingClient()
        SqlQuery("select count(*) from clienttbl where isverified=0")
        PendingClient1.Text = dtCommon.Rows(0).Item(0)
    End Sub

    Protected Sub Unnamed_LoggingOut(sender As Object, e As LoginCancelEventArgs)
        Context.GetOwinContext().Authentication.SignOut()
    End Sub
End Class
