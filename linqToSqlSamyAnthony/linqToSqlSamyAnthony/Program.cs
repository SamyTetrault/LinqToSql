using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Data.Common;
using System.Data.Linq;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace linqToSqlSamyAnthony
{
    internal class Program
    {
        static void Main(string[] args)
        {

            const string chaine = "Data Source=PC-SAMY/SQLEXPRESS;Initial Catalog=samyAnthoLinqToSql;";

            LinqToSqlAtelier1DataContext db = new LinqToSqlAtelier1DataContext(chaine);

            while (true)
            {
                Console.WriteLine("Choose an option:");
                Console.WriteLine("1. Show list of employee numbers and their department");
                Console.WriteLine("2. Show list of working employees' names");
                Console.WriteLine("3. Show name of department with the most employees");
                Console.WriteLine("4. Modify an employee's first name by their number");
                Console.WriteLine("5. Delete a department for a given manager");
                Console.WriteLine("6. Exit");

                string choice = Console.ReadLine();

                switch (choice)
                {
                    case "1":
                        var results = db.GetEmployeeListWithDepartment();
                        foreach (var result in results)
                        {
                            Console.WriteLine("Numéro d'employé : {0}, Département : {1}", result.EmployeeID, result.DepartmentName);
                        }
                        break;
                    case "2":
                        var resultsName = db.GetActiveEmployeeNames();
                        foreach (var result in resultsName)
                        {
                            Console.WriteLine("Numéro d'employé : {0}, Département : {1}", result.FirstName, result.LastName);
                        }
                        break;
                    case "3":
                        var resultsMostEmploye = db.GetDepartmentWithMostEmployees();
                        foreach (var result in resultsMostEmploye)
                        {
                            Console.WriteLine("Numéro d'employé : {0}, Département : {1}", result.DepartmentName, result.EmployeeCount);
                        }
                        break;
                    case "4":
                        Console.Write("Enter the new employee's name: ");
                        string name = Console.ReadLine();
                        Console.Write("Enter the employee's id: ");
                        int id = int.Parse(Console.ReadLine());

                        db.UpdateEmployeeFirstName(id, name);
                        db.SubmitChanges();

                        Console.Write("The employee's name has been changed to : " + name);
                        break;
                    case "5":
                        Console.Write("Enter the manager's id: ");
                        int managerId = int.Parse(Console.ReadLine());
                        Console.Write("Enter the manager's id: ");
                        int departmentId = int.Parse(Console.ReadLine());

                        db.DeleteDepartmentForManager(departmentId,managerId);
                        db.SubmitChanges();

                        Console.Write("The manager department has been deleted");
                        break;
                    case "6":
                        return;
                    default:
                        Console.WriteLine("Invalid choice. Please enter a number between 1 and 6.");
                        break;
                }
            }
        }
    }
}
