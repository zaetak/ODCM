<%@ Page Title="Register" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.vb" Inherits="Account_Register" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <style>
        .DWordSection1 {
          overflow-y: scroll;
          height: 300px;
          width: 100%;
          border: 1px solid #DDD;
          padding: 10px;
        }

        .ScrollStyle
        {
            max-height: 150px;
            overflow-y: scroll;
        }

    </style>
    <h2 style="font-family: 'Century Gothic'; font-weight: bold;"><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <script type="text/javascript">
        function callBackFn(arg) {
            window.location.href = "Register.aspx";
            return false;
        }
        function callBackFn1(arg) {
            window.location.href = "Login.aspx";
            return false;
        }
        function Check_Clicked(sender, e) {
            e.IsValid = jQuery(".AcceptedAgreement input:checkbox").is(':checked');
        }
    </script>
    <div class="form-horizontal">
        <h4 style="font-family: 'Century Gothic'; font-size: x-large;">Create an account.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" Font-Names="Century Gothic" />
        <div class="form-group">
             <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label" Font-Names="Century Gothic" Font-Size="Medium">Last Name:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="LastName" CssClass="form-control" Font-Names="Century Gothic" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName"
                    CssClass="text-danger" ErrorMessage="The last name field is required." Font-Names="Century Gothic" />
            </div>
        </div>
         <div class="form-group">
          <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label" Font-Names="Century Gothic" Font-Size="Medium">First Name:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" Font-Names="Century Gothic" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
                    CssClass="text-danger" ErrorMessage="The first name field is required." Font-Names="Century Gothic" />
            </div>
        </div>
         <div class="form-group">
             <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label" Font-Names="Century Gothic" Font-Size="Medium">Middle Name:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="MiddleName" CssClass="form-control" Font-Names="Century Gothic" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MiddleName"
                    CssClass="text-danger" ErrorMessage="The middle name field is required." Font-Names="Century Gothic" />
            </div>
        </div>

        <div class="form-group">
             <asp:Label runat="server" AssociatedControlID="PhoneNumber" CssClass="col-md-2 control-label" Font-Names="Century Gothic" Font-Size="Medium">Contact Number:   (+63)</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control" Font-Names="Century Gothic" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber"
                    CssClass="text-danger" ErrorMessage="The contact number field is required." Font-Names="Century Gothic" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label" Font-Names="Century Gothic" Font-Size="Medium">User Name:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" Font-Names="Century Gothic" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="The user name field is required." Font-Names="Century Gothic" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label" Font-Names="Century Gothic" Font-Size="Medium">Password:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" Font-Names="Century Gothic" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." Font-Names="Century Gothic" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label" Font-Names="Century Gothic" Font-Size="Medium">Confirm password:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" Font-Names="Century Gothic" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." Font-Names="Century Gothic" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-1 col-md-10">
                <div class=DWordSection1>

                    <p class3DMsoNormal style3D'text-align:justify'><b style3D'mso-bidi-font
                    -weight:
                    normal'><span style3D'font-size:12.0pt;line-height:107%;font-family:"Centu
                    ry Gothic","sans-serif"'>INFORMED
                    CONSENT<o:p></o:p></span></b></p>

                    <p class3DMsoNormal style3D'text-align:justify'><b style3D'mso-bidi-font
                    -weight:
                    normal'><span style3D'font-size:12.0pt;line-height:107%;font-family:"Centu
                    ry Gothic","sans-serif"'>TREATMENT
                    TO BE DONE: </span></b><span style3D'font-size:12.0pt;line-height:107%;
                    font-family:"Century Gothic","sans-serif"'>I understand and consent to have
                     any
                    treatment done by the dentist after the procedure, the risks and benefits a
                    nd
                    cost have been fully explained. These treatments include, but are not limit
                    ed
                    to, x-rays, cleanings, <span class3DSpellE>periodotal</span> treatments,
                    filling, crowns, <span class3DGramE>bridges</span>, all types of extraction, <span
                    class3DSpellE>rootcanals</span>, and/or dentures, local <span class3DSpel
                    lE>anesthetics</span>
                    and surgical cases.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><span
                    style3D'mso-spacerun:yes'> </span><b style3D'mso-bidi-font-weight:normal'
                    >DRUGS
                    AND MEDICATIONS: </b>I understand that antibiotics, analgesics and other
                    medications can cause allergic reactions like redness and swelling of tissu
                    es,
                    pain, itching, vomiting and/or anaphylactic shock.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><b style3D'mso-bidi-font
                    -weight:
                    normal'><span style3D'font-size:12.0pt;line-height:107%;font-family:"Centu
                    ry Gothic","sans-serif"'>CHANGES
                    IN TREATMENT PLAN: </span></b><span style3D'font-size:12.0pt;line-height:1
                    07%;
                    font-family:"Century Gothic","sans-serif"'>I understand that during treatme
                    nt
                    if may be necessary to change/add procedures because of conditions found wh
                    ile
                    working on the teeth that was not discovered during examination. For exampl
                    e,
                    root canal therapy may be needed following routine restorative procedures. I
                    give my permission to the dentist to make any/all changes and additions as
                    necessary with responsibility to pay all the costs agreed.<o:p></o:p></span
                    ></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><b style3D'mso-bidi-font
                    -weight:
                    normal'><span style3D'font-size:12.0pt;line-height:107%;font-family:"Centu
                    ry Gothic","sans-serif"'>RADIOGRAPH:
                    </span></b><span style3D'font-size:12.0pt;line-height:107%;font-family:"Ce
                    ntury Gothic","sans-serif"'>I
                    understand that an x-ray shot or a radiograph maybe necessary as part of
                    diagnostic aid to come up with tentative diagnosis of my Dental problem and
                     to
                    make a good treatment plan, but this will not give me a 100% assurance for 
                    the
                    accuracy of the treatment since all dental treatments are subject to
                    unpredictable complications that later on may lead to sudden changes and
                    additions as necessary with my responsibility to pay all the costs agreed.
                    </o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><b style3D'mso-bidi-font
                    -weight:
                    normal'><span style3D'font-size:12.0pt;line-height:107%;font-family:"Centu
                    ry Gothic","sans-serif"'>REMOVAL
                    OF TEETH: </span></b><span style3D'font-size:12.0pt;line-height:107%;font-
                    family:
                    "Century Gothic","sans-serif"'>I understand that alternatives to tooth remo
                    val
                    (root canal therapy, crown and periodontal surgery, etc.) and I completely
                    understand these alternatives, including their risk and benefits prior to
                    authorizing the dentist to remove teeth and any other structures necessary 
                    for
                    reasons above. I understand the removing teeth does not always remove all t
                    he
                    infections, if present, and it may be necessary to have further treatment. I
                    understand the risk involved in having teeth removed, such as pain swelling,
                    spread of infection, dry socket, fractured jaw, loss of feeling on the teet
                    h,
                    lips tongue and surrounding tissue that can last for an indefinite period of
                    time. I understand that I may need further treatment under a specialist if
                    complications arise during or following treatment.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><b style3D'mso-bidi-font
                    -weight:
                    normal'><span style3D'font-size:12.0pt;line-height:107%;font-family:"Centu
                    ry Gothic","sans-serif"'>CROWNS
                    (CAPS) AND BRIDGES: </span></b><span style3D'font-size:12.0pt;line-height:
                    107%;
                    font-family:"Century Gothic","sans-serif"'>Preparing a tooth may irritate t
                    he
                    nerve tissue in the <span class3DSpellE>center</span> of the tooth, leavin
                    g the
                    tooth extra sensitive to heat, cold and pressure. Treating such irritation 
                    may
                    involve using special toothpastes, mouth rinses or root canal therapy. I
                    understand that sometimes it is not possible to match the <span class3DSpe
                    llE>color</span>
                    of natural teeth exactly with artificial teeth. I further understand that I
                     may
                    be wearing temporary crowns, which may come off easily and that I must be
                    careful to ensure that they are kept on until the permanent crowns are
                    delivered. It is my responsibility to return for permanent <span class3DSp
                    ellE>cernentation</span>
                    within 20 days from tooth preparation, as excessive days’ delay may allow f
                    or
                    tooth movement, which may necessitate a remake of the crown, bridge/cap. I
                    understand there will be additional charges for remakes due to my delaying 
                    of
                    permanent cementation, and I realize that final opportunity to make changes
                     in
                    my new crown, bridges or cap (including shape, fit, size and <span
                    class3DSpellE>color</span>) will be before permanent cementation.<o:p></o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><b style3D'mso-bidi-font
                    -weight:
                    normal'><span style3D'font-size:12.0pt;line-height:107%;font-family:"Centu
                    ry Gothic","sans-serif"'>ENDODONTICS
                    (ROOT CANAL): </span></b><span style3D'font-size:12.0pt;line-height:107%;
                    font-family:"Century Gothic","sans-serif"'>I understand there is no guarant
                    ee
                    that a root canal treatment will save a tooth and that complications can oc
                    cur
                    from the treatment and that occasionally root canal feeling material may ex
                    tend
                    through the tooth which does not necessarily effect the success of the
                    treatment. I understand that endodontic files and drills are very fine
                    instruments and stresses vented in their manufacture and calcifications pre
                    sent
                    in teeth can cause them to break during use. I understand that referral to 
                    the <span
                    class3DSpellE>endodontist</span> for additional treatments may be necessary
                    following any root canal treatment and I agree that I am responsible for any
                    additional cost for treatment performed by the <span class3DSpellE>endodon
                    tist</span>.
                    I understand that a tooth may <span class3DSpellE>required</span> removal 
                    in
                    spite of all efforts to save it.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><b style3D'mso-bidi-font
                    -weight:
                    normal'><span style3D'font-size:12.0pt;line-height:107%;font-family:"Centu
                    ry Gothic","sans-serif"'>PERIODONTAL
                    DISEASE: </span></b><span style3D'font-size:12.0pt;line-height:107%;font-f
                    amily:
                    "Century Gothic","sans-serif"'>I understand that periodontal disease is a
                    serious condition causing gum and bone inflammation and/or loss and that can
                    lead eventually to the loss of my teeth. I understand the alternative treat
                    ment
                    plant to correct periodontal disease, including gum surgery tooth extractio
                    ns
                    with or without replacement. I understand that undertaking any dental
                    procedures may have future adverse effect on my periodontal conditions.<o:p
                    ></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><b style3D'mso-bidi-font
                    -weight:
                    normal'><span style3D'font-size:12.0pt;line-height:107%;font-family:"Centu
                    ry Gothic","sans-serif"'>FILLING:
                    </span></b><span style3D'font-size:12.0pt;line-height:107%;font-family:"Ce
                    ntury Gothic","sans-serif"'>I
                    understand that care must be exercised in chewing on fillings, especially
                    during the first 24 hours to avoid breakage. I understand that a more exten
                    sive
                    filling or a crown may be required, as additional decay or fracture may bec
                    ome
                    evident after initial excavation. I understand that significant sensitivity
                     is
                    a common, but usually temporary, after-effect of a newly place filling. I f
                    urther
                    understand that filling a tooth may irritate the nerve tissue creating
                    sensitivity and treating such sensitivity could require root canal therapy 
                    or
                    extractions.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><b style3D'mso-bidi-font
                    -weight:
                    normal'><span style3D'font-size:12.0pt;line-height:107%;font-family:"Centu
                    ry Gothic","sans-serif"'>DENTURES:
                    </span></b><span style3D'font-size:12.0pt;line-height:107%;font-family:"Ce
                    ntury Gothic","sans-serif"'>I
                    understand that wearing of dentures can be difficult. Sore spots, altered s
                    peech
                    and difficulty in eating are common problems. Immediate denture (placement 
                    of
                    denture immediately after extractions) may be painful. Immediate denture may
                    require considerable adjusting and several relines. I understand that it is
                     my
                    responsibility to return for delivery of dentures. I understand that failur
                    e to
                    keep my delivery appointment may result in poorly fitted dentures. If a rem
                    arks
                    is required due to my delays of more than 30 days, there will be additional
                    charges. A permanent reline will be needed later, which is not included in 
                    the
                    initial fee. I understand that all adjustment or alteration of any kind this
                    initial period is subject to charges.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><b style3D'mso-bidi-font
                    -weight:
                    normal'><span style3D'font-size:12.0pt;line-height:107%;font-family:"Centu
                    ry Gothic","sans-serif"'><o:p>&nbsp;</o:p></span></b></p>

                    <p class3DMsoNormal style3D'text-align:justify'><b style3D'mso-bidi-font
                    -weight:
                    normal'><span style3D'font-size:12.0pt;line-height:107%;font-family:"Centu
                    ry Gothic","sans-serif"'>I
                    understand that dentistry is not an exact science and that no dentist can
                    properly guarantee accurate results all the time.</span></b><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'><span
                    style3D'mso-spacerun:yes'>  </span><o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'>I hereby author
                    ize
                    any of the doctors/ dental auxiliaries to proceed with and perform the dent
                    al
                    restoration and treatment as explained to me. I understand that these are
                    subject to modification depending on diagnosable circumstances that may ari
                    se
                    during the course of treatment. I understand that regardless of any dental
                    insurance coverage I may have. I am responsible for payment of dental fees,
                     I
                    agree to pay any attorney’s fees, collection fee, or court costs that may b
                    e incurred
                    to satisfy any obligation to this office. All treatment was properly explai
                    ned
                    to me &amp; any untoward circumstances that they arise during the procedure,
                    the attending dentist will not be held liable since it is my free will, with
                    full trust and confidence in him/her, to undergo dental treatment under his
                    /her
                    care. <o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal align3Dcenter style3D'text-align:center'><b style3D
                    'mso-bidi-font-weight:
                    normal'><span style3D'font-size:12.0pt;line-height:107%;font-family:"Centu
                    ry Gothic","sans-serif"'>ORTHODONTIC
                    TREATMENT CONTRACT<o:p></o:p></span></b></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'>Fees, Penalties
                     and
                    Policies<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'>This contract
                    states that the patient is willing to avail the Orthodontic Treatment that
                    DENTCAST DENTAL CLINIC is offering.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'>The package wil
                    l be
                    determined by the dentist depending on the case of the patient.<o:p></o:p><
                    /span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'>Total Package<o
                    :p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'>Down Payment<o:
                    p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'>Payment per mon
                    th<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'>Treatment Time<
                    o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'>III. <span
                    class3DGramE>all</span> fees shall be kept confidential between patient-de
                    ntist
                    during and even after treatment<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'>IV. <span
                    class3DGramE>general</span> Procedures:<o:p></o:p></span></p>

                    <p class3DMsoListParagraphCxSpFirst style3D'text-align:justify;text-inden
                    t:-.25in;
                    mso-list:l0 level1 lfo1'><![if !supportLists]><span style3D'font-size:12.0
                    pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif";mso-fareast-font
                    -family:
                    "Century Gothic";mso-bidi-font-family:"Century Gothic"'><span style3D'mso-
                    list:
                    Ignore'>a.<span style3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>
                    </span></span><![endif]><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>Filling
                    (Pasta) – all teeth the needs filling will have a separate fee.<o:p></o:p><
                    /span></p>

                    <p class3DMsoListParagraphCxSpMiddle style3D'text-align:justify;text-inde
                    nt:-.25in;
                    mso-list:l0 level1 lfo1'><![if !supportLists]><span style3D'font-size:12.0
                    pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif";mso-fareast-font
                    -family:
                    "Century Gothic";mso-bidi-font-family:"Century Gothic"'><span style3D'mso-
                    list:
                    Ignore'>b.<span style3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>
                    </span></span><![endif]><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>Cleaning
                    – General Oral Prophylaxis will be advised by the dentist to be done every 
                    six
                    months.<o:p></o:p></span></p>

                    <p class3DMsoListParagraphCxSpLast style3D'text-align:justify;text-indent
                    :-.25in;
                    mso-list:l0 level1 lfo1'><![if !supportLists]><span style3D'font-size:12.0
                    pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif";mso-fareast-font
                    -family:
                    "Century Gothic";mso-bidi-font-family:"Century Gothic"'><span style3D'mso-
                    list:
                    Ignore'>c.<span style3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; <
                    /span></span></span><![endif]><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>Extracting
                    (<span class3DSpellE>Bunot</span>) – as all removal of teeth is accompanie
                    d by
                    certain risks and difficulty, a separate fee will be charged accordingly.<o
                    :p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'>V. Exclusion:<o
                    :p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><span
                    style3D'mso-tab-count:1'>            </span>Panoramic X-ray and <span
                    class3DSpellE>Cephalometric</span> X-ray<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><span
                    style3D'mso-tab-count:1'>            </span>All prosthesis – Jacket Crowns,
                    Fixed Bridge, Removable Denture etc.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><span
                    style3D'mso-tab-count:1'>            </span>Root Canal Treatment<o:p></o:p
                    ></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><span
                    style3D'mso-tab-count:1'>            </span>Teeth Whitening <o:p></o:p></s
                    pan></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><span
                    style3D'mso-tab-count:1'>            </span>Retainers<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'>VI. The dentist
                     has
                    the right to remove the patient’s braces, fully paid or not,<b
                    style3D'mso-bidi-font-weight:normal'> IN CASE THE FOLLOWING</b>:<o:p></o:p
                    ></span></p>

                    <p class3DMsoListParagraphCxSpFirst style3D'text-align:justify;text-inden
                    t:-.25in;
                    mso-list:l2 level1 lfo2'><![if !supportLists]><span style3D'font-size:12.0
                    pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif";mso-fareast-font
                    -family:
                    "Century Gothic";mso-bidi-font-family:"Century Gothic"'><span style3D'mso-
                    list:
                    Ignore'>a.<span style3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>
                    </span></span><![endif]><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>Patient
                    missed 6 months or more appointments even through constant reminders from t
                    he
                    dentist and clinic staff. Patient failure to visit to the clinic for six mo
                    nths
                    equivalent to 6 consecutive appointments, the dentist can forfeit the down
                    payment fee and remove the bracket to discontinue the treatment.<o:p></o:p>
                    </span></p>

                    <p class3DMsoListParagraphCxSpMiddle style3D'text-align:justify;text-inde
                    nt:-.25in;
                    mso-list:l2 level1 lfo2'><![if !supportLists]><span style3D'font-size:12.0
                    pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif";mso-fareast-font
                    -family:
                    "Century Gothic";mso-bidi-font-family:"Century Gothic"'><span style3D'mso-
                    list:
                    Ignore'>b.<span style3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>
                    </span></span><![endif]><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>Treatment
                    has reached maximum length of treatment duration of 3years, <b
                    style3D'mso-bidi-font-weight:normal'>DUE to patient’s constant negligence 
                    and
                    missed appointment</b>, with or without treatment accomplished.<o:p></o:p><
                    /span></p>

                    <p class3DMsoListParagraphCxSpLast style3D'text-align:justify;text-indent
                    :-.25in;
                    mso-list:l2 level1 lfo2'><![if !supportLists]><span style3D'font-size:12.0
                    pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif";mso-fareast-font
                    -family:
                    "Century Gothic";mso-bidi-font-family:"Century Gothic"'><span style3D'mso-
                    list:
                    Ignore'>c.<span style3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; <
                    /span></span></span><![endif]><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>Patient
                    refuses to pay monthly agreed fee.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>VII.
                    Patient is need to pay for charging of rubber (E-ties or E-chain and elastic
                    rubber) amounting to <b style3D'mso-bidi-font-weight:normal'>200Php<o:p></
                    o:p></b></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>VIII.
                    To promote discipline, we will be strict with regards to loose (<span
                    class3DSpellE>natanggal</span>) and lost (<span class3DSpellE><span class
                    3DGramE>na</span></span>
                    <span class3DSpellE>wala</span>) brackets and molar band/ <span class3DSp
                    ellE>buccal</span>
                    tube. A <b style3D'mso-bidi-font-weight:normal'>200php per bracket </b><sp
                    an
                    class3DSpellE>recemented</span> shall be added on the current monthly fee.
                     For
                    lost brackets and molar bands/ <span class3DSpellE>buccal</span> tube,
                    additional <b style3D'mso-bidi-font-weight:normal'>400php per piece </b>sh
                    all be
                    charged.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>*Please
                    notify the clinic if a newly <span class3DSpellE>recemented</span> bracket
                    became loosed within 24 <span class3DSpellE>hrs</span> of <span class3DSp
                    ellE>recementation</span>
                    (no charge applies). Failure to notify us the following day will automatica
                    lly
                    be charged the corresponding amount.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>IX.
                    All minor patient (17 years old and below) must be accompanied by a parent 
                    or
                    guardian<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>X.
                    All patients will have the option to either (a) continue treatment in our
                    clinic, (b) stop the treatment completely (our clinic will not be liable), 
                    or
                    (c) have their braces removed in our clinic for a certain fee.<o:p></o:p></
                    span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>XI.
                    All patients will have the option to either (a) continue treatment in our
                    clinic, (b) stop the treatment completely (our clinic will not be liable), 
                    or
                    (c) have their braces removed in our clinic for a certain fee.<o:p></o:p></
                    span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>XI.
                    All fees are <b style3D'mso-bidi-font-weight:normal'>non-refundable.</b><o
                    :p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>I
                    hereby affix my signature in agreement with the above contract, and fully g
                    ive
                    my consent and confidence to the dentist and staff of this clinic.<o:p></o:
                    p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>No
                    further claim.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'><o:p>&nbsp;</o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'><o:p>&nbsp;</o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'><o:p>&nbsp;</o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'><o:p>&nbsp;</o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'><o:p>&nbsp;</o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'><o:p>&nbsp;</o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><b
                    style3D'mso-bidi-font-weight:normal'><span style3D'font-size:12.0pt;line-
                    height:
                    107%;font-family:"Century Gothic","sans-serif"'>GUIDE INFORMATION AND CONSE
                    NT
                    FOR ORTHODONTIC PATIENT AND PARENTS<o:p></o:p></span></b></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'><span
                    style3D'mso-tab-count:1'>      </span>Welcome to world of Orthodontics!
                    Achieving a healthy and smart smile has always been a top priority of your
                    dentist in the orthodontic treatment. One must be aware and informed that l
                    ike
                    any treatment in the body, the orthodontic therapy has some inherent risks 
                    and
                    limitations. These are seldom enough to contraindicate treatment, but shoul
                    d be
                    taken into considerations. These are seldom enough to contraindicate, but
                    should be taken into consideration when you make decision to wear orthodont
                    ic
                    appliances.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'><o:p>&nbsp;</o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>It
                    is a MUST to:<o:p></o:p></span></p>

                    <p class3DMsoListParagraphCxSpFirst style3D'margin-left:.75in;mso-add-spa
                    ce:auto;
                    text-align:justify;text-indent:-.25in;mso-list:l1 level1 lfo3'><!><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:Symbol;mso-fareast-f
                    ont-family:
                    Symbol;mso-bidi-font-family:Symbol'><span style3D'mso-list:Ignore'>·<span
                    style3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;
                    </span></span></span><![endif]><span style3D'font-size:12.0pt;line-height:
                    107%;
                    font-family:"Century Gothic","sans-serif"'>Maintain oral hygiene always. Pl
                    aque
                    removal must be done if detected.<o:p></o:p></span></p>

                    <p class3DMsoListParagraphCxSpMiddle style3D'margin-left:.75in;mso-add-sp
                    ace:
                    auto;text-align:justify;text-indent:-.25in;mso-list:l1 level1 lfo3'><![if !
                    supportLists]><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:Symbol;mso-fareast-f
                    ont-family:
                    Symbol;mso-bidi-font-family:Symbol'><span style3D'mso-list:Ignore'>·<span
                    style3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;
                    </span></span></span><![endif]><span style3D'font-size:12.0pt;line-height:
                    107%;
                    font-family:"Century Gothic","sans-serif"'>Sugars, hard and sticky foods and
                    between meal snacks must be avoided.<o:p></o:p></span></p>

                    <p class3DMsoListParagraphCxSpLast style3D'margin-left:.75in;mso-add-spac
                    e:auto;
                    text-align:justify;text-indent:-.25in;mso-list:l1 level1 lfo3'><![if !suppo
                    rtLists]><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:Symbol;mso-fareast-f
                    ont-family:
                    Symbol;mso-bidi-font-family:Symbol'><span style3D'mso-list:Ignore'>·<span
                    style3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;
                    </span></span></span><![endif]><span style3D'font-size:12.0pt;line-height:
                    107%;
                    font-family:"Century Gothic","sans-serif"'>Decalcification (permanent
                    markings), caries and gum disease can occur if patients neglectfully brush
                    their teeth.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'text-align:justify'><span style3D'font-size:
                    12.0pt;
                    line-height:107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:
                    p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.5in;text-align:justify;text-inde
                    nt:.25in'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>Genetics,
                    problems with growth and development and patient cooperation are some the
                    hindrances that may affect the achievement of the functional occlusion and 
                    an <span
                    class3DSpellE>esthetically</span> acceptable result.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.5in;text-align:justify;text-inde
                    nt:.25in'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>Tooth
                    position is constantly changing whether the patient undergoes orthodontic
                    treatment or not. Post-orthodontic patients are subject to the same changes
                    that occur in non-orthodontic patients.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.5in;text-align:justify;text-inde
                    nt:.25in'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>As
                    discoloration and/or dead teeth are a rarity to orthodontic treatment, such
                     may
                    occur. The tooth that has been traumatized from a minor blow or from a deep
                    filling can die or become non-vital with or without orthodontic treatment. 
                    An
                    endodontic therapy (root canal) can be a treatment of choice to mainly and 
                    preserve
                    the tooth.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.5in;text-align:justify;text-inde
                    nt:.25in'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>Root
                    <span class3DSpellE>Resorption</span> (shortening of root ends of the teet
                    h), in
                    some cases may occur. If should be noted that not all root <span class3DSp
                    ellE>resorption</span>
                    arises from orthodontic treatment. It may be caused by the following: traum
                    a,
                    impaction, endocrine disorders or unknown. On the onset of gum disease root
                     <span
                    class3DSpellE>resorption</span> can reduce the longevity of an affected te
                    eth. However,
                    under some circumstances, the shortened roots are of little disadvantage.<o
                    :p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.5in;text-align:justify;text-inde
                    nt:.25in'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>The
                    possibility of a <span class3DSpellE>Temporomandibular</span> Joint Disord
                    er
                    (TMD) may also be considered everyday stress and tension may play a role in
                     <span
                    class3DSpellE><span class3DGramE>it’s</span></span> multifactorial reason
                    s of
                    existence. Not in all cases, tooth alignment or bite correction may improve
                    tooth related causes of TMJ pain.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.5in;text-align:justify;text-inde
                    nt:.25in'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>There
                    are appliances that patients will be asked to wear and must be followed
                    carefully (headgear, elastics, expansion) if incorrectly applied these may
                    cause serious injury to the face to the molars and the other teeth.
                    Instructions must be followed strictly.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.5in;text-align:justify;text-inde
                    nt:.25in'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>Retention
                    phase will follow after the active orthodontic treatment. It is a paramount
                    thank you in advance for your willingness to create a smarter smile.<o:p></
                    o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.5in;text-align:justify;text-inde
                    nt:.25in'><span
                    style3D'font-size:12.0pt;line-height:107%;font-family:"Century Gothic","sa
                    ns-serif"'>I
                    fully understand the nature of the orthodontic problem and the possible rea
                    son
                    for treatment. The alternatives have been also explained to me, some of whi
                    ch
                    is no treatment and the possible results if nothing is done. I have had the
                    opportunity to ask all questions which I have, and they have been fully
                    answered to my complacency.<o:p></o:p></span></p>

                    <p class3DMsoNormal style3D'margin-left:.25in;text-align:justify'><b
                    style3D'mso-bidi-font-weight:normal'><span style3D'font-size:12.0pt;line-
                    height:
                    107%;font-family:"Century Gothic","sans-serif"'><o:p>&nbsp;</o:p></span></b
                    ></p>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-1 col-md-10">
                <div class ="container">
                    <div class ="row" style ="text-align: left;">
                        

                        
                        <asp:checkbox id="chkTerms" text="I have read and understood the above and consent to treatment." ValidationGroup="vg" runat="Server"  />
                        <asp:CustomValidator id="vTerms"
                            ClientValidationFunction="validateTerms" 
                            ErrorMessage="<br/>Terms and Conditions are required." 
                            ForeColor="Red"
                            Display="Static"
                            EnableClientScript="true"
                            ValidationGroup="vg"
                            runat="server"/>
                        <script>
                            function validateTerms(source, arguments) {
                                var $c = $('#<%= chkTerms.ClientID %>');
                                if($c.prop("checked")){
                                    arguments.IsValid = true;
                                } else {
                                    arguments.IsValid = false;
                                }
                            }
                        </script>      


                        
                    </div>
                </div>
                
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-1 col-md-10">
                
            </div>
        </div>

        
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                     <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" EnableShadow="true">
        </telerik:RadWindowManager>
                <asp:Button ID="CreateUserBtn" runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" BorderColor="#666666" Font-Names="Century Gothic" Width="127px" ValidationGroup="vg"/>
            </div>
        </div>
    </div>
</asp:Content>

