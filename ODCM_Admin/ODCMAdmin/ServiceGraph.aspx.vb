
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
            'RadDatePicker1.SelectedDate = Date.Now
            'RadDatePicker2.SelectedDate = Date.Now
            'RadHtmlChart1.Visible = False
            'Dim c As CultureInfo = RadDatePicker1.Calendar.CultureInfo
            'TextBox2.Text = c.Calendar.GetWeekOfYear(RadDatePicker1.SelectedDate, c.DateTimeFormat.CalendarWeekRule, c.DateTimeFormat.FirstDayOfWeek)
            'Dim d As CultureInfo = RadDatePicker2.Calendar.CultureInfo
            'TextBox3.Text = d.Calendar.GetWeekOfYear(RadDatePicker2.SelectedDate, d.DateTimeFormat.CalendarWeekRule, d.DateTimeFormat.FirstDayOfWeek)
            'Dim path As String = Server.MapPath("~/ToPrint/file")
            'RadClientExportManager1.PdfSettings.ProxyURL = ResolveUrl(path)
            'RadClientExportManager1.PdfSettings.Author = "DENTCAST"

            Service.Text = "Yearly"
            PrepareData(Service.Text)
            RadDatePicker2.Enabled = False
        End If
    End Sub

    Private Sub PrepareData(x As String)
        RadDatePicker1.SelectedDate = Date.Now
        Select Case x
            Case "Yearly"
                RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddYears(1)
            Case "Weekly"
                RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddDays(7)
            Case "Monthly"
                RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddMonths(1)
            Case "Daily"
                RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value
        End Select



        'RadioButton1.Checked = True
        'TextBox1.Text = "In"
        RadHtmlChart1.Visible = True
        RadHtmlChart1.DataSource = GetData()
        RadHtmlChart1.DataBind()
        Dim c As CultureInfo = RadDatePicker1.Calendar.CultureInfo
        TextBox2.Text = c.Calendar.GetWeekOfYear(RadDatePicker1.SelectedDate, c.DateTimeFormat.CalendarWeekRule, c.DateTimeFormat.FirstDayOfWeek)
        Dim d As CultureInfo = RadDatePicker2.Calendar.CultureInfo
        TextBox3.Text = d.Calendar.GetWeekOfYear(RadDatePicker2.SelectedDate, d.DateTimeFormat.CalendarWeekRule, d.DateTimeFormat.FirstDayOfWeek)
        Dim path As String = Server.MapPath("~/ToPrint/file")
        RadClientExportManager1.PdfSettings.ProxyURL = ResolveUrl(path)
        RadClientExportManager1.PdfSettings.Author = "DENTCAST"
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
            SqlQuery("select a.id,a.serviceoffered as 'Name',count(a.serviceoffered) as 'Quantity' from servicestbl a, reservationtbl b where a.id=b.serviceid and b.datereserved between '" & Format(RadDatePicker1.SelectedDate, "yyyy-MM-dd") & "' and '" & Format(RadDatePicker2.SelectedDate, "yyyy-MM-dd") & "' GROUP BY b.`ServiceID` ORDER BY b.`ServiceID` DESC")
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
        If Service.Text = "Daily" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddDays(1)
        ElseIf Service.Text = "Weekly" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddDays(7)
        ElseIf Service.Text = "Monthly" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddMonths(1)
        ElseIf Service.Text = "Yearly" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddYears(1)
        End If

        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            'RadHtmlChart1.Visible = True
            'RadHtmlChart1.DataSource = GetData()
            'RadHtmlChart1.DataBind()
            PrepareData(Service.Text)
        End If
    End Sub

    Private Sub RadDatePicker1_SelectedDateChanged(sender As Object, e As SelectedDateChangedEventArgs) Handles RadDatePicker1.SelectedDateChanged
        If Service.Text = "Daily" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddDays(1)
        ElseIf Service.Text = "Weekly" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddDays(7)
        ElseIf Service.Text = "Monthly" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddMonths(1)
        ElseIf Service.Text = "Yearly" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddYears(1)
        End If
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub
    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click

        SpreadsheetInfo.SetLicense("E5M9-UYGW-HF3O-VETZ")

        If Service.Text = "Daily" Then
            RadHtmlChart1.ChartTitle.Text = Service.Text & " IN-Demand Services from " & Format(RadDatePicker1.SelectedDate, "MMMM dd, yyyy").ToString & " to " & Format(RadDatePicker2.SelectedDate, "MMMM dd, yyyy").ToString
            SqlQuery("select a.id,a.serviceoffered as 'Name',count(a.serviceoffered) as 'Quantity' from servicestbl a, reservationtbl b where a.id=b.serviceid and b.datereserved between '" & Format(RadDatePicker1.SelectedDate, "yyyy-MM-dd") & "' and '" & Format(RadDatePicker2.SelectedDate, "yyyy-MM-dd") & "' GROUP BY b.`ServiceID` ORDER BY b.`ServiceID` DESC")
        ElseIf Service.Text = "Weekly" Then
            RadHtmlChart1.ChartTitle.Text = Service.Text & " IN-Demand Services from " & Format(RadDatePicker1.SelectedDate, "MMMM dd, yyyy").ToString & " to " & Format(RadDatePicker2.SelectedDate, "MMMM dd, yyyy").ToString
            SqlQuery("select a.id,a.serviceoffered as 'Name',count(a.serviceoffered) as 'Quantity' from servicestbl a, reservationtbl b where a.id=b.serviceid and WEEK(b.datereserved,2) between '" & TextBox2.Text & "' and '" & TextBox3.Text & "' GROUP BY b.`ServiceID` ORDER BY b.`ServiceID` DESC")
        ElseIf Service.Text = "Monthly" Then
            RadHtmlChart1.ChartTitle.Text = Service.Text & " IN-Demand Services from " & Format(RadDatePicker1.SelectedDate, "MMMM dd, yyyy").ToString & " to " & Format(RadDatePicker2.SelectedDate, "MMMM dd, yyyy").ToString
            SqlQuery("select a.id,a.serviceoffered as 'Name',count(a.serviceoffered) as 'Quantity' from servicestbl a, reservationtbl b where a.id=b.serviceid and month(b.datereserved) between '" & Format(RadDatePicker1.SelectedDate, "MM") & "' and '" & Format(RadDatePicker2.SelectedDate, "MM") & "' GROUP BY b.`ServiceID` ORDER BY b.`ServiceID` DESC")
        ElseIf Service.Text = "Yearly" Then
            RadHtmlChart1.ChartTitle.Text = Service.Text & " IN-Demand Services from " & Format(RadDatePicker1.SelectedDate, "MMMM dd, yyyy").ToString & " to " & Format(RadDatePicker2.SelectedDate, "MMMM dd, yyyy").ToString
            SqlQuery("select a.id,a.serviceoffered as 'Name',count(a.serviceoffered) as 'Quantity' from servicestbl a, reservationtbl b where a.id=b.serviceid and year(b.datereserved) between '" & Format(RadDatePicker1.SelectedDate, "yyyy") & "' and '" & Format(RadDatePicker2.SelectedDate, "yyyy") & "' GROUP BY b.`ServiceID` ORDER BY b.`ServiceID` DESC")
        End If

        Dim path As String = Server.MapPath("~/ToPrint/")
        Dim NameOfFile As String = path & "ServiceGraph.xlsx"
        Dim Filename As String = "ServiceGraph_" & Format(DateTime.Now, "MMddyyyy") & ".pdf"
        Dim strFileName As String = path & Filename

        Dim WB As ExcelFile = ExcelFile.Load(NameOfFile)
        Dim WS As ExcelWorksheet = WB.Worksheets.ActiveWorksheet
        'WS.Cells.Style.ShrinkToFit = True

        WB.Worksheets.Item(0).Cells("A8").Value = RadHtmlChart1.ChartTitle.Text.ToUpper

        Dim numberOfEmployees = dtCommon.Rows.Count - 1

        WS.NamedRanges("ItemName").Range = WS.Cells.GetSubrangeAbsolute(11, 1, numberOfEmployees + 11, 1)
        WS.NamedRanges("Quantity").Range = WS.Cells.GetSubrangeAbsolute(11, 2, numberOfEmployees + 11, 2)


        For i As Integer = 0 To dtCommon.Rows.Count - 1
            WS.Cells(i + 11, 1).Value = dtCommon.Rows(i).Item(1).ToString
            WS.Cells(i + 11, 2).SetValue(dtCommon.Rows(i).Item(2))
        Next

        If System.IO.File.Exists(strFileName) Then
            System.IO.File.Delete(strFileName)
        End If

        WB.Save(Server.MapPath("~/ToPrint/ServiceGraph_" & Format(DateTime.Now, "MMddyyyy") & ".xlsx"))

        Dim WB1 As ExcelFile = ExcelFile.Load(Server.MapPath("~/ToPrint/ServiceGraph_" & Format(DateTime.Now, "MMddyyyy") & ".xlsx"))
        WB1.Save(Server.MapPath("~/ToPrint/ServiceGraph_" & Format(DateTime.Now, "MMddyyyy") & ".pdf"))
        Dim FP As String = Server.MapPath("~/ToPrint/ServiceGraph_" & Format(DateTime.Now, "MMddyyyy") & ".pdf")
        Dim user As New WebClient
        Dim FB As Byte() = user.DownloadData(FP)
        If Not FB Is Nothing Then
            Response.ClearContent()
            Response.Clear()
            Response.ContentType = "application/pdf"
            Response.AddHeader("content-length", FB.Length.ToString())
            Response.BinaryWrite(FB)
        End If

    End Sub
End Class
