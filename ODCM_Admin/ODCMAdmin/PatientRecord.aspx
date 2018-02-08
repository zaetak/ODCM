<%@ Page Title="Patient Record" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="PatientRecord.aspx.vb" Inherits="PatientRecord" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <style type ="text/css">

          .ModalBackground
{
    background-color:Gray;
    filter: alpha(opacity=70);
    opacity: 0.7;
    z-index: 999;
    
}
        .innerTableCell
        {
          text-align:center;
          width:450px;
          cursor:pointer;
        }
        .Border1{
            border-right: thick solid #000000;
           
            }
          .MyButton 
   { 
       background-color: #e7e7e7;
       color: black;
       font-size: 13px;
       padding: 8px 12px;
       border-radius: 4px;
   } 
        </style>
    <script type="text/javascript">
        (function (global, undefined) {
            // We need to keep the last tooltip with ShowEvent="OnFocus", as it might be closed
            // by the time the beforeunload event fires, but its target element might still have the
            // focus.
            lastActiveToolTip = null;

            global.OnClientShow = function (sender, args) {
                lastActiveToolTip = sender;
            };

            global.Hilite = function (me, focus) {
                me.style.backgroundColor = false != focus ? "#ffffcc" : "white";
            };

            // When ShowEvent="OnFocus", the RadToolTip handles the blur event of the target element.
            // In case you set the focus on that element, e.g. click inside one of the TextBoxes, 
            // and then immediately close the browser window, the blur event is fired before the 
            // unload. Therefore, the framework tries to execute all handlers for the blur event.
            // However, at this point the document may have unloaded and we will get an "Unspecified error".
            // As the code that handles this is part of the ajax framework, we can workaround the problem
            // in the beforeunload handler - detach the handlers for the active tooltip.
            function beforeunload() {
                var activeTooltip = Telerik.Web.UI.RadToolTip.getCurrent();
                if (!activeTooltip) activeTooltip = lastActiveToolTip;
                if (activeTooltip) {
                    var targetElement = activeTooltip.get_targetControl();
                    activeTooltip._registerMouseHandlers(targetElement, false);
                }
            };

            if (Sys.Browser.agent == Sys.Browser.InternetExplorer) {
                global.attachEvent('onbeforeunload', beforeunload);
            }

        })(window);

        function callBackFn(arg) {
            window.location.href = "PatientRecord.aspx";
            return false;
        }
  
      </script>
       <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager2" Font-Names="Century Gothic" runat="server"/>
     
    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <h2 style="font-family: 'Century Gothic'; font-weight: bold;" class ="text-center">PATIENT CHART</h2>
    <telerik:RadToolTipManager RenderMode="Lightweight" runat="server" ID="RadToolTip5" ShowEvent="OnMouseOver" OnClientShow="OnClientShow"
            Skin="Default" ShowDelay="200" AutoCloseDelay="3000" Width="150px" Position="TopRight"
            RelativeTo="Element">
            <TargetControls>
                <telerik:ToolTipTargetControl TargetControlID="teeth55"></telerik:ToolTipTargetControl>
            </TargetControls>
        </telerik:RadToolTipManager>
