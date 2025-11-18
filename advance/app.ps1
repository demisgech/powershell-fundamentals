
class Shape {
    hidden [String] $color
    
    Shape([string] $color) {
        $this.color = $color
    }

    [Void] SetColor([String] $color) {
        $this.color = $color
    }

    [String] GetColor() {
        return $this.color
    }

    [double] GetArea() {
        throw "GetArea() method must be implemented by subclasses"
    }
    [double] GetPerimeter() {
        throw "GetPerimeter() method must be implemented by subclasses"
    }
}

class Circle : Shape {
    hidden [double] $radius

    Circle([String] $color, [Double] $radius) : base($color) {
        $this.radius = $radius
    }

    [Void] SetRadius([Double] $radius) {
        $this.radius = $radius
    }

    [double] GetRadius() {
        return $this.radius
    }

    [double]  GetArea() {
        return [Math]::PI * [Math]::Pow($this.radius, 2)
    }
    [Double]  GetPerimeter() {
        return 2 * [Math]::PI * $this.radius
    }

    [String] ToString() {
        return "Circle(Color: $($this.color), Radius: $($this.radius))"
    }
}

$circle = [Circle]::new("Red", 5)
Write-Host $circle

$area = $circle.GetArea()
Write-Host "Circle Area: $area"


class Rectangle : Shape {
    [double] $width
    [double] $height

    Rectangle(
        [String] $color,
        [Double] $width,
        [Double] $height
    ) : base($color) {
        $this.width = $width
        $this.height = $height
    }

    [Void] SetWidth([Double] $width) {
        $this.width = $width
    }

    [Void] SetHeight([Double] $height) {
        $this.height = $height
    }

    [double] GetWidth() {
        return $this.width
    }

    [double] GetHeight() {
        return $this.height
    }

    [double]  GetArea() {
        return $this.width * $this.height
    }
    
    [Double]  GetPerimeter() {
        return 2 * ($this.width + $this.height)
    }

    [String] ToString() {
        return "Rectangle(Color: $($this.color), Width: $($this.width), Height: $($this.height))"
    }
}

$rectangle = [Rectangle]::new("Blue", 4, 6)
Write-Host $rectangle;

$area = $rectangle.GetArea()
Write-Host "Rectangle Area: $area"

