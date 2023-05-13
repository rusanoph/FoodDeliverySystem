<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="FoodDeliverySys.Admin.Users" %>
<%@ Import Namespace="FoodDeliverySys" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="pcoded-inner-content pt-0">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>

        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">

                                        <!-- Список пользователей начало -->
                                        <div class="col-12 mobile-inputs">
                                            <h4 class="sub-title">Список пользователей</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">

                                                    <asp:Repeater ID="rUsers" runat="server" OnItemCommand="rUsers_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                <tr>
                                                                    <th class="table-plus">ID</th>
                                                                    <th>ФИО</th>
                                                                    <th>Имя пользователя</th>
                                                                    <th>E-mail</th>
                                                                    <th>Дата создания</th>
                                                                    <th class="datatable-nosort">Удаление</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"> <%# Eval("SrNo") %> </td>
                                                                <td> <%# Eval("Name") %> </td>
                                                                <td> <%# Eval("Username") %> </td>
                                                                <td> <%# Eval("Email") %> </td>
                                                                <td> <%# Eval("CreatedDate") %> </td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Удалить" runat="server" CssClass="badge bg-danger" 
                                                                        CommandArgument='<%# Eval("UserId") %>' CommandName="delete"
                                                                        OnClientClick="return confirm('Вы уверены, что хотите удалить этого пользователя?');">
                                                                        <i class="ti-trash"></i>
                                                                    </asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>

                                                </div>
                                            </div>
                                            
                                        </div>
                                        <!-- Список пользователей конец -->

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