<asp:Table ID="Temporary" runat="server" Width="100%" Height="100px">
                   <asp:TableRow>
                   <asp:TableCell Width="50%" CssClass="Border1">
                   <asp:Table ID="Table3" runat="server" Width="100%" Height="50px"  align = "right">
                   <asp:TableRow>
                    <asp:TableCell ID="teeth55" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                          <a runat="server" id="sample55">55</a>
                          <img src="../Images/teeth/4a.png">
                  </asp:TableCell>
                   <asp:TableCell ID="teeth54" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                                <a runat="server" id="sample54">54</a>
                                <img src="../Images/teeth/5a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth53" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                                <a runat="server" id="sample53">53</a>
                                <img src="../Images/teeth/6a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth52" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample52">52</a>
                        <img src="../Images/teeth/7a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth51" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample51">51</a>
                        <img src="../Images/teeth/8a.png">
                    </asp:TableCell> 
                   </asp:TableRow>
                   <asp:TableRow>
                    <asp:TableCell ID="teeth85" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample85">85</a>
                        <img src="../Images/teeth/4b.png">
                    </asp:TableCell>
                   <asp:TableCell ID="teeth84" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample84">84</a>
                        <img src="../Images/teeth/5b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth83" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample83">83</a>
                        <img src="../Images/teeth/6b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth82" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample82">82</a>
                        <img src="../Images/teeth/7b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth81" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample81">81</a>
                        <img src="../Images/teeth/8b.png">
                    </asp:TableCell> 
                   </asp:TableRow>
                    </asp:Table>
                    </asp:TableCell>
                    <asp:TableCell>
                   <asp:Table ID="Table4" runat="server" Width="100%"  Height="50px">
                     <asp:TableRow>
                    <asp:TableCell ID="teeth61" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample61">61</a>
                        <img src="../Images/teeth/9a.png">
                    </asp:TableCell>
                   <asp:TableCell ID="teeth62" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample62">62</a>
                        <img src="../Images/teeth/10a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth63" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample63">63</a>
                        <img src="../Images/teeth/11a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth64" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample64">64</a>
                        <img src="../Images/teeth/12a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth65" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample65">65</a>
                        <img src="../Images/teeth/13a.png">
                    </asp:TableCell> 
                   </asp:TableRow>
                        <asp:TableRow>
                    <asp:TableCell ID="teeth71" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample71">71</a>
                        <img src="../Images/teeth/9b.png">
                    </asp:TableCell>
                   <asp:TableCell ID="teeth72" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample72">72</a>
                        <img src="../Images/teeth/10b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth73" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample73">73</a>
                        <img src="../Images/teeth/11b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth74" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample74">74</a>
                        <img src="../Images/teeth/12b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth75" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample75">75</a>
                        <img src="../Images/teeth/13b.png">
                    </asp:TableCell> 
                   </asp:TableRow>
                   </asp:Table>
                    </asp:TableCell>
                   </asp:TableRow>
                   </asp:Table>
    <br />
