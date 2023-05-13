<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="FoodDeliverySys.User.Profile" %>
<%@ Import Namespace="FoodDeliverySys" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <% 
        string imageUrl = Session["imageUrl"].ToString();
    %>

    <section class="book_section layout_padding">
        <div class="container">

            <%-- Заголовок страницы профиля входа начало --%>
            <div class="heading_container">
                <h2>Профиль</h2>
            </div>
            <%-- Заголовок страницы профиля входа конец --%>

            <%-- Тело страницы профиля начало --%>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title mb-4">
                                <div class="d-flex justify-content-start">

                                    <%-- Изображение профиля начало --%>
                                    <div class="image-container">
                                        <img id="imgProfile" src="<%= Utils.GetImageUrl(imageUrl) %>" 
                                            alt="Изображение профиля" style="width:150px" class="img-thumbnail"/>

                                        <div class="middle pt-2">
                                            <a href="Registration.aspx?id=<%Response.Write(Session["userId"]);

%>"
                                                class="btn btn-warning">
                                                <i class="fa fa-pencil"></i>Редактировать
                                            </a>
                                        </div>

                                    </div>
                                    <%-- Изображение профиля конец --%>

                                    <%-- Данные логин, почта, дата создания начало --%>
                                    <div class="userData ml-3">
                                        <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">
                                            <a href="javascript:void(0);"><%Response.Write(Session["name"]); %></a>
                                        </h2>

                                        <h6 class="d-block">
                                            <a href="javascript:void(0);">
                                                <asp:Label ID="lblUsername" runat="server" ToolTip="Unique  Username">
                                                    @<% Response.Write(Session["username"]); %>
                                                </asp:Label>
                                            </a>
                                        </h6>
                                        <h6 class="d-block">
                                            <a href="javascript:void(0);">
                                                <asp:Label ID="lblEmail" runat="server" ToolTip="Unique  Username">
                                                    <% Response.Write(Session["email"]); %>
                                                </asp:Label>
                                            </a>
                                        </h6>
                                        <h6 class="d-block">
                                            <a href="javascript:void(0);">
                                                <asp:Label ID="lblCreationDate" runat="server" ToolTip="Unique  Username">
                                                    <% Response.Write(Session["createdDate"]); %>
                                                </asp:Label>
                                            </a>
                                        </h6>

                                    </div>
                                    <%-- Данные логин, почта, дата создания конец --%>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">

                                    <%-- Вкладки данные аккаунта и история заказов начало --%>
                                    <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active text-info" id="basicInfo-tab" 
                                                data-toggle="tab" href="#basicInfo"
                                                role="tab" aria-controls="basicInfo" 
                                                aria-selected="true">
                                                <i class="fa fa-id-badge mr-2"></i>Данные профиля
                                            </a>
                                        </li>

                                        <li class="nav-item">
                                            <a class="nav-link text-info" id="connectedServices-tab" 
                                                data-toggle="tab" href="#connectedServices"
                                                role="tab" aria-controls="connectedServices" 
                                                aria-selected="false">
                                                <i class="fa fa-id-badge mr-2"></i>История заказов
                                            </a>
                                        </li>
                                    </ul>
                                    <%-- Вкладки данные аккаунта и история заказов конец --%>

                                    <div class="tab-content ml-1" id="myTabContent">
                                        <%-- Данные аккаунта начало --%>
                                        <div class="tab-pane fade show acitve active" id="basicInfo" role="tabpanel"
                                            aria-labelledby="basicInfo-tab">
                                            <asp:Repeater ID="rUserProfile" runat="server">
                                                <ItemTemplate>
                                                    
                                                    <%-- ФИО --%>
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">ФИО</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Name") %>
                                                        </div>
                                                    </div>
                                                    <hr />

                                                    <%-- Имя профиля --%>
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Имя пользователя</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            @<%# Eval("Username") %>
                                                        </div>
                                                    </div>
                                                    <hr />

                                                    <%-- Телефон --%>
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Номер телефона</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Mobile") %>
                                                        </div>
                                                    </div>
                                                    <hr />

                                                    <%-- E-mail --%>
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">E-mail</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Email") %>
                                                        </div>
                                                    </div>
                                                    <hr />

                                                    <%-- Почтовый индекс --%>
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Почтовый индекс</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Postcode") %>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    
                                                    <%-- Адрес --%>
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Адрес</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Address") %>
                                                        </div>
                                                    </div>
                                                    <hr />

                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <%-- Данные аккаунта конец --%>


                                        <%-- История заказов начало --%>
                                        <div class="tab-pane fade" id="connectedServices" role="tabpanel"
                                            aria-labelledby="ConnectedServices-tab">
                                            <asp:Repeater ID="rOrderHistory" runat="server">

                                            </asp:Repeater>
                                            <h3>История заказов</h3>
                                        </div>
                                        <%-- История заказов конец --%>

                                    </div>
                                
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <%-- Тело страницы профиля конец --%>

        </div>
    </section>

</asp:Content>
