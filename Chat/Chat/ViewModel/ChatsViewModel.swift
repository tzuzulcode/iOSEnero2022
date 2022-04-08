//
//  ChatsViewModel.swift
//  Chat
//
//  Created by Tzuzul Rosas on 06/04/22.
//

import Foundation
import FirebaseDatabase
import FirebaseFirestore

class ChatsViewModel:ObservableObject{
    var uid = ""
    
    private let encoder = JSONEncoder()
    var ref:DatabaseReference? = nil
    
    let db = Firestore.firestore().collection("users")
    
    var users:[Person] = []

    
    func initDb(uid:String){
        self.uid = uid
        
        ref = Database.database().reference().child(self.uid)
        
        db.getDocuments{ (querysnap,error) in
            if error != nil{
                print(error!)
            }else{
                for document in querysnap!.documents{
                    let data = document.data()
                    let newPerson = Person(
                        name: data["name"] as! String,
                        profilePic: data["profilePic"] as! String,
                        id:document.documentID
                    )
                    self.users.append(newPerson)
                }
            }
        }
    }
    
    
    func read(){
        if let db = ref {
            //Leer datos dentro de el id de un usuario
            db.observe(.childAdded){snapshot in
                print(snapshot.value)
            }
            
            
            // Guardar mensaje, definiendo el mensaje en las colecciones de ambas personas
            //db.child("tzuzulcode").child(UUID().uuidString).setValue(["message":"Hola","datetime":1223])
            //db.child("tzuzulcode").child(UUID().uuidString).setValue(["message":"Hola","datetime":1223])
        }
    }
}
