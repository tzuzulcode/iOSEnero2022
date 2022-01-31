import UIKit

var greeting = "Hello, playground"

struct SampleStruct {
    var name: String
    init(name:String){
        self.name = name
    }
    
    func buildHelloMessage(){
        "Hola " + name
    }
}
class SampleClass{
    var name: String
    init(name:String){
        self.name = name
    }
    
    func buildHelloMessage(){
        "Hola " + name
    }
}


let myStruct = SampleStruct(name: "Tzuzul")
let myClass = SampleClass(name: "Tzuzul")

// Value types vs Reference types
// struct -> value types
// class -> reference types


//modificarStruct(instance: myStruct)


var myStruct2 = myStruct

myStruct2.name = "Mary"

print(myStruct.name)
print(myStruct2.name)

var myClass2 = myClass
myClass2.name = "Mary"

print(myClass.name)
print(myClass2.name)

enum Temperature{
    case hot
    case warm
    case cold
}

func displayTempInfo(temp:Temperature){
    switch temp{
    case .hot:
        print("Hace calor")
    case .warm:
        print("Buen clima")
    case .cold:
        print("Hace frio")
    }
}
