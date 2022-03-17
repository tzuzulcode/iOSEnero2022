//
//  Car.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 15/03/22.
//

import Foundation

class Car:Decodable{
    let model:String
    let price:Int
    let transmission:String
    let classType:String
    let year:Int
    
    //Images
    var car:String = ""
    var logo:String = ""
    var logoBack:String = ""
    
    var gallery:[String] = []
    
    enum CodingKeys:String,CodingKey{
        case data
    }
    
    enum DataKeys:String,CodingKey{
        case attributes
    }
    enum AttributesKeys:String,CodingKey{
        case model,price,transmission,classType,year,car,logo,logo_back,gallery
        
    }
    enum ImageAttributes:String,CodingKey{
        case url
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DataKeys.self)
        let attributes = try container.nestedContainer(keyedBy: AttributesKeys.self, forKey: .attributes)
        model = try attributes.decode(String.self, forKey: .model)
        price = try attributes.decode(Int.self, forKey: .price)
        transmission = try attributes.decode(String.self, forKey: .transmission)
        classType = try attributes.decode(String.self, forKey: .classType)
        year = try attributes.decode(Int.self, forKey: .year)
        
        
        //Obteniendo el url del auto
        car = try getImageUrl(key: .car, attributes: attributes)
        
        //Obteniendo el url del text logo
        logo = try getImageUrl(key: .logo, attributes: attributes)

        //Obteniendo el url del logo
        logoBack = try getImageUrl(key: .logo_back, attributes: attributes)
        
        let galleryContainer = try attributes.nestedContainer(keyedBy: CodingKeys.self, forKey: .gallery)
        
        var galleryImages = try galleryContainer.nestedUnkeyedContainer(forKey: .data)
        
        
        while !galleryImages.isAtEnd{
            let galleryImage = try galleryImages.nestedContainer(keyedBy: DataKeys.self)
            let galleryImageAtributes = try galleryImage.nestedContainer(keyedBy: ImageAttributes.self,forKey: .attributes)
            let galleryImageUrl = try galleryImageAtributes.decode(String.self, forKey: .url)
            gallery.append(galleryImageUrl)
        }
        
    }
    
    func getImageUrl(key:AttributesKeys,attributes:KeyedDecodingContainer<AttributesKeys>) throws -> String {
        let imageContainer = try attributes.nestedContainer(keyedBy: CodingKeys.self, forKey: key)
        let imageData = try imageContainer.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        let imageAttributes = try imageData.nestedContainer(keyedBy: ImageAttributes.self, forKey: .attributes)
        
        return try imageAttributes.decode(String.self, forKey: .url)
    }
}
