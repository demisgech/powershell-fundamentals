
# Abstract Base class
class Shape {
    [Void] draw() {
        throw [System.Exception]::new("Method Not Implemented")
    }
}

class Circle: Shape {
    [Void] draw() {
        Write-Host "Drawing circle..."
    }
}

# $circle = [Circle]::new()
# $circle.draw()

# try {
#     $shape = [Shape]::new()
#     $shape.draw()
# }
# catch {
#     Write-Host $_
# }


class BaseCreateMixin {
    [String] create() {
        throw [System.Exception]::new("Method Not Implemented")
    }
}

class BaseListMixin {
    [String] list() {
        throw [System.Exception]::new("Method Not Implemented")
    }
}


class BaseListCreateMixin {
    [String] create() {
        throw [System.Exception]::new("Method Not Implemented")
    }

    [String] list() {
        throw [System.Exception]::new("Method Not Implemented")
    }
}


$listCreateMixin = [BaseListCreateMixin]::new()
$listCreateMixin.create()
