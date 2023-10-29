//
//  ViewController.swift
//  calculator
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    @IBAction func decimal(_ sender: UIButton) {
        if performingMath || label.text!.isEmpty
        {
            label.text = "0."
            performingMath = false
        }
        else
        {
            if !label.text!.contains(".") {
                label.text = label.text! + "."
            }
        }
        numberOnScreen = Double(label.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 //Divide
            {
                label.text = "/";
            }
            else if sender.tag == 13 //Multiply
            {
                label.text = "x";
            }
            else if sender.tag == 14 //Minus
            {
                label.text = "-";
            }
            else if sender.tag == 15 //Plus
            {
                label.text = "+";
            }
            else if sender.tag == 23 //pow
            {
                label.text = "^";
            }
            else if sender.tag == 27 //sqrt
            {
                label.text = "√";
            }
            
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
            }
            else if operation == 23
            {
               label.text = String(pow(previousNumber, numberOnScreen) )
            }
            else if operation == 27
            {
                label.text = String(pow(previousNumber, (1/numberOnScreen)) )
            }
           
        }
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
       /* else if sender.tag == 24 // percents
        {
            if operation == 12
            {
                label.text = String(previousNumber / (previousNumber * (numberOnScreen / 100)))
            }
            else if operation == 13
            {
                label.text = String(previousNumber * (previousNumber * (numberOnScreen / 100)))
            }
            else if operation == 14
            {
                label.text = String(previousNumber - (previousNumber * (numberOnScreen / 100)))
            }
            else if operation == 15
            {
                label.text = String(previousNumber + (previousNumber * (numberOnScreen / 100)))
            }
            
        }*/
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

