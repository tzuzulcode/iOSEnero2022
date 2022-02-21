//
//  Car.swift
//  OutlineDisclosureGroups
//
//  Created by Tzuzul Rosas on 21/02/22.
//

import Foundation

struct CarElement: Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var children:[CarElement]?
}


let carElements:[CarElement] = [
    CarElement(name: "Hybrid", image: "leaf", children: [
        CarElement(name: "Toyota", image: "car", children: [
            CarElement(name: "Prius", image: "car")
        ])
    ]),
    CarElement(name: "Electric", image: "leaf", children: [
        CarElement(name: "Tesla", image: "car", children: [
            CarElement(name: "Model S", image: "car")
        ])
    ])
]
