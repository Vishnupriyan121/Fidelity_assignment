package Exception_handling;

import java.util.List;

public class EmployeeService {
    public Employee findEmployeeById(List<Employee> employees, int id) throws EmployeeNotFoundException {
        for (Employee employee : employees) {
            if (employee.getId() == id) {
                return employee;
            }
        }
        throw new EmployeeNotFoundException("Employee with ID " + id + " not found.");
    }
}
