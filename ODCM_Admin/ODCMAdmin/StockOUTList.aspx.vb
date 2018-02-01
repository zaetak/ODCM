Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports System.Data
Imports System.Web

Partial Class StockOUTList
    Inherits System.Web.UI.Page

    Dim SuppliesTBL As New DataTable
    Dim stringHolder As String
    Private Sub StockOUTList_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If
        If IsPostBack = False Then
            LoadSupply()
        End If
    End Sub

    Public Sub LoadSupply()
        LoadService()
        SqlQuery("select Itemname,Quantity from stockoutlist where operation='" & Service.Text & "'")
        RadGrid1.DataSource = dtCommon

        Console.WriteLine(stringHolder)

    End Sub
    Protected Sub RadGrid_ItemCreated(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid1.ItemCreated
        Dim ID, Quantity As GridTextBoxColumnEditor
        Dim ItemName As GridTemplateColumnEditor
        Dim ItemName1 As RadComboBox
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                ItemName = CType(manager.GetColumnEditor("ItemName"), GridTemplateColumnEditor)
                Quantity = TryCast(manager.GetColumnEditor("Quantity"), GridTextBoxColumnEditor)
                ID = TryCast(manager.GetColumnEditor("ID"), GridTextBoxColumnEditor)
                ID.TextBoxControl.Enabled = False
                ItemName1 = item.FindControl("List1")
                SqlQuery("select Itemname from suppliestbl order by itemname")
                ItemName1.Items.Clear()
                For x As Integer = 0 To dtCommon.Rows.Count - 1
                    ItemName1.Items.Add(dtCommon.Rows(x).Item(0).ToString)
                Next
                ItemName1.Text = "--Please Select--"
            End If
        End If
    End Sub


    Public Sub LoadService()
        SqlQuery("select serviceoffered from servicestbl order by serviceoffered")
        Service.Items.Clear()
        Service.Items.Add("-- Please Select --")
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            Service.Items.Add(dtCommon.Rows(x).Item(0).ToString)
        Next
    End Sub

    Dim counter = 0
    Protected Sub RadGrid_InsertCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.InsertCommand
        Dim ID, Quantity As GridTextBoxColumnEditor
        Dim ItemName As GridTemplateColumnEditor
        Dim ItemName1 As RadComboBox
        Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
        Dim manager As GridEditManager = item.EditManager
        ID = TryCast(manager.GetColumnEditor("ID"), GridTextBoxColumnEditor)
        ItemName = CType(manager.GetColumnEditor("ItemName"), GridTemplateColumnEditor)
        Quantity = TryCast(manager.GetColumnEditor("Quantity"), GridTextBoxColumnEditor)
        ID.TextBoxControl.Enabled = False
        ItemName1 = item.FindControl("List1")
        SqlQuery("select itemname from suppliestbl order by itemname")
        ItemName1.Items.Clear()
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            ItemName1.Items.Add(dtCommon.Rows(x).Item(0).ToString)
        Next
        If IsNumeric(Quantity.Text) = False And Quantity.Text <> Nothing Then
            If counter = 0 Then
                RadWindowManager2.RadAlert("Input number only.", 330, 180, "DENTCAST", "callBackFn", "Images/Error.png")
                counter = 1
                Exit Sub
            Else
                GoTo hades
            End If
        End If
        Dim serviceStr As String = Session("service").ToString
        If serviceStr = "-- Please Select --" Then
            RadWindowManager2.RadAlert("Please select  service.", 330, 180, "DENTCAST", "callBackFn", "Images/Error.png")
        Else
            SqlQuery("insert into stockoutlist(itemname,quantity,operation) values('" & ItemName1.Text & "','" & Quantity.Text & "','" & serviceStr & "')")
            RadGrid1.MasterTableView.ClearEditItems()
            RadGrid1.MasterTableView.IsItemInserted = False
            RadGrid1.MasterTableView.Rebind()
            Page.Session("Operation") = Service.Text
            Page.Session("service") = "-- Please Select --"
            Response.Redirect("StockOUTList.aspx")
        End If



hades:
        counter = 0
    End Sub



    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource
        LoadSupply()
    End Sub


    Protected Sub RadGrid_ItemDeleted(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.DeleteCommand
        Dim item As GridDataItem = CType(e.Item, GridDataItem)
        Dim a As String = item("ID").Text
        SqlQuery("Delete from stockoutlist where ID='" & a & "' and operation='" & Service.Text & "'")
        RadGrid1.MasterTableView.ClearEditItems()
        RadGrid1.Rebind()
        Response.Redirect("StockOUTList.aspx")
    End Sub
    Protected Sub Service_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Service.SelectedIndexChanged
        Session("service") = Service.Text
        SqlQuery("select ID,Itemname,Quantity from stockoutlist where operation='" & Service.Text & "'")
        RadGrid1.DataSource = dtCommon
        RadGrid1.DataBind()
    End Sub
End Class
