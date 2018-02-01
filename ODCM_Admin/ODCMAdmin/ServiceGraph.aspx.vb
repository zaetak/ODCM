
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
Partial Class ServiceGraph
    Inherits System.Web.UI.Page
    Private Sub RadDatePicker2_SelectedDateChanged(sender As Object, e As SelectedDateChangedEventArgs) Handles RadDatePicker2.SelectedDateChanged
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub

    Private Sub SupplyGraph_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If


        If IsPostBack = False Then
            RadDatePicker1.SelectedDate = Date.Now
            RadDatePicker2.SelectedDate = Date.Now
            RadHtmlChart1.Visible = False
            Dim c As CultureInfo = RadDatePicker1.Calendar.CultureInfo
            TextBox2.Text = c.Calendar.GetWeekOfYear(RadDatePicker1.SelectedDate, c.DateTimeFormat.CalendarWeekRule, c.DateTimeFormat.FirstDayOfWeek)
            Dim d As CultureInfo = RadDatePicker2.Calendar.CultureInfo
            TextBox3.Text = d.Calendar.GetWeekOfYear(RadDatePicker2.SelectedDate, d.DateTimeFormat.CalendarWeekRule, d.DateTimeFormat.FirstDayOfWeek)
            Dim path As String = Server.MapPath("~/ToPrint/file")
            RadClientExportManager1.PdfSettings.ProxyURL = ResolveUrl(path)
            RadClientExportManager1.PdfSettings.Author = "DENTCAST"
        End If
    End Sub


    Private Function GetData() As DataSet
        Dim ds As New DataSet("Stocked")
        Dim c As CultureInfo = RadDatePicker1.Calendar.CultureInfo
        TextBox2.Text = c.Calendar.GetWeekOfYear(RadDatePicker1.SelectedDate, c.DateTimeFormat.CalendarWeekRule, c.DateTimeFormat.FirstDayOfWeek)
        Dim d As CultureInfo = RadDatePicker2.Calendar.CultureInfo
        TextBox3.Text = d.Calendar.GetWeekOfYear(RadDatePicker2.SelectedDate, d.DateTimeFormat.CalendarWeekRule, d.DateTimeFormat.FirstDayOfWeek)
        If Service.Text = "Daily" Then
            RadHtmlChart1.ChartTitle.Text = Service.Text & " IN-Demand Services from " & Format(RadDatePicker1.SelectedDate, "MMMM dd, yyyy").ToString & " to " & Format(RadDatePicker2.SelectedDate, "MMMM dd, yyyy").ToString
            SqlQuery("select a.id,a.serviceoffered as 'Name',count(a.serviceoffered) as 'Quantity' from servicestbl a, reservationtbl b where a.id=b.serviceid and b.datereserved between '" & Format(RadDatePicker1.SelectedDate, "yyyy-MM-dd") & "' and '" & Format(RadDatePicker2.SelectedDate, "yyyy-MM-dd") & "' GROUP BY b.`ServiceID` ORDER BY b.`ServiceID` DESC")
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontFamily = "Century Gothic"
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.Bold = True
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontSize = 18
        ElseIf Service.Text = "Weekly" Then
            RadHtmlChart1.ChartTitle.Text = Service.Text & " IN-Demand Services from " & Format(RadDatePicker1.SelectedDate, "MMMM dd, yyyy").ToString & " to " & Format(RadDatePicker2.SelectedDate, "MMMM dd, yyyy").ToString
            SqlQuery("select a.id,a.serviceoffered as 'Name',count(a.serviceoffered) as 'Quantity' from servicestbl a, reservationtbl b where a.id=b.serviceid and WEEK(b.datereserved,2) between '" & TextBox2.Text & "' and '" & TextBox3.Text & "' GROUP BY b.`ServiceID` ORDER BY b.`ServiceID` DESC")
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontFamily = "Century Gothic"
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.Bold = True
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontSize = 18
        ElseIf Service.Text = "Monthly" Then
            RadHtmlChart1.ChartTitle.Text = Service.Text & " IN-Demand Services from " & Format(RadDatePicker1.SelectedDate, "MMMM dd, yyyy").ToString & " to " & Format(RadDatePicker2.SelectedDate, "MMMM dd, yyyy").ToString
            SqlQuery("select a.id,a.serviceoffered as 'Name',count(a.serviceoffered) as 'Quantity' from servicestbl a, reservationtbl b where a.id=b.serviceid and month(b.datereserved) between '" & Format(RadDatePicker1.SelectedDate, "MM") & "' and '" & Format(RadDatePicker2.SelectedDate, "MM") & "' GROUP BY b.`ServiceID` ORDER BY b.`ServiceID` DESC")
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontFamily = "Century Gothic"
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.Bold = True
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontSize = 18
        ElseIf Service.Text = "Yearly" Then
            RadHtmlChart1.ChartTitle.Text = Service.Text & " IN-Demand Services from " & Format(RadDatePicker1.SelectedDate, "MMMM dd, yyyy").ToString & " to " & Format(RadDatePicker2.SelectedDate, "MMMM dd, yyyy").ToString
            SqlQuery("select a.id,a.serviceoffered as 'Name',count(a.serviceoffered) as 'Quantity' from servicestbl a, reservationtbl b where a.id=b.serviceid and year(b.datereserved) between '" & Format(RadDatePicker1.SelectedDate, "yyyy") & "' and '" & Format(RadDatePicker2.SelectedDate, "yyyy") & "' GROUP BY b.`ServiceID` ORDER BY b.`ServiceID` DESC")
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


    Private Sub Service_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Service.SelectedIndexChanged
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub

    Private Sub RadDatePicker1_SelectedDateChanged(sender As Object, e As SelectedDateChangedEventArgs) Handles RadDatePicker1.SelectedDateChanged
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub

End Class
