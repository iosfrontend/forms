//
//  Bokning.swift
//  MigraPoC
//
//  Created by Hannes Töllborg on 14/07/16.
//  Copyright © 2016 Hannes Töllborg. All rights reserved.
//

import Foundation

class Bokning {
    let bokningsNummer: String
    let bokningsAdress: String
    let dossar: [Doss]
    let reseInfo: ReseInfo
    
    init(bokningsNummer: String, bokningsAdress: String, dossar: [Doss], reseInfo: ReseInfo){
        self.bokningsNummer = bokningsNummer
        self.bokningsAdress = bokningsAdress
        self.dossar = dossar
        self.reseInfo = reseInfo
        
    }
    
    
}