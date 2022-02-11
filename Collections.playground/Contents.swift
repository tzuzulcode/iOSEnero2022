import UIKit

var greeting = "Hello, playground"


//var frutas = ["Piña","Manzana","Fresa"]
let frutas = ["Piña","Manzana","Fresa"]

let frutas2:[String] = ["Sandia","Melon","Uvas"]

let unionFrutas = frutas + frutas2

var nameArray = [String](repeating: "Tzuzul", count: 10)

print(nameArray)

//Numero de elementos
nameArray.count

nameArray.isEmpty

unionFrutas[4]


print(unionFrutas.shuffled())
unionFrutas.randomElement()


//Arreglo vacio
//let alumnos = [String]()
var alumnos:[String] = ["Jean Carlos","Miguel"]
alumnos.append("Mary")

alumnos.insert("Tzuzul", at: 1)
alumnos.remove(at: 1)
alumnos.removeLast()

print(alumnos)

for alumno in alumnos{
    print(alumno)
}


alumnos.forEach{alumno in
    print(alumno)
}

alumnos.forEach{
    print($0)
}


let mixedArray:[Any] = ["Un string",432,34.989]

/*
for data in mixedArray{
    print(data as! Int * 10)
}
 */

var bookDictionary:[String:String] =
    ["100":"Nombre de libro",
     "200":"Nombre de libro",
     "300":"Nombre de libro"]

bookDictionary["100"]="Libro..."
bookDictionary["100"]
