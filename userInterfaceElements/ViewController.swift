//
//  ViewController.swift
//  userInterfaceElements
//
//  Created by Maxim Kucherov on 15.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var segmentedControl: UISegmentedControl!
    @IBOutlet private var showLabel: UILabel!
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var textField: UITextField!
    @IBOutlet private var button: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    
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
        
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .green
        slider.thumbTintColor = .blue
        
        showLabel.text = String(slider.value)
        
        textField.placeholder = "Enter your name"
        
        button.layer.cornerRadius = 20
    
    }
    
    @IBAction private func SegmentedControlButtonPressed() {
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
    
    @IBAction private func sliderAction() {
        showLabel.text = String(slider.value)
        
        let sliderValue = CGFloat(slider.value)
        
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(sliderValue)
    }
    
    @IBAction private func buttonAction() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(with: "Text field is empty", and: "Please, enter your name")
            return
        }
        
        if let _ = Double(inputText) {
            showAlert(with: "Wrong format", and: "Please, enter your name")
            return
        }
        
        showLabel.text = inputText
    }
    
    @IBAction func datePickerAction() {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru-RU")
        
        showLabel.text = dateFormatter.string(from: datePicker.date)
    }
}

extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
}


