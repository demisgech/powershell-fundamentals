
class Person {
    hidden [Int] $id
    hidden [String] $firstName
    hidden [String] $lastName

    Person( [Int] $id, [String] $firstName, [String] $lastName ) {
        $this.id = $id
        $this.firstName = $firstName
        $this.lastName = $lastName
    }

    [Void] SetId([Int] $id) {
        $this.id = $id
    }

    [Int] GetId() {
        return $this.id
    }

    [Void] SetFirstName([String] $firstName) {
        $this.firstName = $firstName
    }

    [String] GetFirstName() {
        return $this.firstName
    }

    [Void] SetLastName([String] $lastName) {
        $this.lastName = $lastName
    }

    [String] GetLastName() {
        return $this.lastName
    }

    [String] GetFullName() {
        return "{0} {1}" -f $this.firstName, $this.lastName
    }
}

$person = [Person]::new(1, "Yohannes", "Getachew")
# $person.SetFirstName("John")

$person.GetFullName()

class Teacher: Person {
    hidden [String] $subject
    hidden [Int] $yearsOfExperience

    Teacher(
        [Int] $id,
        [String] $firstName,
        [String] $lastName,
        [String] $subject,
        [Int] $yearsOfExperience
    ) : base( $id, $firstName, $lastName ) {
        $this.subject = $subject
        $this.yearsOfExperience = $yearsOfExperience
    }

    [Void] SetSubject([String] $subject) {
        $this.subject = $subject
    }

    [String] GetSubject() {
        return $this.subject
    }

    [Void] SetYearsOfExperience([Int] $years) {
        $this.yearsOfExperience = $years
    }

    [Int] GetYearsOfExperience() {
        return $this.yearsOfExperience
    }

    [String] GetTeacherInfo() {
        return "{0}, Subject: {1}, Experience: {2} years" -f $this.GetFullName(), $this.subject, $this.yearsOfExperience
    }
    [String] GetFullName() {
        return ([Person]$this).GetFullName() + " (Teacher)"
    }
}


[Teacher] $teacher = [Teacher]::new(1, "Yohannes", "Getachew", "Math", 5)
$teacher.GetTeacherInfo()
$teacher.GetFullName()
class Employee : Person {
    hidden [String] $position
    hidden [Decimal] $salary

    Employee(
        [Int] $id,
        [String] $firstName,
        [String] $lastName,
        [String] $position,
        [Decimal] $salary
    ) : base( $id, $firstName, $lastName ) {
        $this.position = $position
        $this.salary = $salary
    }

    [Void] SetPosition([String] $position) {
        $this.position = $position
    }

    [String] GetPosition() {
        return $this.position
    }

    [Void] SetSalary([Decimal] $salary) {
        $this.salary = $salary
    }

    [Decimal] GetSalary() {
        return $this.salary
    }

    [String] GetEmployeeInfo() {
        return "{0}, Position: {1}, Salary: {2:C}" -f $this.GetFullName(), $this.position, $this.salary
    }
}

$employee = [Employee]::new(1, "Yohannes", "Getachew", "Developer", 60000)

$employee.GetEmployeeInfo()


class Manager : Employee {
    hidden [String[]] $teamMembers

    Manager(
        [Int] $id,
        [String] $firstName,
        [String] $lastName,
        [String] $position,
        [Decimal] $salary,
        [String[]] $teamMembers
    ) : base( $id, $firstName, $lastName, $position, $salary ) {
        $this.teamMembers = $teamMembers
    }

    [Void] SetTeamMembers([String[]] $teamMembers) {
        $this.teamMembers = $teamMembers
    }

    [String[]] GetTeamMembers() {
        return $this.teamMembers
    }

    [String] GetManagerInfo() {
        $team = if ($this.teamMembers) { $this.teamMembers -join ", " } else { "No team members" }
        return "{0}, Team Members: {1}" -f $this.GetEmployeeInfo(), $team
    }
}

$manager = [Manager]::new(
    1, "Yohannes", "Getachew", 
    "Team Lead", 80000, 
    @("Alice", "Bob")
)
$manager.GetManagerInfo()

class Department {
    hidden [String] $name
    hidden [Manager] $manager
    hidden [Employee[]] $employees

    Department( 
        [String] $name, 
        [Manager] $manager, 
        [Employee[]] $employees ) {
        $this.name = $name
        $this.manager = $manager
        $this.employees = $employees
    }

    [Void] SetName([String] $name) {
        $this.name = $name
    }

    [String] GetName() {
        return $this.name
    }
    
    [Void] SetManager([Manager] $manager) {
        $this.manager = $manager
    }
    
    [Manager] GetManager() {
        return $this.manager
    }
    
    [Void] SetEmployees([Employee[]] $employees) {
        $this.employees = $employees
    }
    
    [Employee[]] GetEmployees() {
        return $this.employees
    }
    
    [String] GetDepartmentInfo() {
        $employeeNames = if ($this.employees) {
            ( $this.employees | ForEach-Object { $_.GetFullName() }) -join ", " 
        }
        else {
            "No employees"
        }
        return "Department: {0}, Manager: {1}, Employees: {2}" -f $this.name, $this.manager.GetFullName(), $employeeNames
    }
}


[Department] $department = [Department]::new(
    "Software Engineering",
    [Manager]::new(
        1, "Yohannes", "Getachew", 
        "Team Lead", 80000,
        @("Alice", "Bob")
    ),
    @(
        [Employee]::new(2, "Alice", "Smith", "Developer", 60000),
        [Employee]::new(3, "Bob", "Johnson", "Designer", 55000)
    )
)
$department.GetDepartmentInfo()
