//
//  DetailViewController.swift
//  MigraPoC
//
//  Created by Hannes Töllborg on 14/07/16.
//  Copyright © 2016 Hannes Töllborg. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var bokningsNummer: UILabel!
    
    @IBOutlet weak var dossier: UILabel!
    
    @IBOutlet weak var dosTable: UITableView!
    
    
    var detailItem: Bokning? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.reseInfo.reseNotering
            }
            
            if let bokning = self.bokningsNummer {
                bokning.text = detail.bokningsNummer
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        dosTable.delegate = self
        dosTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return  (detailItem?.dossar.count)!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (detailItem?.dossar.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("dossCell", forIndexPath: indexPath)
            cell.textLabel?.text = (detailItem?.dossar[indexPath.row].dossNr)! + ", " + (detailItem?.dossar[indexPath.row].dossNamn)!
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(detailItem?.dossar[indexPath.row].dossNr)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    


}

