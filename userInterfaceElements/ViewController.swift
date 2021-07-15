//
//  ViewController.swift
//  userInterfaceElements
//
//  Created by Maxim Kucherov on 15.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var showLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLabel.text = ""
        showLabel.font = showLabel.font.withSize(35)
        showLabel.textAlignment = .center
        showLabel.numberOfLines = 3
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        segmentedControl.backgroundColor = .clear
        segmentedControl.setTitle("Fifth", forSegmentAt: 0)
        segmentedControl.selectedSegmentTintColor = .white
    }
    
    @IBAction func SegmentedControlButtonPressed() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            showLabel.text = "The first segment is selected"
            showLabel.textColor = .red
        case 1:
            showLabel.text = "The second segment is selected"
            showLabel.textColor = .blue
        case 2:
            showLabel.text = "The third segment is selected"
            showLabel.textColor = .cyan
        default:
            break
        }
    }
    
}

