//
//  ReseInfo.swift
//  MigraPoC
//
//  Created by Hannes Töllborg on 14/07/16.
//  Copyright © 2016 Hannes Töllborg. All rights reserved.
//

import Foundation

class ReseInfo {
    
    let ankomst: String
    let avresa: String
    let reseNotering: String
    
    init(avresa: String, ankomst: String, reseNotering: String){
        
        self.avresa = avresa
        self.ankomst = ankomst
        self.reseNotering = reseNotering
        
    }
    
}