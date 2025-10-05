
class Person {
    hidden [Int] $id
    hidden [String] $firstName
    hidden [String] $lastName

    Person([Int] $id, [String] $firstName, [String] $lastName) {
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

class Teacher : Person {
    Teacher(
        [Int] $id, 
        [String] $firstName, 
        [String] $lastName
    ) : base($id, $firstName, $lastName) {
    }

    [String] GetFullName() {
        return "Teacher {0}" -f ""
    }
}

class Professor : Person {
    Professor(
        [Int] $id, 
        [String]$firstName,
        [String] $lastName
    ): base($id, $firstName, $lastName) {
    }

    [String] GetFullName() {
        return "Professor {0}" -f ''
    }
}

$teacher = [Teacher]::new(1, "Alemu", "Kebede")
Get-Member -InputObject $teacher