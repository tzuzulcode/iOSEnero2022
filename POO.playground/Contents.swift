// Instance
// Objetos: Instancias de un clase
// Properties y methods

// Class
// Son el plano o el prototipo para crear un objeto

class BankAccount{
    // properties
    
    //Stored properties
    let accountName:String
    var accountBalance: Float = 0
    var accountNumber: Int = 0
    let fees: Float = 25.00
    
    var myProperty: String = {
        //hacer algo
        //Hacer otra cosa
        return "Hola"
    }()
    
    // Resource intensive y time consuming
    // Solo se definirse al acceder a la propiedad por primera vez
    lazy var myLazyProperty: String = {
        //Hacer algo
        print("Accediendo. Calculando...")
        
        return "Hola"
    }()
    
    //Computed properties
    var balanceLessFees: Float{
        get{
            return accountBalance - fees
        }
        set(newBalance){
            accountBalance = newBalance - fees
        }
    }
    
    //Lazy stored properties
    
    
    //Inicialization
    init(accountNumber:Int,balance:Float,name:String){
        //self.accountNumber = number
        // Nosotros tenemos que utilizar self en:
        // Closure expressions *
        self.accountNumber = accountNumber
        accountBalance = balance
        accountName = name
    }
    
    deinit{
       //Hacer algo
    }
    // Instance methods
    func displayBalance(){
        print("Account number: \(accountNumber)")
        print("Current balance: \(accountBalance)")
    }
    
    // Type methods
    
    class func getMaxBalance()->Float{
        return 100000.00
    }
}

// Herencia
class SavingAccount: BankAccount{
    var interestRate: Float = 0.0
    
    init(number:Int,balance:Float,name:String,rate:Float){
        super.init(accountNumber: number, balance: balance, name: name)
        interestRate = rate
    }
    
    func calculateInterest()->Float{
        return accountBalance * interestRate
    }
    /*
    override func displayBalance() {
        print("Account number: \(accountNumber)")
        print("Current balance: \(accountBalance)")
        print("Your interest rate is: \(interestRate)")
    }
     */
    override func displayBalance() {
        super.displayBalance()
        print("Your interest rate is: \(interestRate)")
    }
}


//Creando una instancia de la clase
var account1: BankAccount = BankAccount(accountNumber: 10, balance: 1000, name: "Tzuzul")
print(account1.accountNumber)
account1.accountBalance = 2000
print(account1.accountBalance)

//Utilizando computed properties

account1.balanceLessFees = 3000

print(account1.accountBalance)


//Crear unn cliente con 100000000
let maxAllowed = BankAccount.getMaxBalance()

print(maxAllowed)


print(account1.myLazyProperty)
print(account1.myLazyProperty)


//Protocols
// Un conjunto de reglas que definen los requerimientos minimos para una clase

protocol MessageBuilder {
    var name:String{get}
    func buildMessage()->String
}

class Message: MessageBuilder {
    var name: String
    
    init(name:String){
        self.name = name
    }
    
    func buildMessage() -> String {
        "Hola mundo"
    }
    
}

class Notification:MessageBuilder {
    var name: String{
        get{
            return "Tzuzul"
        }
    }
    
    func buildMessage() -> String {
        "Tienes una nueva notificación"
    }
}


let savingAccount = SavingAccount(number: 10, balance: 600, name: "Tzuzul", rate: 0.7)

print(savingAccount.calculateInterest())
savingAccount.displayBalance()


// Creando extension
extension Notification{
    func cleanNotification()->String{
        "Cleaned"
    }
}

let notification = Notification()

print(notification.buildMessage())
print(notification.cleanNotification())


extension Double{
    var squared:Double{
        return self * self
    }
}

let myDouble: Double = 3.0

print(myDouble.squared)
