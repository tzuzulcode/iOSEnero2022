//
//  ModelData.swift
//  ListsAndNavigation
//
//  Created by Tzuzul Rosas on 16/02/22.
//

import Foundation


func loadJSON<T:Decodable>()->T{
    let data:Data
    
    guard let file = Bundle.main.url(forResource: "CarsData.json", withExtension: nil)
    else{
        fatalError("No se puede abrir el archivo")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("No se puede cargar el archivo")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("No se puede decodificar")
    }
    
}

func writeJSON(){
    
    
    
    
    let data:Data
    
    //Encoder
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("No se puede decodificar")
    }
    
    //Data
    
    do{
        data = try Data(encodeContent)
    }catch{
        fatalError("No se puede cargar el archivo")
    }
    
    
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    var filename = path.appendingPathComponent("CarsData.json")
    
    
    do{
        
        if var jsonString = String(data:data,encoding: String.Encoding.utf8){
            try jsonString.write(to: filename)
        }
        
        
    }catch let error{
        print(error.localizedDescription)
    }
    
    
    
   
    
    
}

var cars:[Car] = loadJSON()
