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
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace Bragais_Activity_4
{
    public partial class employee : Form
    {
        private MySqlConnection connection;
        public employee()
        {
            InitializeComponent();
            string connectionString = "server=localhost;uid=root;pwd=krizannebragais19;database=bragais_database_edp";
            connection = new MySqlConnection(connectionString);
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            if (emp_id.Text == "" || first_name.Text == "" || last_name.Text == "" ||
            branch.Text == "" || salary.Text == "" || status.Text == "")
            {
                MessageBox.Show("Please fill all the blank fields", "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                try
                {
                    if (connection.State != ConnectionState.Open)
                        connection.Open();

                    // Check if user ID already exists
                    string checksUserId = "SELECT COUNT(*) FROM employees WHERE emp_id = @emp_id";
                    using (MySqlCommand checkuserid = new MySqlCommand(checksUserId, connection))
                    {
                        checkuserid.Parameters.AddWithValue("@emp_id", emp_id.Text.Trim());
                        int count = Convert.ToInt32(checkuserid.ExecuteScalar());
                        if (count > 0)
                        {
                            MessageBox.Show("Employee ID: " + emp_id.Text.Trim() + " already exists",
                                            "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            return; // Exit the method to prevent further execution
                        }
                    }

                    // If user ID doesn't exist, proceed with insertion
                    DateTime today = DateTime.Today;
                    string insertData = "INSERT INTO employees " +
                    "(emp_id, fname, lname, branch, salary, employee_status) " +
                    "VALUES (@emp_id, @fname, @lname, @branch, @salary, @employee_status)";

                    using (MySqlCommand cmd = new MySqlCommand(insertData, connection))
                    {
                        cmd.Parameters.AddWithValue("@emp_id", emp_id.Text.Trim());
                        cmd.Parameters.AddWithValue("@fname", first_name.Text.Trim());
                        cmd.Parameters.AddWithValue("@lname", last_name.Text.Trim());
                        cmd.Parameters.AddWithValue("@branch", branch.Text.Trim());
                        cmd.Parameters.AddWithValue("@salary", salary.Text.Trim());
                        cmd.Parameters.AddWithValue("@employee_status", status.Text.Trim());



                        // Execute the command
                        cmd.ExecuteNonQuery();

                        // Refresh the DataGridView with updated data
                        LoadData();

                        MessageBox.Show("Added successfully!", "Information Message", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("An error occurred: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    connection.Close();
                }
            }


        }

        private void LoadData()
        {
            try
            {
                string connectionString = "server=localhost;uid=root;pwd=krizannebragais19;database=bragais_database_edp";
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM employees";
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        MySqlDataAdapter adapter = new MySqlDataAdapter(command);
                        DataSet dataSet = new DataSet();
                        adapter.Fill(dataSet);
                        dataGridView1.DataSource = dataSet.Tables[0];
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("An error occurred: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button3_Click_1(object sender, EventArgs e)   //update
        {
            if (emp_id.Text == "" || first_name.Text == "" || last_name.Text == "" ||
            branch.Text == "" || salary.Text == "" || status.Text == "")
            {
                MessageBox.Show("Please fill all the blank fields", "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                try
                {
                    if (connection.State != ConnectionState.Open)
                        connection.Open();

                    // Check if user ID already exists
                    string checksUserId = "SELECT COUNT(*) FROM employees WHERE emp_id = @emp_id";
                    using (MySqlCommand checkuserid = new MySqlCommand(checksUserId, connection))
                    {
                        checkuserid.Parameters.AddWithValue("@emp_id", emp_id.Text.Trim());
                        int count = Convert.ToInt32(checkuserid.ExecuteScalar());
                        if (count == 0)
                        {
                            MessageBox.Show("Employee ID: " + emp_id.Text.Trim() + " does not exist",
                                            "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            return; // Exit the method to prevent further execution
                        }
                    }

                    // If user ID exists, proceed with update
                    DateTime today = DateTime.Today;
                    string updateData = "UPDATE employees SET " +
                                        "fname = @fname, " +
                                        "lname = @lname, " +
                                        "branch = @branch, " +
                                        "salary = @salary, " +
                                        "employee_status = @status " +
                                        "WHERE emp_id = @emp_id";

                    using (MySqlCommand cmd = new MySqlCommand(updateData, connection))
                    {
                        cmd.Parameters.AddWithValue("@emp_id", emp_id.Text.Trim());
                        cmd.Parameters.AddWithValue("@fname", first_name.Text.Trim());
                        cmd.Parameters.AddWithValue("@lname", last_name.Text.Trim()); 
                        cmd.Parameters.AddWithValue("@branch", branch.Text.Trim());
                        cmd.Parameters.AddWithValue("@salary", salary.Text.Trim());
                        cmd.Parameters.AddWithValue("@status", status.Text.Trim());

                        // Execute the command
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Refresh the DataGridView with updated data
                            LoadData();

                            MessageBox.Show("Update successful!", "Information Message", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                        else
                        {
                            MessageBox.Show("Failed to update user with ID: " + emp_id.Text.Trim(), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("An error occurred: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    connection.Close();
                }

            }
        }

        private void LoadData1()
        {
            try
            {
                string connectionString = "server=localhost;uid=root;pwd=krizannebragais19;database=bragais_database_edp";
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM employees";
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        MySqlDataAdapter adapter = new MySqlDataAdapter(command);
                        DataSet dataSet = new DataSet();
                        adapter.Fill(dataSet);
                        dataGridView1.DataSource = dataSet.Tables[0];
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("An error occurred: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
