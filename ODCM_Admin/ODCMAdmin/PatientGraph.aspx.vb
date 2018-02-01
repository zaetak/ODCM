
Imports System.Globalization
Imports Telerik.Web.UI.Calendar
Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports System.Drawing
Imports Microsoft.VisualBasic
Imports System
Imports System.IO
Imports System.Collections
Imports System.Net
Imports System.Configuration
Imports System.Data
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Xml.Linq
Imports GemBox.Spreadsheet
Partial Class PatientGraph
    Inherits System.Web.UI.Page


    Private Sub PatientGraph_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If


        If IsPostBack = False Then
            RadHtmlChart1.Visible = False
            Dim path As String = Server.MapPath("~/ToPrint/file")
            RadClientExportManager1.PdfSettings.ProxyURL = ResolveUrl(path)
            RadClientExportManager1.PdfSettings.Author = "DENTCAST"
        End If
    End Sub


    Private Function GetData() As DataSet
        Dim ds As New DataSet("Stocked")
        If Sex.Text = "All" Then
            RadHtmlChart1.ChartTitle.Text = Sex.Text & " Patient Ages " & txtfrom.Text & " to " & txtto.Text
            SqlQuery("Select clientid,Gender,count(Age) as 'Age' from clienttbl where age between '" & txtfrom.Text & "' and '" & txtto.Text & "' and role='User' group by gender")
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontFamily = "Century Gothic"
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.Bold = True
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontSize = 18
        Else
            RadHtmlChart1.ChartTitle.Text = Sex.Text & " Patient Ages " & txtfrom.Text & " to " & txtto.Text
            SqlQuery("Select clientid,Gender,count(Age) as 'Age' from clienttbl where age between '" & txtfrom.Text & "' and '" & txtto.Text & "' and role='User' and gender='" & Sex.Text & "' group by gender")
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontFamily = "Century Gothic"
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.Bold = True
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontSize = 18
        End If

        ds.Tables.Add(dtCommon)
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
        End If
        Return ds
    End Function

    Protected Sub txtfrom_TextChanged(sender As Object, e As EventArgs) Handles txtfrom.TextChanged
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub

    Private Sub txtto_TextChanged(sender As Object, e As EventArgs) Handles txtto.TextChanged
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub

    Private Sub Sex_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Sex.SelectedIndexChanged
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub
End Class
