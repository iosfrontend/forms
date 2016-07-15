//
//  MasterViewController.swift
//  MigraPoC
//
//  Created by Hannes Töllborg on 14/07/16.
//  Copyright © 2016 Hannes Töllborg. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    //var objects = [AnyObject]()
    
    var bokningsArray: [Bokning] = []
    var bokning1: Bokning?
    var bokning2: Bokning?
    
    let dosA1: Doss = Doss(dossNr: "50002222", dossNamn: "Hannes Töllborg")
    let dosA2: Doss = Doss(dossNr: "50001111", dossNamn: "Mohamad Sadiq")
    let dosA3: Doss = Doss(dossNr: "50003333", dossNamn: "Ha Nguyen")
    let dosA4: Doss = Doss(dossNr: "50004444", dossNamn: "Anders Mickelsson")
    
    let dosB1: Doss = Doss(dossNr: "50002222", dossNamn: "Erik Odell")
    let dosB2: Doss = Doss(dossNr: "50001111", dossNamn: "Tommy Nilsson")
    let dosB3: Doss = Doss(dossNr: "50003333", dossNamn: "Kjell-Inge Gustavsson")
    let dosB4: Doss = Doss(dossNr: "50004444", dossNamn: "Rickard Fält")
    //let dos5: Doss = Doss(dossNr: "5000555", dossNamn: "Kjell-Inge Gustavsson")
    
    let reseInfo: ReseInfo = ReseInfo(avresa: "2016-07-13:15.40", ankomst: "2016-07-13:19.01", reseNotering: "Mycket Packning")
    
    let reseInfo2: ReseInfo = ReseInfo(avresa: "2016-07-13:15.40", ankomst: "2016-07-13:19.01", reseNotering: "Ska direkt till sjukhuset")
    



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.bokning1 = Bokning(bokningsNummer: "AAAAA", bokningsAdress: "Storgatan 66, Lgh: 2200", dossar: [dosA1, dosA2, dosA3, dosA4], reseInfo: reseInfo)
        
        self.bokning2 = Bokning(bokningsNummer: "BBBBB", bokningsAdress: "Lillgatan 55, Lgh:1100", dossar: [dosB4, dosB3, dosB2, dosB1], reseInfo: reseInfo2)
        self.bokningsArray = [bokning1!, bokning2!]
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
//
//        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(insertNewObject(_:)))
//        self.navigationItem.rightBarButtonItem = addButton
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func insertNewObject(sender: AnyObject) {
//        objects.insert(Bokning(), atIndex: 0)
//        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
//        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                //let object = objects[indexPath.row] as! NSDate
                let object = bokningsArray[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bokningsArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = bokningsArray[indexPath.row]
        cell.textLabel!.text = object.bokningsNummer
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            bokningsArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

