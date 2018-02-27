Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports System.Data
Partial Class StockOUT
    Inherits System.Web.UI.Page

    Dim SupplyTbl As New DataTable
    Dim StockTbl As New DataTable

    Public Sub LoadSupply()
        SqlQuery("select a.Itemname,a.Quantity,a.UOM,a.Category,a.SupplyID from suppliestbl a, stockoutlist b where a.itemname=b.itemname and b.operation='" & Service.Text & "' order by itemname")
        SQLUtilities.LabelmanUtilities.SQLadptr.Fill(SupplyTbl)
        RadGrid1.DataSource = dtCommon
        RadGrid1.DataBind()
    End Sub

    Public Sub LoadSupplyService()
        SqlQuery("select ID,Itemname,Quantity from stockoutlist where operation='" & Service.Text & "' order by itemname")
        SQLUtilities.LabelmanUtilities.SQLadptr.Fill(StockTbl)
        RadGrid2.DataSource = dtCommon
        RadGrid2.DataBind()
    End Sub

    Public Sub LoadService()
        SqlQuery("select serviceoffered from servicestbl order by serviceoffered")
        Service.Items.Clear()
        Service.Items.Add("-- Please Select --")
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            Service.Items.Add(dtCommon.Rows(x).Item(0).ToString)
        Next
    End Sub
    Private Sub StockOUT_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If
        If IsPostBack = False Then
            LoadSupply()
            LoadService()
            LoadSupplyService()
        End If
    End Sub

    Private Sub Service_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Service.SelectedIndexChanged
        LoadSupply()
        LoadSupplyService()
    End Sub
    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click
        SqlQuery("select a.Itemname,a.Quantity,a.UOM,a.Category,a.SupplyID from suppliestbl a, stockoutlist b where a.itemname=b.itemname and b.operation='" & Service.Text & "' order by itemname")
        SQLUtilities.LabelmanUtilities.SQLadptr.Fill(SupplyTbl)

        SqlQuery("select ID,Itemname,Quantity from stockoutlist where operation='" & Service.Text & "' order by itemname")
        SQLUtilities.LabelmanUtilities.SQLadptr.Fill(StockTbl)

        For x As Integer = 0 To SupplyTbl.Rows.Count - 1
            If SupplyTbl.Rows(x).Item(1) < StockTbl.Rows(x).Item(2) Then
                RadWindowManager2.RadAlert("Supply quantity higher than stock quantity.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
            Else
                Dim diff As Integer
                diff = Val(SupplyTbl.Rows(x).Item(1)) - Val(StockTbl.Rows(x).Item(2))
                SqlQuery("insert into suppliesinouttbl(SupplyID,Stock,Quantity,DateStock) values('" & SupplyTbl.Rows(x).Item(4) & "','OUT','" & StockTbl.Rows(x).Item(2) & "','" & Format(Date.Now, "yyyy-MM-dd") & "')")
                SqlQuery("update suppliestbl set quantity='" & diff & "' where supplyid='" & SupplyTbl.Rows(x).Item(4) & "'")
                RadWindowManager2.RadAlert("Stock OUT Successfully.", 330, 180, "DENTCAST", "callBackFn", "/Images/Success.png")
            End If
        Next
    End Sub
    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource
        SqlQuery("select a.Itemname,a.Quantity,a.UOM,a.Category,a.SupplyID from suppliestbl a, stockoutlist b where a.itemname=b.itemname and b.operation='" & Service.Text & "' order by itemname")
        RadGrid1.DataSource = dtCommon
    End Sub
    Protected Sub RadGrid2_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid2.NeedDataSource
        SqlQuery("select ID,Itemname,Quantity from stockoutlist where operation='" & Service.Text & "' order by itemname")
        RadGrid2.DataSource = dtCommon
    End Sub
End Class
