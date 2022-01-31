import UIKit

//Type inference
var greeting = "Hello, playground"

print("Hello, playground")

var myNumber = 10 // Integer

var myFloat = 13.45

var myBoolean = true

var myChar = "f"

var myChar2 = ":"


var name = "Juan"

var message = "\(name) tiene este dinero \(myFloat) "

//Multi line
var long_message = """
    Saludos

    Cómo estas?
"""
long_message = """
        Saludos!

        ¿Cómo estas?

"""

print(long_message)

let userID:Int// Annotation

userID = 10

let myTuple = (10,432.434,saludo:"Hola mundo")

let saludo = myTuple.saludo

// Si no necesito un valor, colocar _
let (_,dinero,mensaje) = myTuple // Desestructuración


//Optionals

let index: Int?

let array = ["Edson","Karen","Mariann"] // Array

index = 2

// nulo -> null
// swift: nulo ->nil
if index != nil {
    print(array[index!])
}else{
    
}

// Unwrapping
// if let: verifica si no es nulo
if let elemento = index{
    print(array[elemento])
}else{
    
}

var pet1:String?
var pet2:String?

pet1 = "cat"
pet2 = "dog"


if let firstPet = pet1,let secondPet = pet2 {
    print(firstPet)
    print(secondPet)
}else{
    print("Mascotas insuficientes")
}

//Up cast y down cast

let myButton: UIButton = UIButton()
let myControl = myButton as UIControl


let myScrollView: UIScrollView = UIScrollView()
//let myTextView = myScrollView as! UITextView

if let myTextView = myScrollView as? UITextView{
    print("Type cast exitoso")
    print(myTextView)
}

var x: Int?
var y = 10

x = 10
let resultado = x!*y


// Operadores aritméticos: + - / *

y+=1 // y = y + 2
y*=2 // y = y * 2
print(y)

//Operadores lógicos:
// == > < <= >= !=
// Union de condiciones:
// || or
// && and
if x==y || y>x!{
    print("Son iguales o y es mayor")
}else if y==22{
    print("Tiene un valor")
}else{
    print("No son iguales")
}


//Rangos
1...5 // 1,2,3,4,5

1..<5 // 1,2,3,4

//Operador ternario
print("El número más grande es: \(x!>y ? x! : y)")


//Ciclo for
for index in 1...5{
    print(index)
}

for _ in 1...5{
    print("Repetición")
}


var counter = 0

while counter<5{
    print(counter)
    counter+=1
}


repeat{
    print(counter)
    counter-=1
}while(counter>0)


// Función
func multiplicarPorDiez(value:Int?){
    // Guard
    guard let number = value,number<10 else{
        print("El numero es muy grande o nulo")
        return
    }
    
    let resultado = number * 10
    print(resultado)
}

multiplicarPorDiez(value: 5)

let opcion = 3
switch(opcion){
case 0:
    print("Cero")
case 1:
    print("Uno")
case 2...5 where opcion % 2 == 0:
    print("Dos al cinco y par")
case 2...5 where opcion % 2 != 0:
    print("Dos al cinco y impar")
default:
    print("Opción no valida")
}

func buildMessage(username name:String,_ id:Int)->String{
    let upperName = name.uppercased()
    return "\(upperName), eres el cliente \(id)"
}

func buildMessage2(_ name:String = "Invitado",id:Int)->String{
    let upperName = name.uppercased()
    return "\(upperName), eres el cliente \(id)"
}

//Se recibe la medida en pulgadas
func sizeConverter(_ length:Float) -> (yards:Float,centimeters:Float,meters:Float){
    let yards = length*0.277778
    let centimeters = length * 2.54
    let meters = length * 0.0254
    return(yards,centimeters,meters)
}

message = buildMessage2(id:5)

print(message)

let lengthTuple = sizeConverter(105)
print(lengthTuple)

print(lengthTuple.centimeters)
