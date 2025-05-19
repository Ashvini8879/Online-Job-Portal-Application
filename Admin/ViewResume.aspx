<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ViewResume.aspx.cs" Inherits="MyJobPortal.Admin.ViewResume" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" />
 <style>
    .custom-match-score {
    background-color: forestgreen; /* blue, change as needed */
    color: white;
    font-size: 16px;           /* increase text size */
    padding: 8px 12px;         /* more padding to enlarge the box */
    border-radius: 8px;        /* rounded corners */
    display: inline-block;     /* keeps it tight around the text */
    font-weight: bold;         /* optional: make text bold */
}
</style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">

<div class="container pt-4 pb-4">

<div>

<asp:Label ID="lblMsg" runat="server"></asp:Label>

</div>

    <h3 class="text-center">View Resume/Dowload Resume</h3>

    <div class="row mb-3 pt-sm-3">

        <div class="col-md-12">

           <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered gridview-container"
    EmptyDataText="No record to display..!" AutoGenerateColumns="False" AllowPaging="True" PageSize="5"
    OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="AppliedJobId" OnRowDeleting="GridView1_RowDeleting" 
    OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"       >

                <Columns>
                    <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="CompanyName" HeaderText="Company Name">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Title" HeaderText="Job Title">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Name" HeaderText="User Name">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Email" HeaderText="User Email">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Mobile" HeaderText="Mobile No.">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>


                   

                    <asp:TemplateField HeaderText="Resume">

                           <ItemTemplate>

                               <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container,"DataItem.Resume","../{0}") %>'>
                                   <i class="fas fa-download">Download</i></asp:HyperLink>

                               <asp:HiddenField ID="hdnJobId" runat="server" Value='<%# Eval("JobId") %>' Visible="true" />
                           </ItemTemplate>


                         <ItemStyle HorizontalAlign="Center" />

                   </asp:TemplateField>

                    <asp:TemplateField HeaderText="Resume Match %">
    <ItemTemplate>
      <asp:Label 
    ID="lblMatchScore" 
    runat="server" 
    Text='<%# GetResumeMatchScore(Eval("Resume").ToString(), Eval("JobId").ToString()) %>' 
    CssClass="custom-match-score">
</asp:Label>
    </ItemTemplate>
    <ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>

<asp:TemplateField HeaderText="Delete">
    <ItemTemplate>
        <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="../assets/img/icon/trashicon.png"
            CommandName="Delete" OnClientClick="stopNavigationOnDelete(event);" Width="20px" Height="25px" />
    </ItemTemplate>
    <ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>


                </Columns>
                <HeaderStyle BackColor="#7200cf" ForeColor="white" />
            </asp:GridView>

        </div>

    </div>

</div>
</div>
</asp:Content>
