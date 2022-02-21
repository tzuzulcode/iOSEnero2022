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



func writeJSON(cars:[Car]){
    
    print("Writing...")
    
    let data:Data
    
    //Encoder
    
    do{
        let encoder = JSONEncoder()
        data = try encoder.encode(cars)
        print(data)
    }catch{
        fatalError("No se puede codificar")
    }
    
    do{
        //let path = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask,appropriateFor: nil,create: false)
        
        //let filename = path.appendingPathComponent("CarsData.json")
        
        guard let filename = Bundle.main.url(forResource: "CarsData.json", withExtension: nil)
        else{
            fatalError("No se puede abrir el archivo")
        }
                
        
        print(filename)
        
        guard let outputStream = OutputStream(url: filename, append: false) else {
            print("No se puede abrir el archivo")
            return
        }
        
        print("Writing in Output Stream")
        
        outputStream.open()
        if let jsonString = String(data:data,encoding: String.Encoding.utf8){
            print(jsonString)
            outputStream.write(jsonString,maxLength: 1000)
            
            
        }
        
        outputStream.close()
        
    }catch let error{
        print(error)
        fatalError("No se puede abrir el archivo")
    }
    
    
}

var cars:[Car] = loadJSON()
