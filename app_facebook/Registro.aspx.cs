using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//CONEXAO COM A BASE DE DADOS
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class Registro : System.Web.UI.Page
{
    public string CPF;
    public string connectionString = @"Data Source=ESTACIODESA-01;Initial Catalog=AmigoIndicaEstacio;User ID=metatron;Password=Est!1234; Integrated Security=SSPI;";
    

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void InserirIndicado(Object sender, EventArgs e)
    {

        if (IsCpf(tbCpf.Text))
        {
            string IDAmigoIndicador = Request.QueryString["fb"];
            if (Request.QueryString["fb"] != "" && Request.QueryString["fb"] != null)
            {

                if (tbEmail.Text != "" && tbTelefone.Text != "" && tbNome.Text != "" && tbIDUsuarioFace.Text != "" && tbNome.Text != "")
                {

                    //Definir os objetos ADO.NET
                    string insertSQL;
                    insertSQL = "INSERT INTO IndicadoRegistro (";
                    insertSQL += "Nome, Email, CPF, Telefone, IDUsuarioFace, IDAmigoIndicaFace, DataCadastro  )";
                    insertSQL += "VALUES (";
                    insertSQL += "@Nome, @Email, @CPF, @Telefone, @IDUsuarioFace, @IDAmigoIndicaFace, @DataCadastro )";

                    SqlConnection con = new SqlConnection(connectionString);
                    SqlCommand cmd = new SqlCommand(insertSQL, con);

                    cmd.Parameters.AddWithValue("@Nome", tbNome.Text);
                    cmd.Parameters.AddWithValue("@Email", tbEmail.Text);
                    cmd.Parameters.AddWithValue("@CPF", tbCpf.Text);
                    cmd.Parameters.AddWithValue("@IDUsuarioFace", tbIDUsuarioFace.Text);
                    cmd.Parameters.AddWithValue("@IDAmigoIndicaFace", IDAmigoIndicador);
                    cmd.Parameters.AddWithValue("@Telefone", tbTelefone.Text);
                    cmd.Parameters.AddWithValue("@DataCadastro", DateTime.Now.ToString());

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
                    lblmsg.Text = " <script>$('.formularios h2').append('<div class=\"alert alert-danger\">Preencha todos os campos corretamente!</div>');  </script>";
                }
            } //validar se existe usuario indicador
              else {
                  lblmsg.Text = " <script>$('.formularios h2').append('<div class=\"alert alert-danger\">Cadastro recusado. Você deve ser indicado por algum amigo do Facebook!</div>');  </script>";
            }

        }  //validar CPF
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