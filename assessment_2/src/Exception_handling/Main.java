package Exception_handling;
import java.util.List;
import java.util.ArrayList;
import java.util.List;


public class Main {
    public static void main(String[] args) {
        List<Employee> employees = new ArrayList<>();
        employees.add(new Employee(1, "Vishnu"));
        employees.add(new Employee(2, "Vasanth"));
        employees.add(new Employee(3, "Siva"));

        EmployeeService employeeService = new EmployeeService();

        try {
            Employee employee = employeeService.findEmployeeById(employees, 2);
            System.out.println("Employee found: " + employee.getName());
        } catch (EmployeeNotFoundException e) {
            System.out.println(e.getMessage());
        }

        try {
            Employee employee = employeeService.findEmployeeById(employees, 4);
            System.out.println("Employee found: " + employee.getName());
        } catch (EmployeeNotFoundException e) {
            System.out.println(e.getMessage());
        }
    }
}


