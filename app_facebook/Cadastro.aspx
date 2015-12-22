<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastro.aspx.cs" Inherits="Cadastro1" %>
<!--#include file="Html/header.html"-->

  
<!-- Titulo da sessão -->
	<div class="container-fixed">
		<div class="pageName">
			<img src="images/cadastro.jpg" height="77" width="800" alt="">
		</div>
	</div><!-- Fim Titulo da sessão -->

	<!-- Box cadastro -->
	<div class="container-fixed">
		<div class="formularios">

			<h2>Cadastre-se para começar a indicar amigos e a ganhar descontos.</h2>

			<form id="form1" runat="server">
                
                <asp:Label style="display: none;" class="alert alert-success" runat=server ID="tbResposta" role="alert"></asp:Label>
                
			<!-- Campo nome -->
			<div class="fullSize">
				<div class="form-group">
					<label for="nome">Nome:</label>
					
					<asp:TextBox ID="tbNome" runat="server" required></asp:TextBox>
				
				</div>
			</div>

			<!-- Campo email -->
			<div class="halfSize">
				<div class="form-group">
					<label for="email">E-mail:</label>
					
					<asp:TextBox ID="tbEmail" runat="server" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required></asp:TextBox>
					
				
				</div>
			</div>
			
			

			<!-- Campo Confirma email -->
			<div class="halfSize">
				<div class="form-group">
					<label for="vemail">Confirma E-mail:</label>
					
					<asp:TextBox ID="tbConfirmaEmail" runat="server" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required></asp:TextBox>
					
				</div>
			</div>

			<!-- CPF -->
			<div class="oneThird" id="valCPF">
				<div class="form-group">
					<label for="cpf">CPF:</label>
					
					<asp:TextBox ID="tbCPF" runat="server" MaxLength="14" onpaste="Mascara(this,Cpf);"
                    onKeyDown="FormataCpf2(this,Cpf,event);" onkeypress="return mascaraNumero();" required></asp:TextBox>
					
					<p class="example">Exemplo: 111.222.333-44</p>
				</div>
			</div>

			<!-- Tipo -->
			<div class="oneThird">
				<div class="form-group">
					<label for="tipo">Tipo:</label>
					
					<asp:DropDownList ID="ddlTipo" runat="server" Width="255px" Height="19px" Style="border: 0px;
                        margin-top: 3px" required>
                        <asp:ListItem Value="" Text="Escolha Tipo" />
                        <asp:ListItem Value="0" Text="Aluno" />
                        <asp:ListItem Value="1" Text="Candidato" />
                    </asp:DropDownList>
					
				</div>
			</div>

			<!-- Matrícula -->
			<div class="oneThird" id="blMatricula" style="display: none;">
				<div class="form-group">
					<label for="matricula">Matrícula:</label>
					
					<asp:TextBox ID="tbMatricula" runat="server" MaxLength="12" onkeypress="return mascaraNumero();"></asp:TextBox>
				
				</div>
			</div>

			<!-- Data de nascimento -->
			<div class="oneThird">
				<div class="form-group" runat="server" id="divMatricula">
					<label for="dtnascimento">Data nascimento:</label>
					
					<asp:TextBox ID="tbDataNascimento" runat="server" MaxLength="10" onkeypress="return mascaraData2(this);" required></asp:TextBox>
					
					<p class="example">Exemplo: dd/mm/aaaa</p>
				</div>
			</div>

			<!-- Senha -->
			<div class="oneThird">
				<div class="form-group">
					<label for="senha">Senha:</label>
					
					
					<asp:TextBox ID="tbSenha" runat="server" TextMode="Password" MaxLength="8" required></asp:TextBox>
					
					<p class="example">mínimo 4 dígitos e no máximo 8.</p>
				</div>
			</div>
			

			<!-- Senha -->
			<div class="oneThird">
				<div class="form-group" id="confSenha">
					<label for="csenha">Confirma senha:</label>
					
					<asp:TextBox ID="tbConfirmaSenha"  runat="server" TextMode="Password" MaxLength="8" required></asp:TextBox>
					
					<p class="example">mínimo 4 dígitos e no máximo 8.</p>
				</div>
			</div>
			
			<!-- Senha -->
			<div class="oneThird" style="width: 100% !important;">
				<div class="form-group">
					<label for="csenha">Telefone:</label>
					
					<asp:TextBox ID="tbTelefone" onkeypress="return mascaraTelefone(this);"  style="width: 204.5px" runat="server" MaxLength="15" required></asp:TextBox>
					
					<p class="example">formato (xx) xxxxx-xxxx.</p>
				</div>
			</div>
			

			<div class="halfSize" id="myCaptcha">
                
                <div class="captchaImage">
				<% /*	<img src="images/captcha-example.jpg" height="56" width="208" alt="" /> */ %>
                    
                    <asp:Image ID="Image1" runat="server" ImageUrl="CImage.aspx" />
				</div>
				<div class="form-group">
					<label for="captcha">Digite o texto acima:</label>
                    <asp:TextBox ID="txtimgcode" name="txtimgcode" runat="server"></asp:TextBox>
				</div>
                    <asp:Label ID="lblmsg" runat="server" Font-Bold="True" 
	                ForeColor="Red" Text=""></asp:Label>
	               
	                <asp:TextBox ID="idUserFace" type="hidden" value="" name="idUserFace" runat="server"></asp:TextBox>
			</div>
			


			<div class="halfSize">
				<div class="form-group button">
				
				
				    <asp:Button ID="Button2" class="btnSubmit" runat="server" Text="Enviar" OnClick="cmdInsert_Click" />
				
				</div>
			</div>

			</form>
		</div>
	</div><!-- Fim Box cadastro -->
   
<!--#include file="Html/footer.html"-->
