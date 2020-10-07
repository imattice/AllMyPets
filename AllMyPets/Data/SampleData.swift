//
//  SampleData.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import Foundation


let sampleUsers: [User] = [
    User(id: UUID(uuidString: "ae74a037-a922-42b3-92c5-9f4834d30bf4")!,
         name: "blueberryRush",
         pets: [
            Pet(name: "Stinky",
                type: .dog,
                walks: [
                    Walk(startLocation: "Home",
                         destinationLocation: "Dog Park",
                         time: "30 minutes"),
                    Walk(startLocation: "Home",
                         destinationLocation: "Grocery Store",
                         time: "10 minutes"),
                    Walk(startLocation: "Tom's House",
                         destinationLocation: "Home",
                         time: "45 minutes")
        ]),
            Pet(name: "Bee",
                type: .cat,
                walks: [Walk]())
     ]),
    
    User(id: UUID(uuidString: "758ec6a8-cc97-4d2d-b090-50ce820db07a")!,
         name: "hurricaneDesert",
         pets: [
            Pet(name: "Rex",
                type: .reptile,
                walks: [
                    Walk(startLocation: "Backyard",
                         destinationLocation: "Pond",
                         time: "10 minutes"),
                    Walk(startLocation: "Backyard",
                         destinationLocation: "Playground",
                         time: "5 minutes"),
        ]),
     ]),
    
    User(id: UUID(uuidString: "2835a94d-eb2b-451e-afd6-5965d3eb666c")!,
         name: "theIcedCoffeeOwl",
         pets: [
            Pet(name: "Monkey",
                type: .dog,
                walks: [
                    Walk(startLocation: "Home",
                         destinationLocation: "Elanor's House",
                         time: "45 minutes"),
                    Walk(startLocation: "Home",
                         destinationLocation: "Dog Park",
                         time: "70 minutes"),
                    Walk(startLocation: "Home",
                         destinationLocation: "Work",
                         time: "20 minutes"),
                    Walk(startLocation: "Home",
                         destinationLocation: "Dog Park",
                         time: "70 minutes"),
                    Walk(startLocation: "Home",
                         destinationLocation: "Dog Park",
                         time: "70 minutes"),
        ]),
            Pet(name: "Cheeto",
                type: .dog,
                walks: [
                    Walk(startLocation: "Home",
                         destinationLocation: "Elanor's House",
                         time: "45 minutes"),
                    Walk(startLocation: "Home",
                         destinationLocation: "Dog Park",
                         time: "70 minutes"),
                    Walk(startLocation: "Home",
                         destinationLocation: "Work",
                         time: "20 minutes"),
                    Walk(startLocation: "Home",
                         destinationLocation: "Dog Park",
                         time: "70 minutes"),
                    Walk(startLocation: "Home",
                         destinationLocation: "Dog Park",
                         time: "70 minutes"),
        ]),
     ]),
    User(id: UUID(uuidString: "58d75b1a-77b7-4f98-8e29-ad050bfe8e47")!,
         name: "cityOfPigeons",
         pets: [
            Pet(name: "Pepper",
                type: .bird,
                walks: [
                    Walk(startLocation: "Home",
                         destinationLocation: "Arboretum",
                         time: "10 minutes"),
                    Walk(startLocation: "Home",
                         destinationLocation: "Grocery Store",
                         time: "5 minutes"),
        ]),
     ]),
    User(id: UUID(uuidString: "e6f9ebeb-e492-4e43-a18b-a5cdcc92d87c")!,
         name: "neptuneStandByMe",
         pets: [
            Pet(name: "Kraken",
                type: .fish,
                walks: [
                    Walk(startLocation: "Pond",
                         destinationLocation: "Home",
                         time: "20 minutes"),
        ]),
            Pet(name: "Leviathan",
                type: .fish,
                walks: [
                    Walk(startLocation: "Beach",
                         destinationLocation: "Home",
                         time: "40 minutes"),
                ]),
            Pet(name: "Jaws",
                type: .fish,
                walks: [
                    Walk(startLocation: "Grocery Store",
                         destinationLocation: "Home",
                         time: "10 minutes"),
                ])
            ])
]
