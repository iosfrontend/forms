//
//  File.swift
//  MigraPoC
//
//  Created by Hannes Töllborg on 15/07/16.
//  Copyright © 2016 Hannes Töllborg. All rights reserved.
//

import Foundation
import UIKit

class CollapsibleTableViewHeader: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var toggleButton: UIButton!
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
}