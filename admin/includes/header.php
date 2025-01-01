using System;
using System.Data;
using System.Linq;
using System.Windows.Forms;
using System.Xml;

namespace EmployeeSearchApp
{
    public partial class Form1 : Form
    {
        // Constructor to initialize the form and its components.
        public Form1()
        {
            InitializeComponent();
        }

        // Event handler for the "Search" button click event.
        private void searchButton_Click(object sender, EventArgs e)
        {
            // Retrieve the Employee ID entered by the user in the text box.
            string employeeId = idTextBox.Text.Trim();

            // Check if the entered Employee ID is empty or null.
            if (string.IsNullOrEmpty(employeeId))
            {
                MessageBox.Show("Please enter a valid Employee ID.", "Input Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;  // Exit the method if no ID is provided.
            }

            try
            {
                // Load the XML document containing employee data.
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load("employees.xml");

                // Retrieve all employee nodes from the XML document.
                XmlNodeList employees = xmlDoc.GetElementsByTagName("employee");

                // Create a DataTable to hold the employee details for display.
                DataTable dt = new DataTable();
                dt.Columns.Add("Employee ID");       // Column for Employee ID.
                dt.Columns.Add("Employee Name");     // Column for Employee Name.
                dt.Columns.Add("Employee Salary");   // Column for Employee Salary.
                dt.Columns.Add("Employee Skills");   // Column for Employee Skills.

                // Flag to check if an employee with the entered ID was found.
                bool found = false;

                // Loop through each employee node in the XML document.
                foreach (XmlNode employee in employees)
                {
                    // Retrieve individual employee data from the XML elements.
                    string id = employee["id"]?.InnerText;         // Employee ID.
                    string name = employee["name"]?.InnerText;     // Employee Name.
                    string salary = employee["salary"]?.InnerText; // Employee Salary.

                    // Check if the employee has skills listed.
                    string skills = string.Empty;
                    if (employee["skills"] != null)
                    {
                        var skillNodes = employee["skills"].SelectNodes("skill");
                        if (skillNodes != null && skillNodes.Count > 0)
                        {
                            skills = string.Join(", ", skillNodes.Cast<XmlNode>().Select(s => s.InnerText));
                        }
                    }

                    // Check if the current employee's ID matches the entered ID.
                    if (id == employeeId)
                    {
                        // Add the found employee details into the DataTable.
                        dt.Rows.Add(id, name, salary, skills);
                        found = true; // Set flag to true as the employee was found.
                        break; // Exit the loop once the employee is found.
                    }
                }

                // If no employee with the given ID was found, show a message.
                if (!found)
                {
                    MessageBox.Show("Employee not found!", "Search Result", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

                // Bind the DataTable to the DataGridView for displaying the result.
                dataGridView.DataSource = dt;
            }
            catch (XmlException xmlEx)
            {
                // Handle XML parsing errors (e.g., if the XML file is malformed).
                MessageBox.Show($"Error loading XML file: {xmlEx.Message}", "XML Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (Exception ex)
            {
                // Handle other general errors that may occur.
                MessageBox.Show($"An unexpected error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // Additional helper method to load the XML file for testing purposes
        // and ensure that the XML file exists.
        private bool LoadXmlFile(string filePath)
        {
            try
            {
                // Check if the XML file exists.
                if (System.IO.File.Exists(filePath))
                {
                    return true;
                }
                else
                {
                    MessageBox.Show("The XML file does not exist. Please ensure the file is located in the correct directory.", "File Not Found", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error accessing the XML file: {ex.Message}", "File Access Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        // Optional: A helper method for saving a new employee to the XML file.
        private void SaveEmployeeToXml(string employeeId, string employeeName, string employeeSalary, string employeeSkills)
        {
            try
            {
                // Create a new XmlDocument and load the existing XML file.
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load("employees.xml");

                // Create a new employee node.
                XmlNode newEmployee = xmlDoc.CreateElement("employee");

                // Add sub-elements for the employee data.
                XmlElement idElement = xmlDoc.CreateElement("id");
                idElement.InnerText = employeeId;
                newEmployee.AppendChild(idElement);

                XmlElement nameElement = xmlDoc.CreateElement("name");
                nameElement.InnerText = employeeName;
                newEmployee.AppendChild(nameElement);

                XmlElement salaryElement = xmlDoc.CreateElement("salary");
                salaryElement.InnerText = employeeSalary;
                newEmployee.AppendChild(salaryElement);

                // Add skills, if any.
                XmlElement skillsElement = xmlDoc.CreateElement("skills");
                foreach (string skill in employeeSkills.Split(','))
                {
                    XmlElement skillElement = xmlDoc.CreateElement("skill");
                    skillElement.InnerText = skill.Trim();
                    skillsElement.AppendChild(skillElement);
                }
                newEmployee.AppendChild(skillsElement);

                // Append the new employee node to the document.
                xmlDoc.DocumentElement.AppendChild(newEmployee);

                // Save the updated XML document.
                xmlDoc.Save("employees.xml");
                MessageBox.Show("Employee added successfully!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                // Handle any errors during the save operation.
                MessageBox.Show($"Error saving employee data: {ex.Message}", "Save Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
