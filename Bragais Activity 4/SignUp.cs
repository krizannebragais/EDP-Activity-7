using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace Bragais_Activity_4
{
    public partial class SignUp : Form
    {
        public SignUp()
        {
            InitializeComponent();
        }

        internal void show()
        {
            // Replace this line with the actual implementation
            Console.WriteLine("This is the show() method implementation.");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(username.Text) || string.IsNullOrWhiteSpace(password.Text) || string.IsNullOrWhiteSpace(confirm_pass.Text))
            {
                MessageBox.Show("Please fill in all the fields.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else
            { }
            string path = "server=localhost;uid=root;pwd=krizannebragais19;database=bragais_database_edp";
            MySqlConnection connection = new MySqlConnection(path);
            connection.Open(); show();
            MySqlCommand command = connection.CreateCommand();

            command.CommandText = "INSERT INTO admin (username, password, confirm_password) VALUES (@username, @password, @conpassword)";
            command.Parameters.AddWithValue("@username", username.Text);
            command.Parameters.AddWithValue("@password", password.Text);
            command.Parameters.AddWithValue("@conpassword", confirm_pass.Text);
            command.ExecuteNonQuery();
            connection.Close();

            MessageBox.Show("Registered Successfully");

            var confirm = new Login();
            confirm.Show();
            this.Hide();
            
        }





        public partial class registerform : Form
        {
            //private string path;

            public registerform()
            {

            }

            private void registerform_Load(object sender, EventArgs e)
            {

            }

            private void button1_Click(object sender, EventArgs e)
            { }
        }
    }
    namespace Bragais_Activity_4
    {
        public partial class Form1 : Form
        {
            public partial class SignUp : Form
            {
                public SignUp()
                {
                    InitializeComponent();
                }

                private void InitializeComponent()
                {
                    throw new NotImplementedException();
                }

                private void Form1_Load(object sender, EventArgs e)
                {
                    // You can place initialization code here if needed
                }

                private void label4_Click(object sender, EventArgs e)
                {
                    global::Bragais_Activity_4.SignUp signUpForm = new global::Bragais_Activity_4.SignUp();
                    signUpForm.Show();
                    this.Hide();
                }

                private void pictureBox3_Click(object sender, EventArgs e)
                {
                    Application.Exit();
                }

                private void label5_Click(object sender, EventArgs e)
                {
                    // Handle label5 click event if needed
                }
            }
        }
    }
}