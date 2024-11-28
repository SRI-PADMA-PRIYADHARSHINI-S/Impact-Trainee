package Employee;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;
import java.io.FileNotFoundException;

/*
 * Author : Sri padma priyadharshini 
 * Title : EmployeeManagementSystem
 */

public class EmployeeManagementSystem {
    private List<employee> employees;

    public EmployeeManagementSystem() {
        employees = new ArrayList<>();
    }

    // Method to add a new employee
    public void addEmployee() {
        Scanner scanner = new Scanner(System.in);

        try {
            System.out.print("Enter employee ID: ");
            int id = scanner.nextInt();
            scanner.nextLine();  // Consume the newline left by nextInt()

            // Check if ID is unique
            if (!isIdUnique(id)) {
                System.out.println("Employee ID already exists. Please enter a unique ID.");
                return;
            }

            System.out.print("Enter employee name: ");
            String name = scanner.nextLine();

            System.out.print("Enter employee position: ");
            String position = scanner.nextLine();

            System.out.print("Enter employee salary: ");
            double salary = scanner.nextDouble();

            // Create and add the employee to the list
            employee employee = new employee(id, name, position, salary);
            employees.add(employee);
            System.out.println("Employee added successfully!");

        } catch (Exception e) {
            System.out.println("Invalid input. Please try again.");
            scanner.nextLine(); // Consume the invalid input to avoid infinite loop
        }
    }

    // Method to display all employees
    public void displayEmployees() {
        if (employees.isEmpty()) {
            System.out.println("No employees found.");
        } else {
            System.out.println("\n--- Employee List ---");
            for (employee employee : employees) {
                employee.displayEmployee();
            }
        }
    }

    // Method to remove an employee
    public void removeEmployee() {
        Scanner scanner = new Scanner(System.in);
        
        try {
            System.out.print("Enter employee ID to remove: ");
            int id = scanner.nextInt();

            employee employeeToRemove = null;

            // Find the employee to remove
            for (employee employee : employees) {
                if (employee.getId() == id) {
                    employeeToRemove = employee;
                    break;
                }
            }

            if (employeeToRemove != null) {
                employees.remove(employeeToRemove);
                System.out.println("Employee removed successfully!");
            } else {
                System.out.println("Employee not found.");
            }

        } catch (Exception e) {
            System.out.println("Invalid input. Please try again.");
        }
    }

    // Method to search an employee by ID
    public void searchEmployee() {
        Scanner scanner = new Scanner(System.in);
        
        try {
            System.out.print("Enter employee ID to search: ");
            int id = scanner.nextInt();

            employee employeeToSearch = null;

            // Find the employee in the collection
            for (employee employee : employees) {
                if (employee.getId() == id) {
                    employeeToSearch = employee;
                    break;
                }
            }

            if (employeeToSearch != null) {
                System.out.println("\n--- Employee Found ---");
                employeeToSearch.displayEmployee();
            } else {
                System.out.println("Employee not found.");
            }

        } catch (Exception e) {
            System.out.println("Invalid input. Please try again.");
        }
    }

    // Method to update an employee's details
    public void updateEmployee() {
        Scanner scanner = new Scanner(System.in);

        try {
            System.out.print("Enter employee ID to update: ");
            int id = scanner.nextInt();
            scanner.nextLine(); // Consume the newline left by nextInt()

            employee employeeToUpdate = null;

            // Find the employee to update
            for (employee employee : employees) {
                if (employee.getId() == id) {
                    employeeToUpdate = employee;
                    break;
                }
            }

            if (employeeToUpdate != null) {
                // Ask for new details and update
                System.out.print("Enter new name: ");
                employeeToUpdate.setName(scanner.nextLine());

                System.out.print("Enter new position: ");
                employeeToUpdate.setPosition(scanner.nextLine());

                System.out.print("Enter new salary: ");
                employeeToUpdate.setSalary(scanner.nextDouble());

                System.out.println("Employee details updated successfully!");
            } else {
                System.out.println("Employee not found.");
            }

        } catch (Exception e) {
            System.out.println("Invalid input. Please try again.");
        }
    }

    // Method to check if employee ID is unique
    public boolean isIdUnique(int id) {
        for (employee employee : employees) {
            if (employee.getId() == id) {
                return false; // ID already exists
            }
        }
        return true;
    }

    // Method to save employee details to file
    public void saveEmployeesToFile() {
        try (PrintWriter writer = new PrintWriter(new FileWriter("employees.txt"))) {
            for (employee employee : employees) {
                writer.println(employee.getId() + "," + employee.getName() + "," + employee.getPosition() + "," + employee.getSalary());
            }
            System.out.println("Employees data saved to file.");
        } catch (IOException e) {
            System.out.println("Error saving data: " + e.getMessage());
        }
    }

    // Main method for user interaction
    public static void main(String[] args) {
        EmployeeManagementSystem system = new EmployeeManagementSystem();
        Scanner scanner = new Scanner(System.in);
        int choice;

        // Loop for menu
        do {
            System.out.println("\n--- Employee Management System ---");
            System.out.println("1. Add Employee");
            System.out.println("2. Display All Employees");
            System.out.println("3. Remove Employee");
            System.out.println("4. Search Employee by ID");
            System.out.println("5. Update Employee");
            System.out.println("6. Save Employees to File");
            System.out.println("7. Exit");
            System.out.print("Enter your choice: ");
            
            try {
                choice = scanner.nextInt();

                switch (choice) {
                    case 1:
                        system.addEmployee();
                        break;
                    case 2:
                        system.displayEmployees();
                        break;
                    case 3:
                        system.removeEmployee();
                        break;
                    case 4:
                        system.searchEmployee();
                        break;
                    case 5:
                        system.updateEmployee();
                        break;
                    case 6:
                        system.saveEmployeesToFile();
                        break;
                    case 7:
                        System.out.println("Exiting the system...");
                        break;
                    default:
                        System.out.println("Invalid choice! Please try again.");
                }
            } catch (Exception e) {
                System.out.println("Invalid input. Please enter a valid option.");
                scanner.nextLine();  // Consume the invalid input
            }

        } while (true);

        
        
    }
}
