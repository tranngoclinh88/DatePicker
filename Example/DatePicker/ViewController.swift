//
//  ViewController.swift
//  DatePicker
//
//  Created by amirshayegh on 08/08/2018.
//  Copyright (c) 2018 amirshayegh. All rights reserved.
//

import UIKit
import DatePicker

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.alpha =  0

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    @IBAction func popover(_ sender: UIButton) {
        self.label.alpha = 1
        let fd = DatePicker()
        let start = FDHelper.shared.dateFrom(day: 18, month: 07, year: 2018)
        let end = FDHelper.shared.dateFrom(day: 10, month: 12, year: 2018)
        fd.setup(min: start!, max: end!, dateChanged: { (date) in
            print("\(date)")
            self.label.text = "\(date)"
        }) { (selected, date)  in
            if selected, let d = date {
                self.label.text = "Selected \(d)"
            } else {
                self.label.text = "cancelled"
            }
        }

        fd.displayPopOver(on: sender, in: self, completion: {
            
        })
    }

    @IBAction func present(_ sender: UIButton) {
        self.label.alpha = 1
        let fd = DatePicker()
        fd.setup(dateChanged: { (date) in
            print("\(date)")
            self.label.text = "\(date)"
        }) { (selected, date) in
            if selected, let d = date {
                self.label.text = "Selected \(d)"
            } else {
                self.label.text = "cancelled"
            }
        }

        fd.display(in: self)
    }


}

