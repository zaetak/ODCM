<%@ Page Title="Pending Client" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ApproveClient.aspx.vb" Inherits="ApproveClient" %>
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
            width: 789px;
        }
        .auto-style2 {
            width: 100%;
            height: 76px;
        }
    </style>

    <script type="text/javascript">
        function callBackFn(arg) {
            window.location.href = "/Default.aspx";
            return false;
        }
    </script>
    <h2 style="font-family: 'Century Gothic'"><%: Title %>.</h2>
    <table class="auto-style2">
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
           <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" EnableShadow="true">
        </telerik:RadWindowManager>
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" 
        GroupPanelPosition="Top" Skin="Bootstrap" 
        style="font-family: 'Segoe UI'; font-size: medium; text-align: center" 
        Width="1158px" AllowPaging="True" Font-Names="Century Gothic" Font-Size="Medium">

<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <AlternatingItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Century Gothic" />
        <MasterTableView>
            <Columns>
                <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">

                <ItemTemplate>
                    <asp:Label runat="server" ID="lblRowNumber" Text='<%# Container.DataSetIndex+1 %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle Width="50px"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />

                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="ClientID" 
                    FilterControlAltText="Filter column column" HeaderText="ClientID" 
                    ReadOnly="True" UniqueName="ID" Display="false">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LastName" 
                    FilterControlAltText="Filter column column" HeaderText="Last Name" 
                    ReadOnly="True" UniqueName="column">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FirstName" 
                    FilterControlAltText="Filter column1 column" HeaderText="First Name" 
                    ReadOnly="True" UniqueName="column1">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MiddleName" 
                    FilterControlAltText="Filter column2 column" HeaderText="Middle Name" 
                    ReadOnly="True" UniqueName="column2">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="UserName" 
                    FilterControlAltText="Filter column5 column" HeaderText="User Name" 
                    ReadOnly="True" UniqueName="column5">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn CommandName="Select"
                    FilterControlAltText="Filter column8 column" HeaderText="Approve as Client" 
                    UniqueName="column8" Text="Approve" ButtonType="PushButton">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridButtonColumn>
                 <telerik:GridButtonColumn CommandName="Edit"
                    FilterControlAltText="Filter column8 column" HeaderText="Approve as Administrator" 
                    UniqueName="column9" Text="Approve" ButtonType="PushButton">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridButtonColumn>
                <telerik:GridBoundColumn FilterControlAltText="Filter column3 column" HeaderText="id" UniqueName="column3" DataField="ClientID" Visible="False">
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
    </telerik:RadGrid>
    </center>
  
</asp:Content>

