<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestPage.aspx.cs" Inherits="TestPage" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Amigo Indica</title>
    <link href="css/estilo.css" rel="stylesheet" type="text/css" />    
    <!-- <link href="css/style.css" rel="stylesheet" type="text/css" /> -->
    
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="http://portal.estacio.br/assets/js/jquery-1.10.2.min.js"></script>
	<script src="http://portal.estacio.br/assets/bootstrap/js/bootstrap.min.js"></script> 
    <script src="scripts/Functions.js" type="text/javascript"></script>
</head>
<body>

<div class="container-fluid">
    <div class="row">
    <form id="form1" runat="server" style="padding: 50px;">
    
    <div class="ContenudoCadastro">
        <p>
            Cadastre-se para começar a indicar amigos e a ganhar descontos.</p>
        <div class="divLabelMensagem">
            <asp:Label ID="lblMensagemErro" runat="server" CssClass="fonteErroFormulario" Visible="false"
                Text="Usuário já cadastrado." />
            <asp:Label ID="lblMensagemSucesso" runat="server" CssClass="fonteErroFormulario"
                Visible="false" Text="Usuário cadastrado com sucesso! Em breve, você receberá um e-mail com mais informações." />
        </div>
        <br />
        <div style="clear: both">
        </div>
        <div class="left">
            <div class="MyTextBox">
                <div class="izq">
                    Nome</div>
                <div>
                    <asp:TextBox ID="tbNome" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="right">
            <asp:RequiredFieldValidator ID="rfvNome" ControlToValidate="tbNome" runat="server"
                CssClass="fonteErroFormulario" ErrorMessage="Campo deve ser preenchido."></asp:RequiredFieldValidator>
        </div>
        <div class="left">
            <div class="MyTextBox">
                <div class="izq">
                    E-mail</div>
                <div>
                    <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="right">
            <div style="position: absolute;">
                <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="tbEmail" runat="server"
                    CssClass="fonteErroFormulario" ErrorMessage="Campo deve ser preenchido."></asp:RequiredFieldValidator>
            </div>
            <div style="position: absolute;">
                <asp:RegularExpressionValidator ID="rvValEmail" runat="server" ControlToValidate="tbEmail"
                    ErrorMessage="Campo no formato inválido." CssClass="fonteErroFormulario" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
        </div>        
        
        <div class="left">
            <div class="MyTextBox">
                <div class="izq">
                    Confirma E-mail</div>
                <div>
                    <asp:TextBox ID="tbConfirmaEmail" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>        
        
        <div class="right">
            <div style="position: absolute;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbConfirmaEmail" runat="server"
                    CssClass="fonteErroFormulario" ErrorMessage="Campo deve ser preenchido."></asp:RequiredFieldValidator>
            </div>
            <div style="position: absolute;">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbConfirmaEmail"
                    ErrorMessage="Formato inválido." CssClass="fonteErroFormulario" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbEmail"
                    ControlToValidate="tbConfirmaEmail" ErrorMessage="E-mail não confere." CssClass="fonteErroFormulario"
                    Display="Dynamic"></asp:CompareValidator>                    
                    
            </div>
            
        </div>
                

        <div class="left">
            <div class="MyTextBox">
                <div class="izq">
                    CPF</div>
                <div>
                    <%--<asp:TextBox ID="tbCPF" runat="server" MaxLength="14" onKeyDown="Mascara(this,Cpf);" onKeyPress="Mascara(this,Cpf);" onKeyUp="Mascara(this,Cpf);"></asp:TextBox>--%>
                    <asp:TextBox ID="tbCPF" runat="server" MaxLength="14" onpaste="Mascara(this,Cpf);"
                    onKeyDown="FormataCpf2(this,Cpf,event);" onkeypress="return mascaraNumero();" ></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="right">
            <div style="position: absolute;">
                <asp:RequiredFieldValidator ID="rfvCPF" ControlToValidate="tbCPF" runat="server"
                    CssClass="fonteErroFormulario" ErrorMessage="Campo deve ser preenchido."></asp:RequiredFieldValidator>
            </div>
            <div style="position: absolute;">
                <asp:CustomValidator ID="cvCPF" runat="server" ErrorMessage="CPF inválido."
                    ControlToValidate="tbCPF" CssClass="fonteErroFormulario" ClientValidationFunction="chkCPF"></asp:CustomValidator>
            </div>
        </div>

        <div class="left" style="padding:0px;">
            <div class="izq"><span class="fonteExemplo">Exemplo: 111.222.333-44</span></div>
        </div>

        <div class="left">
            <div class="MyTextBox">
                <div class="izq">
                    Tipo</div>
                <div>
                    <asp:DropDownList ID="ddlTipo" runat="server" Width="255px" Height="19px" Style="border: 0px;
                        margin-top: 3px"  AutoPostBack="True"
                        CssClass="MySelect">
                        <asp:ListItem Value="0" Text="Aluno" />
                        <asp:ListItem Value="1" Text="Candidato" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div runat="server" id="divMatricula" style="margin: 0px; padding: 0px;">
            <div class="left">
                <div class="MyTextBox">
                    <div class="izq">
                        Matrícula</div>
                    <div>
                        <asp:TextBox ID="tbMatricula" runat="server" MaxLength="12" onkeypress="return mascaraNumero();"/></div>
                </div>
            </div>
            <div class="right">
                <div style="position: absolute;">
                    <asp:RequiredFieldValidator ID="rfvMatricula" ControlToValidate="tbMatricula" runat="server"
                        ErrorMessage="Campo deve ser preenchido." CssClass="fonteErroFormulario"></asp:RequiredFieldValidator>
                </div>
                <div style="position: absolute;">
                    <asp:RangeValidator ID="rvMatricula" ControlToValidate="tbMatricula" runat="server" ErrorMessage="Campo só aceita números" MinimumValue="0" MaximumValue="9999999999999999999999"/>
                </div>
            </div>
        </div>
        <div class="left">
            <div class="MyTextBox">
                <div class="izq">
                    Data nascimento</div>
                <div>
                    <asp:TextBox ID="tbDataNascimento" runat="server" MaxLength="10" onkeypress="return mascaraData2(this);"></asp:TextBox></div>
            </div>
        </div>
        <div class="right">
            <div style="position: absolute;">
                <asp:RequiredFieldValidator ID="rfvDataNascimento" ControlToValidate="tbDataNascimento"
                    runat="server" ErrorMessage="Campo deve ser preenchido." CssClass="fonteErroFormulario"></asp:RequiredFieldValidator>
            </div>
            <div style="position: absolute;">
                <asp:RangeValidator ID="rvDataNascimento" runat="server" EnableClientScript="true"
                    Type="Date" MinimumValue="01/01/1900" ErrorMessage="Campo no formato inválido."
                    MaximumValue="01/01/2999" ControlToValidate="tbDataNascimento" CssClass="fonteErroFormulario"></asp:RangeValidator>
            </div>
        </div>

        <div class="left" style="padding:0px;">
            <div class="izq"><span class="fonteExemplo">Exemplo: dd/mm/aaaa</span></div>
        </div>

        <div class="left">
            <div class="MyTextBox">
                <div class="izq">
                    Senha</div>
                <div>
                    <asp:TextBox ID="tbSenha" runat="server" TextMode="Password" MaxLength="8"></asp:TextBox></div>
            </div>
        </div>
        <div class="right">
            <div style="position: absolute;">
                <asp:RequiredFieldValidator ID="rfvSenha" ControlToValidate="tbSenha" runat="server"
                    ErrorMessage="Campo deve ser preenchido." CssClass="fonteErroFormulario"></asp:RequiredFieldValidator>
            </div>
            <div style="position: absolute;">
                <asp:RegularExpressionValidator ID="revlMinSenha" runat="server" ControlToValidate="tbSenha"
                    ErrorMessage="O campo deve ter no mínimo 4 caracteres." ValidationExpression=".{4}.*"
                    CssClass="fonteErroFormulario" />
            </div>
        </div>

        <div class="left" style="padding:0px;">
            <div class="izq"><span class="fonteExemplo">O campo Senha deve ter no mínimo 4 dígitos e no máximo 8.</span></div>
        </div>

        <div class="left">
            <div class="MyTextBox">
                <div class="izq">
                    Confirma Senha</div>
                <div>
                    <asp:TextBox ID="tbConfirmaSenha" runat="server" TextMode="Password" MaxLength="8"></asp:TextBox></div>
            </div>
        </div>
        <div class="right">
            <div style="position: absolute;">
                <asp:RequiredFieldValidator ID="rfvConfirmaSenha" ControlToValidate="tbConfirmaSenha"
                    runat="server" ErrorMessage="Campo deve ser preenchido." CssClass="fonteErroFormulario"></asp:RequiredFieldValidator>
            </div>

            <div style="position: absolute;width: 240px;">
                <asp:CompareValidator ID="cvConfirmaSenha" runat="server" ControlToCompare="tbSenha"
                    ControlToValidate="tbConfirmaSenha" ErrorMessage="Senha não confere." CssClass="fonteErroFormulario"
                    Display="Dynamic"></asp:CompareValidator>
                <asp:RegularExpressionValidator ID="revlConfirmaMinSenha" runat="server" ControlToValidate="tbConfirmaSenha"
                    ErrorMessage="O campo deve ter no mínimo 4 caracteres." ValidationExpression=".{4}.*"
                    CssClass="fonteErroFormulario" />
            </div> 

        </div>
        
       
        

        <div class="left" style="padding:0px;">
            <div class="izq"><span class="fonteExemplo">O campo Confirma Senha deve ter no mínimo 4 dígitos e no máximo 8.</span></div>
        </div>

        
        <div class="left">
            <div class="MyTextBox">
                <div class="izqMaior">
                    Digite o texto acima</div>
                <div>
                    <asp:TextBox ID="tbCaptcha" runat="server" Width="200px"></asp:TextBox></div>
            </div>
        </div>
        <div class="right">
            <div style="position: absolute;">
                <asp:RequiredFieldValidator ID="rfvCaptcha" ControlToValidate="tbCaptcha" runat="server"
                    ErrorMessage="Campo deve ser preenchido." CssClass="fonteErroFormulario"></asp:RequiredFieldValidator>
            </div>
            <div style="position: absolute;">
                <asp:Label ID="lbCaptchaErro" runat="server" CssClass="fonteErroFormulario" Visible="false" />
            </div>
        </div>
        <div class="left class_derecha">
             
			<% /* <asp:ImageButton ID="Button1" runat="server" ImageUrl="images/btnEnviar.gif" OnClick="cmdInsert_Click"  /> */  %>
			  <asp:Button ID="Button1" runat="server" Text="Enviar" OnClick="Button1_Click" /> 
        </div>
    </div>


    </form>
    
    </div>

    </div>

</body>
</html>
