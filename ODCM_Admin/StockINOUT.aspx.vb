Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI

Partial Class StockINOUT
    Inherits System.Web.UI.Page
    Private Sub StockINOUT_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If
        If IsPostBack = False Then
            LoadSupply()
        End If
    End Sub


    Public Sub LoadSupply()
        SqlQuery("select Itemname,Quantity,UOM,Category,SupplyID from suppliestbl order by supplyid")
        RadGrid1.DataSource = dtCommon
        RadGrid1.DataBind()
    End Sub

    Private Sub Category_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Category.SelectedIndexChanged
        If RadTextBox1.Text = Nothing And Category.Text = "ALL" Then
            LoadSupply()
        ElseIf Category.Text = "ALL" And RadTextBox1.Text <> Nothing Then
            SqlQuery("select Itemname,Quantity,UOM,Category,SupplyID from suppliestbl where itemname like '" & RadTextBox1.Text & "%' order by supplyid")
            RadGrid1.DataSource = dtCommon
            RadGrid1.DataBind()
        ElseIf Category.Text <> "ALL" And RadTextBox1.Text = Nothing Then
            SqlQuery("select Itemname,Quantity,UOM,Category,SupplyID from suppliestbl where category='" & Category.Text & "' order by supplyid")
            RadGrid1.DataSource = dtCommon
            RadGrid1.DataBind()
        ElseIf Category.Text <> "ALL" And RadTextBox1.Text <> Nothing
            SqlQuery("select Itemname,Quantity,UOM,Category,SupplyID from suppliestbl where category='" & Category.Text & "' and itemname like '" & RadTextBox1.Text & "%' order by supplyid")
            RadGrid1.DataSource = dtCommon
            RadGrid1.DataBind()
        End If
    End Sub
    Dim rowid As String
    Private Sub RadGrid1_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGrid1.ItemCommand
        If e.CommandName = "Stock" Then
            Dim item As GridDataItem = CType(e.Item, GridDataItem)
            rowid = item("column3").Text
            SqlQuery("select Itemname,Quantity from SuppliesTbl where SupplyID='" & rowid & "'")
            ItemName.Text = dtCommon.Rows(0).Item(0).ToString
            Quantity.Text = dtCommon.Rows(0).Item(1)
            Label1.Text = rowid
            ModalPopupExtender1.Show()
        End If
    End Sub

    Private Sub RadGrid1_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGrid1.ItemDataBound
        If TypeOf e.Item Is GridDataItem Then
            Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
            TryCast(dataItem("column8").Controls(0), Button).CssClass = "MyButton"
        End If
    End Sub
    Dim stotal As Integer
    Private Sub SaveButton_Click(sender As Object, e As EventArgs) Handles SaveButton.Click
        If Stock.Text = "IN" Then
            SqlQuery("insert into suppliesinouttbl(SupplyID,Stock,Quantity,DateStock) values('" & Label1.Text & "','IN','" & STIN.Text & "','" & Format(Date.Now, "yyyy-MM-dd") & "')")
            stotal = Val(Quantity.Text) + Val(STIN.Text)
            SqlQuery("update suppliestbl set quantity='" & stotal & "' where supplyid='" & Label1.Text & "'")
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Stock IN Successfully.'); window.location='" + Request.ApplicationPath + "StockINOUT.aspx';", True)
        ElseIf Stock.Text = "OUT" Then
            If Val(STIN.Text) > Val(Quantity.Text) Then
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Stock OUT higher than the Quantity.'); window.location='" + Request.ApplicationPath + "StockINOUT.aspx';", True)
            Else
                SqlQuery("insert into suppliesinouttbl(SupplyID,Stock,Quantity,DateStock) values('" & Label1.Text & "','OUT','" & STIN.Text & "','" & Format(Date.Now, "yyyy-MM-dd") & "')")
                stotal = Val(Quantity.Text) - Val(STIN.Text)
                SqlQuery("update suppliestbl set quantity='" & stotal & "' where supplyid='" & Label1.Text & "'")
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Stock OUT Successfully.'); window.location='" + Request.ApplicationPath + "StockINOUT.aspx';", True)
            End If
        End If
    End Sub
End Class
