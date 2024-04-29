using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static Bragais_Activity_4.Bragais_Activity_4.Form1;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace Bragais_Activity_4
{
    public partial class PasswordRecovery : Form
    {
        public PasswordRecovery()
        {
            InitializeComponent();
        }

        private void PasswordRecovery_Load(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(user.Text) || string.IsNullOrWhiteSpace(newpassword.Text) || string.IsNullOrWhiteSpace(confirmpassword.Text))
            {
                MessageBox.Show("Please fill in all the fields.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return; // Exit the event handler to prevent further execution
            }
            else
            {
                string path = "server=localhost;uid=root;pwd=krizannebragais19;database=bragais_database_edp";
                MySqlConnection conn = new MySqlConnection(path);
                conn.Open();
                MySqlCommand command = conn.CreateCommand();

                // Check if the username exists in the database
                command.CommandText = "SELECT COUNT(*) FROM admin WHERE username = @username";
                command.Parameters.AddWithValue("@username", user.Text);
                int count = Convert.ToInt32(command.ExecuteScalar());
                if (count == 0)
                {
                    MessageBox.Show("Username not found.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    conn.Close();
                    return;
                }

                // Update the password for the user
                command.CommandText = "UPDATE admin SET password = @password, confirm_password = @conpassword WHERE username = @username";
                command.Parameters.Clear(); // Clear previous parameters
                command.Parameters.AddWithValue("@password", newpassword.Text);
                command.Parameters.AddWithValue("@conpassword", confirmpassword.Text);
                command.Parameters.AddWithValue("@username", user.Text);
                command.ExecuteNonQuery();
                conn.Close();

                MessageBox.Show("Password updated successfully.");

                var confirm = new Login(); // Instantiate Form2
                confirm.Show(); // Show Form2
                this.Hide(); // Hide the current form
            }
        }

    }
}
