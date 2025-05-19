<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="MyJobPortal.User.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .profile-upload {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 1rem;
        margin-top: 30px;
        font-family: 'Segoe UI', sans-serif;
    }

    #preview {
        border: 3px solid #4CAF50;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        transition: transform 0.3s ease;
    }

    #preview:hover {
        transform: scale(1.05);
    }

    .upload-btn {
        display: inline-block;
        padding: 8px 16px;
        background-color: #4CAF50;
        color: white;
        border-radius: 5px;
        cursor: pointer;
        font-weight: 600;
        transition: background 0.3s ease;
    }

    .upload-btn:hover {
        background-color: #45a049;
    }

    #imageUpload {
        display: none;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container pt-5 pb-5">

<div class="main-body">

    <asp:DataList ID="dlProfile" runat="server" width="100%"  OnItemCommand="dlProfile_ItemCommand">

        <ItemTemplate>

            <div class="row gutters-sm">

                <div class="col-md-4 mb-3">

                    <div class="card">

                        <div class="card-body">

                            <div class="d-flex flex-column align-items-center text-center">

<div class="profile-upload">
    <img id="preview" alt="UserPic" class="rounded-circle" width="150" />
    <label for="imageUpload" class="upload-btn">Upload Profile Image</label>
    <input type="file" id="imageUpload" accept="image/*" />
</div>

                                <div class="mt-3">

                                    <h4 class="text-capitalize"><%# Eval("Name") %></h4>

                                    <p class="text-secondary mb-1">@<%# Eval("Username") %></p>

                                    <p class="text-muted font-size-sm text-capitalize">

                                        <i class="fas fa-map-marker-alt"></i><%# Eval("Country") %>

                                    </p>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="col-md-8">

                    <div class="card mb-3">

                        <div class="card-body">

                            <div class="row">

                                <div class="col-sm-3">

                                    <h6 class="mb-0">
                                        &nbsp;Full Name</h6>

                                </div>

                                <div class="col-sm-9 text-secondary text-capitalize">
                                    <%# Eval("Name") %>

                                </div>

                            </div>

                            <hr />

                            <div class="row">

                                <div class="col-sm-3">

                                    <h6 class="mb-0">&nbsp;Email</h6>

                                </div>

                                <div class="col-sm-9 text-secondary">
                                    <%# Eval("Email") %>

                                </div>

                            </div>

                            <hr />

                            <div class="row">

                                <div class="col-sm-3">

                                    <h6 class="mb-0">&nbsp;Mobile</h6>

                                </div>

                                <div class="col-sm-9 text-secondary text-capitalize">
                                    <%# Eval("Mobile") %>

                                </div>

                            </div>

                            <hr />

                            <div class="row">

                                <div class="col-sm-3">

                                    <h6 class="mb-0">&nbsp;Address</h6>

                                </div>

                                <div class="col-sm-9 text-secondary text-capitalize">
                                    <%# Eval("Address") %>

                                </div>

                            </div>

                            <hr />

                            <div class="row">

                                <div class="col-sm-3">

                                    <h6 class="mb-0">Resume Upload</h6>

                                </div>

                                <div class="col-sm-9 text-secondary text-capitalize">
                                     <%# Eval("Resume") == DBNull.Value ? "Not Upload" : "Uploaded"%>

                                </div>

                            </div>

                            <hr />

                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="button button-contactForm  boxed-btn"
                                        CommandName="EditUserProfile" CommandArgument='<%# Eval("UserId") %>'/>
                                </div>
                                 
                            </div>

              </div></div>

                </div>


            </div>

        </ItemTemplate>

    </asp:DataList>

    </div></div>


    <script>
        document.getElementById("imageUpload").addEventListener("change", function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function () {
                    document.getElementById("preview").src = reader.result;
                    localStorage.setItem("profileImage", reader.result);
                };
                reader.readAsDataURL(file);
            }
        });

        window.addEventListener("load", function () {
            const savedImage = localStorage.getItem("profileImage");
            if (savedImage) {
                document.getElementById("preview").src = savedImage;
            }
        });
    </script>
</asp:Content>
