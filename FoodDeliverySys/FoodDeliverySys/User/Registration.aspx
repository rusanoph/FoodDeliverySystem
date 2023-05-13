<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FoodDeliverySys.User.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>

    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                        .width(200);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">

            <%-- Заголовок регистрации начало --%>
            <div class="heading_container">
                <div class="align-self-end" style="margin:0 0 30px 0">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>Регистрация Пользователя</h2>"></asp:Label>
            </div>
            <%-- Заголовок регистрации конец --%>

            <%-- Форма регистрации начало --%>
            <div class="row">

                <%-- Левая часть формы --%>
                <div class="col-md-6">
                    <div class="form_container">
                        <%-- ФИО начало --%>
                        <div>
                            <%-- Валидация поля --%>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                ErrorMessage="ФИО является обязательным полем" 
                                ControlToValidate="txtName" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <%-- Регулярное выражение --%>
                            <asp:RegularExpressionValidator ID="revName" runat="server" 
                                ErrorMessage="ФИО должно состоять только из символов"
                                ControlToValidate="txtName" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="true"
                                ValidationExpression="^[а-яА-Яa-zA-Z\s]+$">
                            </asp:RegularExpressionValidator>

                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" 
                                placeholder="Введите ФИО" ToolTip="Введите ФИО"></asp:TextBox>

                        </div>
                        <%-- ФИО конец --%>

                        <%-- Имя пользователя начало --%>
                        <div>
                            <%-- Валидация поля --%>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                                ErrorMessage="Имя пользователя является обязательным полем" 
                                ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="true">
                            </asp:RequiredFieldValidator>

                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" 
                                placeholder="Введите Имя Пользователя" ToolTip="Введите Имя Пользователя">
                            </asp:TextBox>
                        </div>
                        <%-- Имя пользователя конец --%>

                        <%-- E-mail начало --%>
                        <div>
                            <%-- Валидация поля --%>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                ErrorMessage="E-mail является обязательным полем" 
                                ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="true">
                            </asp:RequiredFieldValidator>

                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                                placeholder="Введите E-mail" ToolTip="Введите E-mail" TextMode="Email">
                            </asp:TextBox>
                        </div>
                        <%-- E-mail конец --%>

                        <%-- Номер телефона начало --%>
                        <div>
                            <%-- Валидация поля --%>
                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server" 
                                ErrorMessage="Номер телефона является обязательным полем" 
                                ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <%-- Регулярное выражение --%>
                            <asp:RegularExpressionValidator ID="revMobile" runat="server" 
                                ErrorMessage="Номер телефона должен содержать 10 цифр"
                                ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="true"
                                ValidationExpression="^[0-9]{11}">
                            </asp:RegularExpressionValidator>

                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" 
                                placeholder="Введите Номер Телефона" ToolTip="Введите Номер Телефона"
                                TextMode="Phone"></asp:TextBox>
                        </div>
                        <%-- Номер телефона конец --%>
                    </div>
                </div>

                <%-- Правая часть формы --%>
                <div class="col-md-6">
                    <div class="form_container">

                        <%-- Адрес начало --%>
                        <div>
                            <%-- Валидация поля --%>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                ErrorMessage="Адрес является обязательным полем" 
                                ControlToValidate="txtAddress" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="true">
                            </asp:RequiredFieldValidator>

                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" 
                                placeholder="Введите Адрес" ToolTip="Введите Адрес"
                                TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <%-- Адрес конец --%>

                        <%-- Почтовый индекс начало --%>
                        <div>
                            <%-- Валидация поля --%>
                            <asp:RequiredFieldValidator ID="rfvPostcode" runat="server" 
                                ErrorMessage="Почтовый индекс является обязательным полем" 
                                ControlToValidate="txtPostcode" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <%-- Регулярное выражение --%>
                            <asp:RegularExpressionValidator ID="revPostcode" runat="server" 
                                ErrorMessage="Почтовый индекс должен содержать 6 цифр"
                                ControlToValidate="txtPostcode" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="true"
                                ValidationExpression="^[0-9]{6}">
                            </asp:RegularExpressionValidator>

                            <asp:TextBox ID="txtPostcode" runat="server" CssClass="form-control" 
                                placeholder="Введите Почтовый Индекс" ToolTip="Введите Почтовый Индекс"
                                TextMode="Number">
                            </asp:TextBox>
                        </div>
                        <%-- Почтовый индекс конец --%>

                        <%-- Аватар начало --%>
                        <div>
                            <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" 
                                ToolTip="Изображения профиля" onchange="ImagePreview(this);"/>
                        </div>
                        <%-- Аватар конец --%>

                        <%-- Пароль начало --%>
                        <div>
                            <%-- Валидация поля --%>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                ErrorMessage="Пароль является обязательным полем" 
                                ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="true">
                            </asp:RequiredFieldValidator>

                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" 
                                placeholder="Введите Пароль" ToolTip="Введите Пароль"
                                TextMode="Password"></asp:TextBox>
                        </div>
                        <%-- Пароль конец --%>

                    </div>
                </div>
            </div>

            <%-- Предпросмотр изображения профиля --%>
            <div class="row p-5">
                <div style="margin: 0 auto">
                    <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail"/>
                </div>
            </div>
            
            <%-- Отправка формы --%>
            <div class="row pl-4">
                <div class="btn_box">
                    <asp:Button ID="btnRegister" runat="server" Text="Зарегистрироваться" 
                        CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                        OnClick="btnRegister_Click"/>

                    <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-block-100"
                        Text="Уже зарегистрированы? <a href='Login.aspx' class='badge badge-info'>Войти в профиль..</a>"/>
                </div>
            </div>
            <%-- Форма регистрации конец --%>
        </div>
    </section>

</asp:Content>
