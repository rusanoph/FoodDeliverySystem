<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="FoodDeliverySys.Admin.Product" %>
<%@ Import Namespace="FoodDeliverySys" %>
<%-- 7) 50:23 --%>

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

                                        <%-- Форма управления товаром начало --%>
                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Продукция</h4>
                                            <div>
                                                <%-- Название товара начало --%>
                                                <div class="form-group">
                                                    <label>Название товара</label>
                                                    <div>
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" 
                                                            placeholder="Введите Название Товара" required></asp:TextBox>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                            ErrorMessage="Название должно быть обязательным" ForeColor="Red" Display="Dynamic"
                                                            SetFocusOnError="true" ControlToValidate="txtName">
                                                        </asp:RequiredFieldValidator>

                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                    </div>
                                                </div>
                                                <%-- Название товара конец --%>

                                                <%-- Описание товара начало --%>
                                                <div class="form-group">
                                                    <label>Описание товара</label>
                                                    <div>
                                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" 
                                                            placeholder="Введите Описание Товара" TextMode="MultiLine" required></asp:TextBox>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                            ErrorMessage="Описание должно быть обязательным" ForeColor="Red" Display="Dynamic"
                                                            SetFocusOnError="true" ControlToValidate="txtDescription">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <%-- Описание товара конец --%>


                                                <%-- Цена товара начало --%>
                                                <div class="form-group">
                                                    <label>Цена товара (₽)</label>
                                                    <div>
                                                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" 
                                                            placeholder="Введите Цену Товара" required></asp:TextBox>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                            ErrorMessage="Цена должна быть обязательной" ForeColor="Red" Display="Dynamic"
                                                            SetFocusOnError="true" ControlToValidate="txtPrice">
                                                        </asp:RequiredFieldValidator>

                                                        <%-- Валидатор-Регулярное выражение --%>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                            ErrorMessage="Цена должна быть числом" ForeColor="Red" Display="Dynamic"
                                                            SetFocusOnError="true" ControlToValidate="txtPrice"
                                                            ValidationExpression="\d{0,9}(\.\d{1,4})?$">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <%-- Цена товара конец --%>

                                                <%-- Количество товара начало --%>
                                                <div class="form-group">
                                                    <label>Количество товара</label>
                                                    <div>
                                                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" 
                                                            placeholder="Введите Количество Товара" required></asp:TextBox>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                            ErrorMessage="Количество товара должно быть обязательным" ForeColor="Red" Display="Dynamic"
                                                            SetFocusOnError="true" ControlToValidate="txtQuantity">
                                                        </asp:RequiredFieldValidator>

                                                        <%-- Валидатор-Регулярное выражение --%>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                            ErrorMessage="Количество товара должно быть неотрицательным" ForeColor="Red" Display="Dynamic"
                                                            SetFocusOnError="true" ControlToValidate="txtQuantity"
                                                            ValidationExpression="^([1-9]\d*|0)$">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <%-- Количество товара конец --%>

                                                <%-- Изображение товара начало --%>
                                                <div class="form-group">
                                                    <label>Изображение товара</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control"/>
                                                    </div>
                                                </div>
                                                <%-- Изображение товара конец --%>

                                                 <%-- Категория товара начало --%>
                                                <div class="form-group">
                                                    <label>Категория товара</label>
                                                    <div>
                                                        <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-control" 
                                                            DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CategoryId"
                                                            AppendDataBoundItems="true">
                                                            <asp:ListItem Value="0">Выбрать категорию</asp:ListItem>
                                                        </asp:DropDownList>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                            ErrorMessage="Категория товара должно быть обязательным" ForeColor="Red" Display="Dynamic"
                                                            SetFocusOnError="true" ControlToValidate="ddlCategories" InitialValue="0">
                                                        </asp:RequiredFieldValidator>

                                                        <%-- SQL источник данных --%>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:cs %>" 
                                                            SelectCommand="SELECT [CategoryId], [Name] FROM [Categories]">
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>
                                                <%-- Категория товара конец --%>

                                                <%-- Доступность товара начало --%>
                                                <div class="form-check pl-4">
                                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; Активна"
                                                        CssClass="form-check-input" />
                                                </div>
                                                <%-- Доступность товара конец --%>

                                                <%-- Отправка/Очистка формы начало --%>
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
                                                <%-- Отправка/Очистка формы конец --%>
                                            </div>
                                        </div>
                                        <%-- Форма управления товаром конец --%>

                                        <!-- Список блюд начало -->
                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Список блюд</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">

                                                    <%-- Таблица начало --%>
                                                    <asp:Repeater ID="rProduct" runat="server" OnItemCommand="rProduct_ItemCommand"
                                                        OnItemDataBound="rProduct_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                <tr>
                                                                    <th class="table-plus">Название</th>
                                                                    <th>Описание</th>
                                                                    <th>Цена (₽)</th>
                                                                    <th>Кол-во</th>
                                                                    <th>Изображение</th>
                                                                    <th>Категория</th>
                                                                    <th>Доступность</th>
                                                                    <th>Дата создания</th>
                                                                    <th class="datatable-nosort">Действие</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <%-- Название --%> <td class="table-plus"> <%# Eval("Name") %> </td>
                                                                <%-- Изображение --%> <td><img src="<%# Utils.GetImageUrl( Eval("ImageUrl") ) %>" height="50px"/></td>
                                                                <%-- Цена (₽) --%> <td> <%# Eval("Price") %> </td>
                                                                <%-- Количество --%> <td><asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label></td>
                                                                <%-- Описание --%> <td> <%# Eval("Description") %> </td>
                                                                <%-- Категория --%> <td> <%# Eval("CategoryName") %> </td> <%-- From stored procedure --%>
                                                                <%-- Доступность --%> <td><asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label></td>
                                                                <%-- Дата создания --%> <td> <%# Eval("CreatedDate") %> </td>
                                                                
                                                                <%-- Действие начало --%>
                                                                <td> 
                                                                    <asp:LinkButton ID="lnkEdit" Text="Изменить" runat="server" CssClass="badge badge-primary"
                                                                        CommandArgument='<%# Eval("ProductId") %>' CommandName="edit" 
                                                                        CausesValidation="false">
                                                                        <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Удалить" runat="server" CssClass="badge bg-danger" 
                                                                        CommandArgument='<%# Eval("ProductId") %>' CommandName="delete"
                                                                        OnClientClick="return confirm('Вы уверены, что хотите удалить этот товар?');" 
                                                                        CausesValidation="false">
                                                                        <i class="ti-trash"></i>
                                                                    </asp:LinkButton>
                                                                </td>
                                                                <%-- Действие конец --%>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                    <%-- Таблица конец --%>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <!-- Список блюд конец -->

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
