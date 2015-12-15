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

public partial class Cadastro1 : System.Web.UI.Page
{
    public string connectionString = @"Data Source=ESTACIODESA-01;Initial Catalog=AmigoIndicaEstacio;User ID=metatron;Password=Est!1234; Integrated Security=SSPI;";
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void Button1_Click(object sender, EventArgs e)
    {

        //Define ADO.NET Connection
        //string connectionString = WebConfigurationManager.ConnectionStrings["CadastroSimples"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        try
        {
            myConnection.Open();
            tbResposta.Text = "Versao: " + myConnection.ServerVersion;
            tbResposta.Text += "<br />Estado da Conexão: " + myConnection.State.ToString() + "<br />";
        }
        catch (Exception err)
        {
            myConnection.Close();
            tbResposta.Text = "Deu ruim" + err.Message;
        }
        finally
        {
            //tbNome.Text = "Versao: " + myConnection.ServerVersion;
            //tbNome.Text += "\n Estado da Conexão: " + myConnection.State.ToString() + "\n";
            myConnection.Close();
            tbResposta.Text = "\nFechou conexao - " + myConnection.State.ToString();
        }


        SqlCommand myCommand = new SqlCommand();
        myCommand.Connection = myConnection;
    }

    //cadastro de novo indicador
    protected void cmdInsert_Click(Object sender, EventArgs e)
    {
        //validador
        if (tbNome.Text == "")
        {
            tbResposta.Text = "Preencha os campos obrigatórios.";
        }

        if (IsCpf(tbCPF.Text))
        {

            if (tbSenha.Text != tbConfirmaSenha.Text)
            {
                lblmsg.Text = "<script>$('#confSenha').attr('class', 'form-group erro'); " +
                    "$('#confSenha').append('<p class=\"msgErro\"> Senhas não conferem.</p>');" +
                    " $('.formularios h2').append('<div class=\"alert alert-danger\">Preencha todos os campos corretamente! <br /> - Campos de senha não correspondem. </div>');  </script>";
            }
            else
            {


                //captcha validacao
                if (this.txtimgcode.Text == this.Session["CaptchaImageText"].ToString())
                {
                    lblmsg.Text = "Ok";

                    if (tbMatricula.Text == "")
                    {
                        tbMatricula.Text = "1";
                    }

                    //Definir os objetos ADO.NET
                    string insertSQL;
                    insertSQL = "INSERT INTO Usuarios (";
                    insertSQL += "Nome, Email, CPF, Tipo, DataNascimento, Senha, ConfirmaSenha, Data, NumeroInscricao, NumeroMatricula, DataMatricula, Instituicao, Campus, Curso, origem, Telefone, idUserFace  )";
                    insertSQL += "VALUES (";
                    insertSQL += "@Nome, @Email, @CPF, @Tipo, @DataNascimento, @Senha, @ConfirmaSenha, @Data, @NumeroInscricao, @NumeroMatricula, @DataMatricula, @Instituicao, @Campus, @Curso, @origem, @Telefone, @idUserFace  )";

                    SqlConnection con = new SqlConnection(connectionString);
                    SqlCommand cmd = new SqlCommand(insertSQL, con);

                    cmd.Parameters.AddWithValue("@Nome", tbNome.Text);
                    cmd.Parameters.AddWithValue("@Email", tbEmail.Text);
                    cmd.Parameters.AddWithValue("@CPF", tbCPF.Text);
                    cmd.Parameters.AddWithValue("@Tipo", "1");
                    cmd.Parameters.AddWithValue("@DataNascimento", Convert.ToDateTime(tbDataNascimento.Text));
                    cmd.Parameters.AddWithValue("@Senha", tbSenha.Text);
                    cmd.Parameters.AddWithValue("@ConfirmaSenha", tbConfirmaSenha.Text);
                    cmd.Parameters.AddWithValue("@Data", DateTime.Now.ToString());
                    cmd.Parameters.AddWithValue("@NumeroInscricao", "NULL");
                    cmd.Parameters.AddWithValue("@NumeroMatricula", tbMatricula.Text);
                    cmd.Parameters.AddWithValue("@DataMatricula", DateTime.Now.ToString());
                    cmd.Parameters.AddWithValue("@Telefone", tbTelefone.Text);
                    cmd.Parameters.AddWithValue("@Instituicao", "NULL");
                    cmd.Parameters.AddWithValue("@Campus", "NULL");
                    cmd.Parameters.AddWithValue("@Curso", "NULL");
                    cmd.Parameters.AddWithValue("@origem", 1);
                    cmd.Parameters.AddWithValue("@idUserFace", idUserFace.Text);

                    int added = 0;
                    try
                    {
                        con.Open();
                        added = cmd.ExecuteNonQuery();
                        tbResposta.Text = added.ToString() + " Campos inseridos...";
                        //Response.Redirect("Default.aspx");
                        lblmsg.Text = "<script>$('.formularios h2').append('<div class=\"alert alert-success\">Cadastro realizado com sucesso!</div>'); $('form').each(function(){ $('form input').val(''); }); </script>";
                    }
                    catch (Exception err)
                    {
                        tbResposta.Text = "Erro ao inserir os dados";
                        tbResposta.Text += "Error: " + err.Message;
                    }
                    finally
                    {
                        con.Close();
                    }

                }
                else
                {
                    lblmsg.Text = "<script>$('#myCaptcha .form-group').attr('class', 'form-group erro'); " +
                        "$('#myCaptcha .form-group').append('<p class=\"msgErro\"> Codigo de Imagem inválido.</p>');" +
                        " $('.formularios h2').append('<div class=\"alert alert-danger\">Preencha todos os campos corretamente!</div>');  </script>";
                }
                this.txtimgcode.Text = "";

            } //comparando senhas
        } //validar CPF
            else {

            lblmsg.Text = "<script>$('#valCPF div.form-group').attr('class', 'form-group erro'); $('#valCPF div.form-group').append('<p class=\"msgErro\"> CPF inválido.</p>');   $('.formularios h2').append('<div class=\"alert alert-danger\">Preencha todos os campos corretamente!</div>');  </script>";
        }


    }
    
    public static bool IsCpf(string cpf)
    {
        int[] multiplicador1 = new int[9] { 10, 9, 8, 7, 6, 5, 4, 3, 2 };
        int[] multiplicador2 = new int[10] { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };
        string tempCpf;
        string digito;
        int soma;
        int resto;
        cpf = cpf.Trim();
        cpf = cpf.Replace(".", "").Replace("-", "");
        if (cpf.Length != 11)
            return false;
        tempCpf = cpf.Substring(0, 9);
        soma = 0;

        for (int i = 0; i < 9; i++)
            soma += int.Parse(tempCpf[i].ToString()) * multiplicador1[i];
        resto = soma % 11;
        if (resto < 2)
            resto = 0;
        else
            resto = 11 - resto;
        digito = resto.ToString();
        tempCpf = tempCpf + digito;
        soma = 0;
        for (int i = 0; i < 10; i++)
            soma += int.Parse(tempCpf[i].ToString()) * multiplicador2[i];
        resto = soma % 11;
        if (resto < 2)
            resto = 0;
        else
            resto = 11 - resto;
        digito = digito + resto.ToString();
        return cpf.EndsWith(digito);
    }

}