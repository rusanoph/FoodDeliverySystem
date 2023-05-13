<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="FoodDeliverySys.Admin.Category" %>
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

                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Категории</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Название Категории</label>
                                                    <div>
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" 
                                                            placeholder="Введите Название Категории" required></asp:TextBox>
                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Изображение категории</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="form-check pl-4">
                                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; Активна"
                                                        CssClass="form-check-input" />
                                                </div>

                                                <div class="pb-5">
                                                    <asp:Button ID="btnAddOrUpdate" runat="server" Text="Добавить" CssClass="btn btn-primary" 
                                                        OnClick="btnAddOrUpdate_Click"/>
                                                    &nbsp;
                                                    &nbsp;
                                                    &nbsp;
                                                    &nbsp;
                                                    <asp:Button ID="btnClear" runat="server" Text="Очистить" CssClass="btn btn-primary"
                                                        CausesValidatoin="false" OnClick="btnClear_Click"/>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Список категорий начало -->
                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Список категорий</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">

                                                    <asp:Repeater ID="rCategory" runat="server" OnItemCommand="rCategory_ItemCommand"
                                                        OnItemDataBound="rCategory_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                <tr>
                                                                    <th class="table-plus">Название</th>
                                                                    <th>Изображение</th>
                                                                    <th>Доступность</th>
                                                                    <th>Дата создания</th>
                                                                    <th class="datatable-nosort">Действие</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"> <%# Eval("Name") %> </td>
                                                                <td><img src="<%# Utils.GetImageUrl( Eval("ImageUrl") ) %>" height="50px"/></td>
                                                                <td><asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label></td>
                                                                <td> <%# Eval("CreatedDate") %> </td>
                                                                <td> 
                                                                    <asp:LinkButton ID="lnkEdit" Text="Изменить" runat="server" CssClass="badge badge-primary"
                                                                        CommandArgument='<%# Eval("CategoryId") %>' CommandName="edit">
                                                                        <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Удалить" runat="server" CssClass="badge bg-danger" 
                                                                        CommandArgument='<%# Eval("CategoryId") %>' CommandName="delete"
                                                                        OnClientClick="return confirm('Вы уверены, что хотите удалить эту категорию?');">
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
                                        <!-- Список категорий конец -->

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
