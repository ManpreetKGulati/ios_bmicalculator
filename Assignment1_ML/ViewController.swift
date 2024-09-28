//
//  ViewController.swift
//  Assignment1_ML
//
//  Created by Manpreet Gulati on 27/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    
    @IBOutlet weak var unitControl: UISegmentedControl!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var heightTextField2: UITextField!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var yourBMILabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func maleAction(_ sender: UIButton) {
        maleButton.backgroundColor = UIColor.systemCyan
        femaleButton.backgroundColor = nil
    }
    @IBAction func femaleAction(_ sender: UIButton) {
        femaleButton.backgroundColor = UIColor.systemCyan
        maleButton.backgroundColor = nil
    }
    @IBAction func switchAction(_ sender: Any) {
        if unitControl.selectedSegmentIndex == 0 {
            heightTextField2.isHidden = true;
            heightTextField.placeholder = "centimeters"
            weightTextField.placeholder = "kilograms"
        } else if unitControl.selectedSegmentIndex == 1 {
            heightTextField2.isHidden = false;
            heightTextField.placeholder = "feets"
            heightTextField2.placeholder = "inches"
            weightTextField.placeholder = "pounds"
            
        }
    }
    
    @IBAction func height1Input(_ sender: Any) {
    }
    @IBAction func height2Input(_ sender: Any) {
    }
    
    @IBAction func weightInput(_ sender: Any) {
    }
    @IBAction func calculateAction(_ sender: Any) {
        
        var height: Double?
             var weight: Double?
             var calcbmi: Double? = 0.0
             if unitControl.selectedSegmentIndex==0{
                 if let height1 = heightTextField.text, let weight1 = weightTextField.text {
                     if !height1.isEmpty && !height1.isEmpty {
                         if height1.isEmpty {
                         showAlert(message: "Height field cannot be empty.")
                         return
                         }
                         if weight1.isEmpty {
                         showAlert(message: "Weight field cannot be empty.")
                         return
                         }
                         
                         height = Double(height1)! / 100
                         if height! < 0 {
                             showAlert(message: "Height cannot be negative.")
                             return
                         }
                         
                         weight = Double(weight1)
                         if weight! <= 0 {
                             showAlert(message: "Weight must be a positive value.")
                             return
                         }
                         
                       
                         calcbmi = weight! / (height! * height!)
                         resultLabel.isHidden = false
                         resultLabel.text = String(format: "%.2f", calcbmi!)
                         print(height!, weight!, calcbmi!)
                     }
                 }
             }
             else {
                 if let height1 = heightTextField.text, let height2 = heightTextField2.text, let weight1 = weightTextField.text {
                     
                     if !height1.isEmpty && !height2.isEmpty && !weight1.isEmpty {
                         
                         if height1.isEmpty {
                         showAlert(message: "Height field cannot be empty.")
                         return
                         }
                         if height2.isEmpty {
                         showAlert(message: "Inches field cannot be empty.")
                         return
                         }
                         if weight1.isEmpty {
                         showAlert(message: "Weight field cannot be empty.")
                         return
                         }

                         if let inches = Int(height2), inches < 0 || inches >= 12 {
                         showAlert(message: "Inches must be between 0 and 11.")
                         return
                                     }

                         height = (Double(height1)! * 12) + Double(height2)!
                         if height! < 0 {
                         showAlert(message: "Height cannot be negative.")
                         return
                         }

                         weight = Double(weight1)
                         if weight! <= 0 {
                         showAlert(message: "Weight must be a positive value.")
                         return
                         }

                       
                         calcbmi = (weight! * 703) / (height! * height!)
                         resultLabel.isHidden = false
                         resultLabel.text = String(format: "%.2f", calcbmi!)
                         print(height!, weight!, calcbmi!)
                     }
                     
                 }
             }
             categoryLabel.isHidden = false
             if calcbmi! > 0.0 && calcbmi! < 100.0 {
                 switch calcbmi! {
                 case ..<18.5:
                     categoryLabel.text = "UNDERWEIGHT"
                     categoryLabel.textColor = UIColor.red
                     
                 case 18.5..<24.9:
                     categoryLabel.text = "NORMAL"
                     categoryLabel.textColor = UIColor.green
                     
                 case 25.0..<29.9:
                     categoryLabel.text = "OVERWEIGHT"
                     categoryLabel.textColor = UIColor.yellow
                     
                 case 30.0...:
                     categoryLabel.text = "OBESE"
                     categoryLabel.textColor = UIColor.red
                     
                 default:
                     categoryLabel.text = "Invalid BMI values."
                     categoryLabel.textColor = UIColor.orange
                     resultLabel.isHidden = true

                 }
             } else {
                 
                 categoryLabel.text = "Invalid BMI values."
                 categoryLabel.textColor = UIColor.orange
                 resultLabel.isHidden = true

             }
         }
         func showAlert(message: String) {
             let alert = UIAlertController(title: "Input Error", message: message, preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .default))
             present(alert, animated: true)
         }
     }
    


