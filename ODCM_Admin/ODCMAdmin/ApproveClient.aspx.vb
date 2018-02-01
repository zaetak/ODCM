Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports System.Data
Imports System.IO
Imports GemBox.Spreadsheet
Imports System.Web.UI
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Net
Imports System.Linq
Imports System.Collections.Generic
Imports System
Partial Class ApproveClient
    Inherits System.Web.UI.Page

    Public Sub LoadClienttoVerify()
        SqlQuery("select LastName,FirstName,MiddleName,UserName,clientid from ClientTbl where IsVerified=0 order by LastName")
        RadGrid1.DataSource = dtCommon
        RadGrid1.DataBind()
    End Sub

    Private Sub ApproveClient_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If
        If IsPostBack = False Then
            LoadClienttoVerify()
        End If
    End Sub

    Dim SMSVianettAccnt() As String

    Private Sub RadGrid1_ItemCommand(sender As Object, e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.ItemCommand
        If e.CommandName = "Select" Then
            Dim item As GridDataItem = CType(e.Item, GridDataItem)
            Dim RowID As String = item("ID").Text
            Page.Session("ID") = RowID


            For Each line As String In System.IO.File.ReadAllLines(Server.MapPath("~/bin/SMSVianett.csv"))
                SMSVianettAccnt = line.Split(",")
            Next

            SqlQuery("select phoneNumber,lastname,firstname,middlename from clienttbl where clientid='" & RowID & "'")

            Dim Mob As String
            Mob = dtCommon.Rows(0).Item(0)

            send(SMSVianettAccnt(0), SMSVianettAccnt(1), dtCommon.Rows(0).Item(1) & ", " & dtCommon.Rows(0).Item(2) & " " & dtCommon.Rows(0).Item(3) & vbNewLine & Format(DateTime.Now, "MMMM dd,yyyy HH:mm:ss ttt") & vbNewLine & "Your account in Dentcast has been approved!" & vbNewLine & "Please visit the website and log in your account.", "" & Mob)
            RadWindowManager1.RadAlert("Approved as Client Successfully.", 330, 180, "DENTCAST", "callBackFn", "/Images/Success.png")
            SqlQuery("update clienttbl set isverified=1,role='User' where clientid='" & RowID & "'")
        ElseIf e.CommandName = "Edit" Then
            Dim item As GridDataItem = CType(e.Item, GridDataItem)
            Dim RowID As String = item("ID").Text
            Page.Session("ID") = RowID


            For Each line As String In System.IO.File.ReadAllLines(Server.MapPath("~/bin/SMSVianett.csv"))
                SMSVianettAccnt = line.Split(",")
            Next

            SqlQuery("select phoneNumber,lastname,firstname,middlename from clienttbl where clientid='" & RowID & "'")

            Dim Mob As String
            Mob = dtCommon.Rows(0).Item(0)

            send(SMSVianettAccnt(0), SMSVianettAccnt(1), dtCommon.Rows(0).Item(1) & ", " & dtCommon.Rows(0).Item(2) & " " & dtCommon.Rows(0).Item(3) & vbNewLine & Format(DateTime.Now, "MMMM dd,yyyy HH:mm:ss ttt") & vbNewLine & "Your account in Dentcast has been approved!" & vbNewLine & "Please visit the website and log in your account.", "" & Mob)
            RadWindowManager1.RadAlert("Approved as Administrator Successfully.", 330, 180, "DENTCAST", "callBackFn", "/Images/Success.png")
            SqlQuery("update clienttbl set isverified=1,role='Administrator' where clientid='" & RowID & "'")
        End If
    End Sub

    Public Sub SearchStudent()
        SqlQuery("select ClientID,LastName,FirstName,MiddleName,UserName from ClientTbl where (LastName like '" & RadTextBox1.Text & "%' or FirstName like '" & RadTextBox1.Text & "%' or MiddleName like '" & RadTextBox1.Text & "%') and IsVerified=0 order by LastName")
        RadGrid1.DataSource = dtCommon
        RadGrid1.DataBind()
    End Sub

    Public Sub send(ByVal uid As String, ByVal password As String, ByVal message As String, ByVal no As String)
        Dim myReq As HttpWebRequest = DirectCast(WebRequest.Create(("https://smsc.vianett.no/v3/send?username=" + uid + "&password=" + password + "&msgid=" + no + "&tel=" + no + "&msg=" & message)), HttpWebRequest)
        Dim myResp As HttpWebResponse = DirectCast(myReq.GetResponse(), HttpWebResponse)
        Dim respStreamReader As New System.IO.StreamReader(myResp.GetResponseStream())
        Dim responseString As String = respStreamReader.ReadToEnd()
        respStreamReader.Close()
        myResp.Close()
    End Sub

    Private Sub RadGrid1_PageIndexChanged(sender As Object, e As GridPageChangedEventArgs) Handles RadGrid1.PageIndexChanged
        RadGrid1.CurrentPageIndex = e.NewPageIndex
        If RadTextBox1.Text = Nothing Then
            LoadClienttoVerify()
        Else
            SearchStudent()
        End If
    End Sub

    Private Sub RadGrid1_PageSizeChanged(sender As Object, e As GridPageSizeChangedEventArgs) Handles RadGrid1.PageSizeChanged
        RadGrid1.CurrentPageIndex = e.NewPageSize
        If RadTextBox1.Text = Nothing Then
            LoadClienttoVerify()
        Else
            SearchStudent()
        End If
    End Sub

    Private Sub RadTextBox1_TextChanged(sender As Object, e As EventArgs) Handles RadTextBox1.TextChanged
        If RadTextBox1.Text = Nothing Then
            LoadClienttoVerify()
        Else
            SearchStudent()
        End If
    End Sub

    Private Sub RadGrid1_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGrid1.ItemDataBound
        If TypeOf e.Item Is GridDataItem Then
            Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
            TryCast(dataItem("column8").Controls(0), Button).CssClass = "MyButton"
            TryCast(dataItem("column9").Controls(0), Button).CssClass = "MyButton"
        End If
    End Sub
    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click
        If RadTextBox1.Text = Nothing Then
            LoadClienttoVerify()
        Else
            SearchStudent()
        End If
        Dim rptTbl As New DataTable

        With rptTbl.Columns
            .Add("LastName")
            .Add("FirstName")
            .Add("MiddleName")
            .Add("UserName")
        End With

        For x As Integer = 0 To dtCommon.Rows.Count - 1
            rptTbl.Rows.Add(dtCommon.Rows(x).Item(0), dtCommon.Rows(x).Item(1), dtCommon.Rows(x).Item(2), dtCommon.Rows(x).Item(3))
        Next

        SpreadsheetInfo.SetLicense("E5M9-UYGW-HF3O-VETZ")
        Dim path As String = Server.MapPath("~\ToPrint\")
        Dim NameOfFile As String = path & "PendingClient.xlsx"

        Dim WB As ExcelFile = ExcelFile.Load(NameOfFile)
        Dim WS As ExcelWorksheet = WB.Worksheets.ActiveWorksheet
        WS.Cells.Style.ShrinkToFit = True
        WS.InsertDataTable(rptTbl, New InsertDataTableOptions("A11"))

        Dim Filename As String = "PendingClient_" & Format(DateTime.Now, "MMddyyyy_HHmmss") & ".pdf"
        Dim strFileName As String = path & Filename
        Dim blnFileOpen As Boolean = False

        Try
            Dim fileTemp As System.IO.FileStream = System.IO.File.OpenWrite(strFileName)
            fileTemp.Close()
        Catch ex As Exception
            blnFileOpen = False
        End Try

        If System.IO.File.Exists(strFileName) Then
            System.IO.File.Delete(strFileName)
        End If


        WB.Save(strFileName)

        Dim FP As String = Server.MapPath("~/ToPrint/" & Filename)
        Dim user As New WebClient
        Dim FB As Byte() = user.DownloadData(FP)
        If Not FB Is Nothing Then
            Response.ClearContent()
            Response.Clear()
            Response.ContentType = "application/pdf"
            Response.AddHeader("content-length", FB.Length.ToString())
            Response.BinaryWrite(FB)
        End If

        'Dim response As HttpResponse = HttpContext.Current.Response
        'response.ClearContent()
        'response.Clear()
        'response.ContentType = "application/word"
        'response.AddHeader("Content-Disposition", "attachment; filename=ClientList_" & Format(DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Local), "MMddyyyy_HHmmss") & ".pdf")
        'response.TransmitFile(Server.MapPath("~/ToPrint/" & Filename))
        'response.Flush()

        File.Delete(Server.MapPath("~/ToPrint/" & Filename))

        Response.End()
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
