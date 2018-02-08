<%@ Page Title="Client List" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ClientList.aspx.vb" Inherits="ClientList" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
           <style type="text/css">
            .MyButton 
               { 
                   background-color: #e7e7e7;
                   color: black;
                   font-size: 13px;
                   padding: 8px 12px;
                   border-radius: 4px;
               }

           </style>

           <style type="text/css">
            .rgMasterTable
            {
                font-size: medium !important;
                font-family: 'Century Gothic' !important;
    }
               .auto-style1 {
                   width: 824px;
               }
               .auto-style2 {
                   left: 0px;
                   top: 4px;
               }
           </style>
           <h2 style="font-family: 'Century Gothic'; font-weight: bold;" class ="text-center">CLIENT LIST</h2>
    <table style="width:100%; height: 76px;">
        <tr>
            <td style="width: 100px; height: 41px;"></td>
            <td style="width: 88px; height: 41px;">
          
            </td>
            <td style="height: 41px" colspan="2"></td>
        </tr>
        <tr>
            <td style="width: 100px">&nbsp;</td>
            <td style="width: 88px"> <telerik:RadLabel ID="RadLabel1" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="False" Font-Names="Century Gothic" Font-Size="Medium">
                    Search:</telerik:RadLabel></td>
            <td class="auto-style1">
                <telerik:RadTextBox ID="RadTextBox1" Runat="server" Height="28px" Skin="Bootstrap" Width="301px" AutoPostBack="True" Font-Names="Century Gothic" Font-Size="Medium">
                </telerik:RadTextBox>
            </td>
            <td>
                   <strong>
                <telerik:RadButton ID="RadButton1" runat="server" Font-Bold="True" Font-Names="Century Gothic" Height="25px" style="font-size: 16px; margin-top: 0px" Text="Print" Width="117px" Skin="Bootstrap" BorderColor="#666666" CssClass="auto-style2" Target="_blank">
                </telerik:RadButton>
                </strong>
            </td>
        </tr>
    </table>
     <br />
    <center style="width: 100%">
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" 
        GroupPanelPosition="Top" Skin="Bootstrap" 
        Width="1158px" Font-Names="Century Gothic" Font-Size="Medium">

<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <AlternatingItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Century Gothic" />
        <MasterTableView Font-Names="Century Gothic">
            <Columns>
                <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                    <ItemTemplate>
                            <asp:Label runat="server" ID="lblRowNumber" Text='<%# Container.DataSetIndex+1 %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle Width="50px"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />

                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="LastName" 
                    FilterControlAltText="Filter column column" HeaderText="Last Name" 
                    ReadOnly="True" UniqueName="column">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FirstName" 
                    FilterControlAltText="Filter column1 column" HeaderText="First Name" 
                    ReadOnly="True" UniqueName="column1">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MiddleName" 
                    FilterControlAltText="Filter column2 column" HeaderText="Middle Name" 
                    ReadOnly="True" UniqueName="column2">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ExamDate" 
                    FilterControlAltText="Filter column5 column" HeaderText="Last Visit" 
                    ReadOnly="True" UniqueName="ExamDate" EmptyDataText="No records to display.">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <EditItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <FooterStyle Font-Names="Century Gothic" />
            <HeaderStyle Font-Names="Century Gothic" />
        <CommandItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Century Gothic" />
        <ActiveItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Century Gothic" />
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Century Gothic" />
            <PagerStyle Font-Names="Century Gothic" />
            <SelectedItemStyle Font-Names="Century Gothic" />
    </telerik:RadGrid>
    </center>
</asp:Content>

