using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//TESTANDO CONEXAO COM A BASE DE DADOS
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration; 

public partial class Painel_de_amigos : System.Web.UI.Page
{
    public string connectionString = @"Data Source=ESTACIODESA-01;Initial Catalog=AmigoIndicaEstacio;User ID=metatron;Password=Est!1234; Integrated Security=SSPI;";

    [System.Web.Services.WebMethod]
    protected void Page_Load(object sender, EventArgs e)
    {
        string IdGetUserFace;
        Session["Conteudo"] = "";
        /* RESGATAR VIA GET O ID DO FACE DO USUARIO */
        IdGetUserFace = Request.QueryString["fb"];

        if (Request.QueryString["fb"] != null && Request.QueryString["fb"] != "")
        {
            /* COMPARAR IDFACE PASSADO COM IDFACE NA BASE */
            //==============================================================================================
            string insertSQL1;
            insertSQL1 = "SELECT [ID],[Nome],[Email],[CPF],[Senha], [IDUserFace] FROM [AmigoIndicaEstacio].[dbo].[Usuarios] WHERE IDUserFace = '" + Request.QueryString["fb"] + "'";

            SqlConnection con1 = new SqlConnection(connectionString);
            SqlCommand cmd1 = new SqlCommand(insertSQL1, con1);
            SqlDataReader reader1;

            con1.Open();
            reader1 = cmd1.ExecuteReader();

            string newItem = "";
            string Nome = "";
            while (reader1.Read())
            {
                Nome = reader1["Nome"].ToString();
                newItem = reader1["IDUserFace"].ToString();
            }
            reader1.Close();
            //============================================================================================== 
            if (newItem == IdGetUserFace)
            {
                Session["Conteudo"] = "Logado no Facebook";
                Session["Nome"] = Nome;
                tbNomeUser.Text = "Olá: "+Session["Nome"];
                /* REALIZAR ROTINA DE VERIFICAR PELO IDFACEBOOK SE USUARIO ENCONTRA-SE CADASTRADO NO SISTEMA */
                tbResposta.Text = "<script> $('span#tbResposta').hide();</script>";
            }
            else {
                Session["Conteudo"] = "";
            }

           
        }
        else {
            tbResposta.Text = "<script>$('span#tbResposta').show(); $('span#tbResposta').attr('class','alert alert-danger'); $('span#tbResposta').append('<div class=\"alert alert-danger\"> Área restrita, cadastre-se no programa para acessar esta área!   </div>'); </script>";
            Session["Conteudo"] = "";
        }
    }
}