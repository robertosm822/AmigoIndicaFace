<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Painel-de-amigos.aspx.cs" Inherits="Painel_de_amigos" %>
<!--#include file="Html/header.html"-->
<!-- Titulo da sessão -->
	<div class="container-fixed">
		<div class="pageName">
			<img src="images/painel-de-amigos.jpg" height="79" width="800" alt="">
		</div>
	</div><!-- Fim Titulo da sessão -->

	<!-- Painel de amigos -->
	<div class="container-fixed">
		<div class="panel">

			<div class="halfSize">
				<div class="boxEstats">
					<h4>Número de <br /><strong>indicados</strong> <span>28</span></h4>
				</div>
			</div>
			<div class="halfSize">
				<div class="boxEstats">
					<h4>Número de <br /><strong>cadastrados</strong> <span>12</span></h4>
				</div>
			</div>
			<div class="halfSize">
				<div class="boxEstats">
					<h4>Número de <br /><strong>matriculados</strong> <span>4</span></h4>
				</div>
			</div>
			<div class="halfSize">
				<div class="boxEstats">
					<h4>Total de <br /><strong>desconto obtido</strong> <span>40%</span></h4>
				</div>
			</div>

			<div class="clear"></div>

			<h2>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod</h2>
			<p class="labels"><span class="matriculado">Amigos Matriculados</span> <span class="naoMatriculado">Amigos não matriculados</span> </p>

			<div class="amigos">
				<div class="halfSize">
					<div class="amigo matriculado">
						<img src="images/exemplo.jpg" height="60" width="62" alt="">
						<h3>Nome do amigo matriculado</h3>
					</div>
				</div>

				<div class="halfSize">
					<div class="amigo naoMariculado">
						<img src="images/exemplo.jpg" height="60" width="62" alt="">
						<h3>Nome do amigo não matriculado</h3>
					</div>
				</div>

				<div class="halfSize">
					<div class="amigo naoMariculado">
						<img src="images/exemplo.jpg" height="60" width="62" alt="">
						<h3>Nome do amigo não matriculado</h3>
					</div>
				</div>

				<div class="halfSize">
					<div class="amigo matriculado">
						<img src="images/exemplo.jpg" height="60" width="62" alt="">
						<h3>Nome do amigo matriculado</h3>
					</div>
				</div>

			</div>

		</div>
	</div><!-- Fim Painel de amigos -->

	<!-- Box Link direto -->
	<div class="container-fixed">
		<div class="boxLinkDireto">
			<p>Com o link direto, você tem a liberdade de indicar amigos como quiser. Copie e cole onde achar melho: no seu mural do Facebook ou simplesmente em uma mensagem por e-mail.</p>
			<p class="copy">http://www.amigoindicaestacio.com.br/ci.aspx?Tipo=LinkDireto&UsuarioId=aaf4a882-4184-4ae4-8cb3-4a6a30b23923</p>
		</div>
	</div><!-- Fim Box Link direto -->

<!--#include file="Html/footer.html"-->