<asp:Table ID="Permanent" runat="server" Width="100%" Height="150px" CellPadding="1" CellSpacing="1">
                   <asp:TableRow Height="100%">
                   <asp:TableCell Width="50%" CssClass="Border1" Height="100%">
                   <asp:Table ID="Table2" runat="server" Width="90%" Height="100%"  align = "right">
                   <asp:TableRow Height="100%">
                    <asp:TableCell ID="teeth18" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell" Height="100%">
                        <a runat="server" id="sample18">18</a>
                        <img src="../Images/teeth/1a.png">
                    </asp:TableCell>
                   <asp:TableCell ID="teeth17" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample17">17</a>
                        <img src="../Images/teeth/2a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth16" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample16">16</a>
                        <img src="../Images/teeth/3a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth15" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample15">15</a>
                        <img src="../Images/teeth/4a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth145" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample14">14</a>
                        <img src="../Images/teeth/5a.png">
                    </asp:TableCell> 
                    <asp:TableCell ID="teeth13" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample13">13</a>
                        <img src="../Images/teeth/6a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth12" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample12">12</a>
                        <img src="../Images/teeth/7a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth11" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample11">11</a>
                        <img src="../Images/teeth/8a.png">
                    </asp:TableCell> 
                   </asp:TableRow>
                    <asp:TableRow>
                    <asp:TableCell ID="teeth48" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample48">48</a>
                        <img src="../Images/teeth/1b.png">
                    </asp:TableCell>
                   <asp:TableCell ID="teeth47" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample47">47</a>
                        <img src="../Images/teeth/2b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth46" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample46">46</a>
                        <img src="../Images/teeth/3b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth45" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample45">45</a>
                        <img src="../Images/teeth/4b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth44" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample44">44</a>
                        <img src="../Images/teeth/5b.png">
                    </asp:TableCell> 
                    <asp:TableCell ID="teeth43" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample43">43</a>
                        <img src="../Images/teeth/6b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth42" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample42">42</a>
                        <img src="../Images/teeth/7b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth41" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample41">41</a>
                        <img src="../Images/teeth/8b.png">
                    </asp:TableCell> 
                   </asp:TableRow>
                    </asp:Table>
                    </asp:TableCell>
                    <asp:TableCell>
                   <asp:Table ID="Table5" runat="server" Width="90%" Height="100%">
                     <asp:TableRow Height="100%">
                    <asp:TableCell ID="teeth21" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample21">21</a>
                        <img src="../Images/teeth/9a.png">
                    </asp:TableCell>
                   <asp:TableCell ID="teeth22" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample22">22</a>
                        <img src="../Images/teeth/10a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth23" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample23">23</a>
                        <img src="../Images/teeth/11a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth24" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample24">24</a>
                        <img src="../Images/teeth/12a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth25" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample25">25</a>
                        <img src="../Images/teeth/13a.png">
                    </asp:TableCell> 
                    <asp:TableCell ID="teeth26" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample26">26</a>
                        <img src="../Images/teeth/14a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth27" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample27">27</a>
                        <img src="../Images/teeth/15a.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth28" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample28">28</a>
                        <img src="../Images/teeth/16a.png">
                    </asp:TableCell> 
                   </asp:TableRow>
                        <asp:TableRow>
                    <asp:TableCell ID="teeth31" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample31">31</a>
                        <img src="../Images/teeth/9b.png">
                    </asp:TableCell>
                   <asp:TableCell ID="teeth32" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample32">32</a>
                        <img src="../Images/teeth/10b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth33" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample33">33</a>
                        <img src="../Images/teeth/11b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth34" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)" CssClass ="innerTableCell">
                        <a runat="server" id="sample34">34</a>
                        <img src="../Images/teeth/12b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth35" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)"  CssClass ="innerTableCell">
                        <a runat="server" id="sample35">35</a>
                        <img src="../Images/teeth/13b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth36" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)"  CssClass ="innerTableCell">
                        <a runat="server" id="sample36">36</a>
                        <img src="../Images/teeth/14b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth37" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)"  CssClass ="innerTableCell">
                        <a runat="server" id="sample37">37</a>
                        <img src="../Images/teeth/15b.png">
                    </asp:TableCell>
                    <asp:TableCell ID="teeth38" runat="server" onfocus="Hilite(this)" onblur="Hilite(this, false)"  CssClass ="innerTableCell">
                        <a runat="server" id="sample38">38</a>
                        <img src="../Images/teeth/16b.png">
                    </asp:TableCell> 
                   </asp:TableRow>
                   </asp:Table>
                    </asp:TableCell>
                   </asp:TableRow>
                   </asp:Table>
    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <telerik:RadLabel ID="RadLabel2" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Large">
        PATIENT PROFILE
    </telerik:RadLabel>
    <br />
    <br />
