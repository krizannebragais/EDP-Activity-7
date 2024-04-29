using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Bragais_Activity_4
{
    internal class employee_add
    {
        internal class DataAddUsers
        {


            private MySqlConnection connection;

            public int ID { set; get; }
            public int emp_id { set; get; }
            public string fname { set; get; }
            public string lname { set; get; }
            public string branch { set; get; }
            public int salary { set; get; }
            public int employee_status { set; get; }

            public DataAddUsers()
            {
                connection = new MySqlConnection("server=localhost;uid=root;pwd=krizannebragais19;database=bragais_database_edp");
            }

            public List<DataAddUsers> DataUsers(string email)
            {
                List<DataAddUsers> userDataList = new List<DataAddUsers>();

                try
                {
                    if (connection.State != ConnectionState.Open)
                        connection.Open();

                    string query = "SELECT * FROM employees WHERE date_delete IS NULL";
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        MySqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            DataAddUsers userData = new DataAddUsers
                            {
                                ID = (int)reader["ID"],
                                emp_id = (int)reader["emp_id"],
                                fname = reader["first_name"].ToString(),
                                lname = reader["last_name"].ToString(),
                                branch = reader["branch"] != DBNull.Value ? reader["branch"].ToString() : "",
                                salary = (int)reader["salary"],
                                employee_status = (int)reader["status"],
                            };

                            userDataList.Add(userData);
                        }

                        reader.Close();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error connecting Database: " + ex.Message);
                }
                finally
                {
                    connection.Close();
                }

                return userDataList;
            }
        }
    }
}
