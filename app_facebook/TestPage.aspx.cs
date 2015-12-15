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

public partial class TestPage : System.Web.UI.Page
{
    //Data Source=ESTACIODESA-01;Initial Catalog=AmigoIndicaEstacio;User ID=metatron;Password=Est!1234;"
    public string connectionString = @"Data Source=ESTACIODESA-01;Initial Catalog=AmigoIndicaEstacio;User ID=metatron;Password=Est!1234; Integrated Security=SSPI;";

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    public void Button1_Click(object sender, EventArgs e) {

        //Define ADO.NET Connection
        //string connectionString = WebConfigurationManager.ConnectionStrings["CadastroSimples"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        try
        {
            myConnection.Open();
            tbNome.Text = "Versao: " + myConnection.ServerVersion;
            tbNome.Text += "<br />Estado da Conexão: " + myConnection.State.ToString() + "<br />";
        }
        catch (Exception err)
        {
            myConnection.Close();
            tbNome.Text = "Deu ruim" + err.Message;
        }
        finally {
            myConnection.Close();
            tbNome.Text = "Fechou conexao";
        }


        SqlCommand myCommand = new SqlCommand();
        myCommand.Connection = myConnection;
    }

    protected void cmdInsert_Click(Object sender, EventArgs e) { 
        //validador
        if (lblMensagemSucesso.Text == "") {
            LabelResp2.Text = "Preencha os campos obrigatórios.";
        }
    
        //Definir os objetos ADO.NET
        /*
         *  ,[NumeroInscricao]
            ,[NumeroMatricula]
            ,[DataMatricula]
            ,[Instituicao]
            ,[Campus]
            ,[Curso]
            ,[origem]
         */
        string insertSQL;
        insertSQL = "INSERT INTO Usuarios (";
        insertSQL += "Nome, Email, CPF, Tipo, DataNascimento, Senha, ConfirmaSenha, Data, NumeroInscricao,NumeroMatricula,DataMatricula, Instituicao, Campus, Curso, origem  )";
        insertSQL += "VALUES (";
        insertSQL += "@Nome, @Email, @CPF, @Tipo, @DataNascimento, @Senha, @ConfirmaSenha, @Data, @NumeroInscricao,@NumeroMatricula,@DataMatricula, @Instituicao, @Campus, @Curso, @origem  )";

        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand( insertSQL, con );

        cmd.Parameters.AddWithValue("@Nome", tbNome.Text);
        cmd.Parameters.AddWithValue("@Email", tbEmail.Text);
        cmd.Parameters.AddWithValue("@CPF", tbCPF.Text);
        cmd.Parameters.AddWithValue("@Tipo", "1");
        cmd.Parameters.AddWithValue("@DataNascimento", Convert.ToDateTime(tbDataNascimento.Text) );
        cmd.Parameters.AddWithValue("@Senha", tbSenha.Text);
        cmd.Parameters.AddWithValue("@ConfirmaSenha", tbConfirmaSenha.Text);
        cmd.Parameters.AddWithValue("@Data", DateTime.Now.ToString());
        cmd.Parameters.AddWithValue("@NumeroInscricao", "NULL");
        cmd.Parameters.AddWithValue("@NumeroMatricula", tbMatricula.Text);
        cmd.Parameters.AddWithValue("@DataMatricula", DateTime.Now.ToString());
        cmd.Parameters.AddWithValue("@Instituicao", "NULL");
        cmd.Parameters.AddWithValue("@Campus", "NULL");
        cmd.Parameters.AddWithValue("@Curso", "NULL");
        cmd.Parameters.AddWithValue("@origem", 1);

        int added = 0;
        try
        {
            con.Open();
            added = cmd.ExecuteNonQuery();
            LabelResp2.Text = added.ToString() + " Campos inseridos...";
            Response.Redirect("Default.aspx");
        }
        catch (Exception err)
        {
            LabelResp2.Text = "Erro ao inserir os dados";
            LabelResp2.Text += "Error: " + err.Message;
        }
        finally {
            con.Close();
        }


    }


}