<table  style="width:100%;">
        <tr>
            <td style="width: 71px; height: 37px;"></td>
            <td class="text-right" style="width: 223px; height: 37px;">
                <telerik:RadLabel ID="RadLabel4" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Last Name:</telerik:RadLabel>
            </td>
            <td style="width: 235px; height: 37px">
                <telerik:RadLabel ID="LastName" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap"></telerik:RadLabel>
            </td>
            <td class="text-right" style="width: 208px; height: 37px;">
                <telerik:RadLabel ID="RadLabel7" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Sex:</telerik:RadLabel>
            </td>
            <td style="height: 37px; width: 302px;">
                <telerik:RadLabel ID="Sex" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
            </td>
            <td style="height: 37px"></td>
        </tr>
        <tr>
            <td style="width: 71px; height: 37px;"></td>
            <td class="text-right" style="width: 223px; height: 37px;">
                <telerik:RadLabel ID="RadLabel5" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    First Name:</telerik:RadLabel>
            </td>
            <td style="width: 235px; height: 37px">
                <telerik:RadLabel ID="FirstName" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
            </td>
            <td style="width: 208px; height: 37px;" class="text-right">
                <telerik:RadLabel ID="RadLabel8" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Nickname:</telerik:RadLabel>
            </td>
            <td style="width: 302px; height: 37px;">
                <telerik:RadLabel ID="Nickname" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
            </td>
            <td style="height: 37px"></td>
        </tr>
        <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 223px; height: 37px;">
                <telerik:RadLabel ID="RadLabel6" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Middle Name:</telerik:RadLabel>
            </td>
            <td style="width: 235px; height: 37px">
                <telerik:RadLabel ID="MiddleName" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel9" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Home No.:</telerik:RadLabel>
            </td>
            <td style="width: 302px">
                <telerik:RadLabel ID="HomeNo" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 223px; height: 37px;">
                <telerik:RadLabel ID="RadLabel10" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Birth Date:</telerik:RadLabel>
            </td>
            <td style="width: 235px; height: 37px">
                <telerik:RadLabel ID="Birthdate" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel11" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Office No.:</telerik:RadLabel>
            </td>
            <td style="width: 302px">
                <telerik:RadLabel ID="OfficeNo" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
            </td>
            <td>&nbsp;</td>
        </tr>
          <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 223px; height: 37px;">
                <telerik:RadLabel ID="RadLabel12" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Age:</telerik:RadLabel>
            </td>
            <td style="width: 235px; height: 37px">
                <telerik:RadLabel ID="Age" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel13" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Fax No.:</telerik:RadLabel>
              </td>
            <td style="width: 302px">
                <telerik:RadLabel ID="FaxNo" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
              </td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 223px; height: 37px;">
                <telerik:RadLabel ID="RadLabel14" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Religion:</telerik:RadLabel>
            </td>
            <td style="width: 235px; height: 37px">
                <telerik:RadLabel ID="Religion" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel15" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Mobile No.:</telerik:RadLabel>
              </td>
            <td style="width: 302px">
                <telerik:RadLabel ID="PhoneNumber" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
              </td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 223px; height: 37px;">
                <telerik:RadLabel ID="RadLabel16" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Nationality</telerik:RadLabel>
            </td>
            <td style="width: 235px; height: 37px">
                <telerik:RadLabel ID="Nationality" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel17" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Email Address:</telerik:RadLabel>
              </td>
            <td style="width: 302px">
                <telerik:RadLabel ID="EmailAddr" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
              </td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 223px; height: 37px;">
                <telerik:RadLabel ID="RadLabel18" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Home Address:</telerik:RadLabel>
            </td>
            <td style="width: 235px; height: 37px">
                <telerik:RadLabel ID="HomeAddr" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel19" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Effective Date:</telerik:RadLabel>
              </td>
            <td style="width: 302px">
                <telerik:RadLabel ID="EffectiveDate" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
              </td>
            <td>&nbsp;</td>
        </tr>
                 <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 223px; height: 37px;">
                <telerik:RadLabel ID="RadLabel20" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Occupation:</telerik:RadLabel>
            </td>
            <td style="width: 235px; height: 37px">
                <telerik:RadLabel ID="Occupation" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel21" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Dental Insurance:</telerik:RadLabel>
              </td>
            <td style="width: 302px">
                <telerik:RadLabel ID="DentalInsurance" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
              </td>
            <td>&nbsp;</td>
        </tr>
                 <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 223px; height: 37px; font-size: 16px;">
                <strong>For Minors:</strong></td>
            <td style="width: 235px; height: 37px">
                &nbsp;</td>
            <td style="width: 208px" class="text-right">
                &nbsp;</td>
            <td style="width: 302px">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
                 <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 223px; height: 37px;">
                <telerik:RadLabel ID="RadLabel23" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Guardian&#39;s Name</telerik:RadLabel>
            </td>
            <td style="width: 235px; height: 37px">
                <telerik:RadLabel ID="Guardian" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel24" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Occupation:</telerik:RadLabel>
              </td>
            <td style="width: 302px">
                <telerik:RadLabel ID="GOccupation" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    </telerik:RadLabel>
              </td>
            <td>&nbsp;</td>
        </tr>
                 </table>
    <br />
      <center>
        <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                    <telerik:AjaxUpdatedControl ControlID="RadWindowManager1" />
                    <%--<telerik:AjaxUpdatedControl ControlID="RadInputManager1" />--%>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" Skin="Bootstrap" />

  <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" AllowSorting="True" Width="90%" OnNeedDataSource="RadGrid1_NeedDataSource" AllowPaging="True" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Skin="Bootstrap" Font-Names="Century Gothic">
            <FooterStyle Font-Names="Century Gothic" />
            <HeaderStyle Font-Names="Century Gothic" />
            <CommandItemStyle Font-Names="Century Gothic" />
            <ActiveItemStyle Font-Names="Century Gothic" />
            <ItemStyle Font-Names="Century Gothic"/>
            <PagerStyle Mode="NextPrevAndNumeric" Font-Names="Century Gothic"></PagerStyle>
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
    <MasterTableView Width="100%" CommandItemDisplay="Top"
                DataKeyNames="ID" InsertItemDisplay="Top"
                InsertItemPageIndexAction="ShowItemOnFirstPage">
                <CommandItemSettings ShowAddNewRecordButton="false" />
                <Columns>
                    <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                        <ItemTemplate>
                                <asp:Label runat="server" ID="lblRowNumber" Text='<%# Container.DataSetIndex + 1 %>'></asp:Label>
                         </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="ID" 
                    FilterControlAltText="Filter column column" HeaderText="Last Name" 
                    ReadOnly="True" UniqueName="ID" Display="false">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="TeethID" 
                    FilterControlAltText="Filter column column" HeaderText="Teeth Number" 
                    ReadOnly="True" UniqueName="TeethID">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Service" 
                    FilterControlAltText="Filter column1 column" HeaderText="Service" 
                    ReadOnly="True" UniqueName="column1">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Diagnosis" 
                    FilterControlAltText="Filter column2 column" HeaderText="Diagnosis" 
                    ReadOnly="True" UniqueName="column2">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="ExamDate" 
                    FilterControlAltText="Filter column2 column" HeaderText="Date" 
                    ReadOnly="True" UniqueName="column2">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                   <%--  <telerik:GridButtonColumn HeaderText="View History" ItemStyle-Width="170px" ButtonType="ImageButton" CommandName="View" ImageUrl="~/Images/View.png">
                     <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </telerik:GridButtonColumn>--%>
            </Columns>
         </MasterTableView>
            <SelectedItemStyle Font-Names="Century Gothic" />
<FilterMenu RenderMode="Lightweight"></FilterMenu>
<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
    </telerik:RadGrid>
    </center>
     <asp:Button ID="Button1" runat="server" 
                    style="font-family: 'Segoe UI'; font-size: medium;display:none;" Text="Add" Width="93px" 
                    Height="33px"/>
      <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button1" PopupControlID="ModalPanel"
                                CancelControlID="CloseButton" BackgroundCssClass="ModalBackground">
                        </asp:ModalPopupExtender>

    <asp:Panel ID="ModalPanel" runat="server" Width="74%" 
                    style="border: 3px solid Black; background-color:#FFFFFF; padding-top:5px; padding-left:5px;padding-right:5px;padding-bottom:5px;display:none;" 
                    Height="655px">
                   <iframe style=" width: 100%; height: 600px;overflow:auto" id="ifrm1" runat="server"></iframe>
        <br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <telerik:RadButton ID="CloseButton" runat="server" Font-Bold="True" Skin="Bootstrap" Text="Close" Width="84px">
                                </telerik:RadButton>
</asp:Panel>
</asp:Content>

