#$response = Invoke-RestMethod -Method Get https://dummyjson.com/products

#$response.products[0] | Format-List

class Product {
    [int] $id;
    [string] $title;
    [double] $price;

    Product([int] $id,[string] $title,[double] $price){
        $this.id = $id
        $this.title = $title
        $this.price = $price
    }
}


class HttpService {
    [Product[]] getAll([string] $uri){
        try {
            $products = @()
            $data = Invoke-RestMethod -Method Get $uri
            foreach($product in $data.products){
                $products += [Product]::new($product.id,$product.title,$product.price)
            }
            return $products
        } catch {
            Write-Output "Failed to fetch products. $_"
            return @()
       }
   }

   [Product] getProductById([int] $id) {
    try {
            $products = @()
            $product = Invoke-RestMethod -Method Get "$uri/$id}"
           return [Product]::new($product.id,$product.title,$product.price)
        
        } catch {
            Write-Output "Failed to fetch products. $_"
            return @()
       }
   }

   [Product] post([String] $uri,[Product] $product) {
    $response = Invoke-RestMethod -Method Post -data $product
    ...
   }
}

$httpService = [HttpService]::new();
$products = $httpService.getAll('https://dummyjson.com/products')

foreach($product in $products) {
    Write-Output "{ id: $($product.id), title: $($product.title), price: $($product.price) }"
}
