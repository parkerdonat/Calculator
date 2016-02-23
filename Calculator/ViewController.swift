//
//  ViewController.swift
//  Calculator
//
//  Created by Taylor Mott on 10/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blackColor()
        
        displayLabel.textAlignment = .Right
        displayLabel.font = .systemFontOfSize(50.0)
        displayLabel.text = "0"
        displayLabel.textColor = UIColor.whiteColor()
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(displayLabel)
        
        // Width leading
        var constraint = NSLayoutConstraint(item: displayLabel, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        // Width trailing
        constraint = NSLayoutConstraint(item: displayLabel, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)

        // Vertical
        constraint = NSLayoutConstraint(item: displayLabel, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 100)
        view.addConstraint(constraint)
        
        // Height
        constraint = NSLayoutConstraint(item: displayLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100)
        view.addConstraint(constraint)
    
        
        var numbersButtonArray = [UIButton]()
        
        for index in 0...9 {
            let button = UIButton()
            button.layer.borderWidth = 0.5
            button.layer.borderColor = UIColor.blackColor().CGColor
            button.backgroundColor = .lightGrayColor()
            button.setTitle("\(index)", forState: .Normal)
            button.setTitleColor(.blackColor(), forState: .Normal)
            button.titleLabel?.font = .systemFontOfSize(25.0)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
            view.addSubview(button)
            numbersButtonArray.append(button)
        }
        
        let buttonDivide = UIButton()
        buttonDivide.layer.borderWidth = 0.5
        buttonDivide.layer.borderColor = UIColor.blackColor().CGColor
        buttonDivide.backgroundColor = .orangeColor()
        buttonDivide.setTitle("÷", forState: .Normal)
        buttonDivide.setTitleColor(.blackColor(), forState: .Normal)
        buttonDivide.titleLabel?.font = .systemFontOfSize(25.0)
        buttonDivide.translatesAutoresizingMaskIntoConstraints = false
        buttonDivide.addTarget(self, action: "operate:", forControlEvents: .TouchUpInside)
        view.addSubview(buttonDivide)
        
        let buttonMultiply = UIButton()
        buttonMultiply.layer.borderWidth = 0.5
        buttonMultiply.layer.borderColor = UIColor.blackColor().CGColor
        buttonMultiply.backgroundColor = .orangeColor()
        buttonMultiply.setTitle("✕", forState: .Normal)
        buttonMultiply.setTitleColor(.blackColor(), forState: .Normal)
        buttonMultiply.titleLabel?.font = .systemFontOfSize(25.0)
        buttonMultiply.translatesAutoresizingMaskIntoConstraints = false
        buttonMultiply.addTarget(self, action: "operate", forControlEvents: .TouchUpInside)
        view.addSubview(buttonMultiply)
        
        let buttonSubtract = UIButton()
        buttonSubtract.layer.borderWidth = 0.5
        buttonSubtract.layer.borderColor = UIColor.blackColor().CGColor
        buttonSubtract.backgroundColor = .orangeColor()
        buttonSubtract.setTitle("-", forState: .Normal)
        buttonSubtract.setTitleColor(.blackColor(), forState: .Normal)
        buttonSubtract.titleLabel?.font = .systemFontOfSize(25.0)
        buttonSubtract.translatesAutoresizingMaskIntoConstraints = false
        buttonSubtract.addTarget(self, action: "operate:", forControlEvents: .TouchUpInside)
        view.addSubview(buttonSubtract)
        
        let buttonAddition = UIButton()
        buttonAddition.layer.borderWidth = 0.5
        buttonAddition.layer.borderColor = UIColor.blackColor().CGColor
        buttonAddition.backgroundColor = .orangeColor()
        buttonAddition.setTitle("+", forState: .Normal)
        buttonAddition.setTitleColor(.blackColor(), forState: .Normal)
        buttonAddition.titleLabel?.font = .systemFontOfSize(25.0)
        buttonAddition.translatesAutoresizingMaskIntoConstraints = false
        buttonAddition.addTarget(self, action: "operate:", forControlEvents: .TouchUpInside)
        view.addSubview(buttonAddition)
        
        let buttonEquals = UIButton()
        buttonEquals.layer.borderWidth = 0.5
        buttonEquals.layer.borderColor = UIColor.blackColor().CGColor
        buttonEquals.backgroundColor = UIColor(red: 99/255.0, green: 139/255.0, blue: 102/255.0, alpha: 1.0)
        buttonEquals.setTitle("⏎", forState: .Normal)
        buttonEquals.setTitleColor(.blackColor(), forState: .Normal)
        buttonEquals.titleLabel?.font = .systemFontOfSize(25.0)
        buttonEquals.translatesAutoresizingMaskIntoConstraints = false
        buttonEquals.addTarget(self, action: "enter", forControlEvents: .TouchUpInside)
        view.addSubview(buttonEquals)
       
        // TOP ROW
        constraint = NSLayoutConstraint(item: numbersButtonArray[7], attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[7], attribute: .Top, relatedBy: .Equal, toItem: displayLabel, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[8], attribute: .Leading, relatedBy: .Equal, toItem: numbersButtonArray[7], attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[8], attribute: .Top, relatedBy: .Equal, toItem: numbersButtonArray[7], attribute: .Top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[9], attribute: .Leading, relatedBy: .Equal, toItem: numbersButtonArray[8], attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[9], attribute: .Top, relatedBy: .Equal, toItem: numbersButtonArray[7], attribute: .Top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttonDivide, attribute: .Leading, relatedBy: .Equal, toItem: numbersButtonArray[9], attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttonDivide, attribute: .Top, relatedBy: .Equal, toItem: numbersButtonArray[7], attribute: .Top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttonDivide, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        // SECOND ROW
        constraint = NSLayoutConstraint(item: numbersButtonArray[4], attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[4], attribute: .Top, relatedBy: .Equal, toItem: numbersButtonArray[7], attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[5], attribute: .Leading, relatedBy: .Equal, toItem: numbersButtonArray[4], attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[5], attribute: .Top, relatedBy: .Equal, toItem: numbersButtonArray[4], attribute: .Top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[6], attribute: .Leading, relatedBy: .Equal, toItem: numbersButtonArray[5], attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[6], attribute: .Top, relatedBy: .Equal , toItem: numbersButtonArray[4], attribute: .Top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttonMultiply, attribute: .Leading, relatedBy: .Equal, toItem: numbersButtonArray[6], attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttonMultiply, attribute: .Top, relatedBy: .Equal, toItem: numbersButtonArray[4], attribute: .Top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttonMultiply, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        
        // THIRD ROW
        constraint = NSLayoutConstraint(item: numbersButtonArray[1], attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[1], attribute: .Top, relatedBy: .Equal, toItem: numbersButtonArray[4], attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[2], attribute: .Leading, relatedBy: .Equal, toItem: numbersButtonArray[1], attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[2], attribute: .Top, relatedBy: .Equal, toItem: numbersButtonArray[1], attribute: .Top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[3], attribute: .Leading, relatedBy: .Equal, toItem: numbersButtonArray[2], attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[3], attribute: .Top, relatedBy: .Equal , toItem: numbersButtonArray[1], attribute: .Top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttonSubtract, attribute: .Leading, relatedBy: .Equal, toItem: numbersButtonArray[3], attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttonSubtract, attribute: .Top, relatedBy: .Equal, toItem: numbersButtonArray[1], attribute: .Top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttonSubtract, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        //Bottom row
        constraint = NSLayoutConstraint(item: numbersButtonArray[0], attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[0], attribute: .Top, relatedBy: .Equal, toItem: numbersButtonArray[1], attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: numbersButtonArray[0], attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        
        constraint = NSLayoutConstraint(item: buttonEquals, attribute: .Leading, relatedBy: .Equal, toItem: numbersButtonArray[0], attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttonEquals, attribute: .Top, relatedBy: .Equal, toItem: numbersButtonArray[0], attribute: .Top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttonEquals, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        
        constraint = NSLayoutConstraint(item: buttonAddition, attribute: .Leading, relatedBy: .Equal, toItem: buttonEquals, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttonAddition, attribute: .Top, relatedBy: .Equal, toItem: numbersButtonArray[0], attribute: .Top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttonAddition, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttonAddition, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        let buttonsHeightArray = [numbersButtonArray[0], numbersButtonArray[1], numbersButtonArray[2], numbersButtonArray[3], numbersButtonArray[4], numbersButtonArray[5], numbersButtonArray[6], numbersButtonArray[8], numbersButtonArray[9], buttonAddition, buttonDivide, buttonEquals, buttonMultiply, buttonSubtract]
        
        for button in buttonsHeightArray {
            let heightConstraint = NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: numbersButtonArray[7], attribute: .Height, multiplier: 1.0, constant: 0.0)
            view.addConstraint(heightConstraint)
        }
        
        let buttonWidthArray = [numbersButtonArray[1], numbersButtonArray[2], numbersButtonArray[3], numbersButtonArray[4], numbersButtonArray[5], numbersButtonArray[6], numbersButtonArray[8], numbersButtonArray[9], buttonAddition, buttonDivide, buttonMultiply, buttonSubtract, buttonEquals]
        
        for button in buttonWidthArray {
            let widthConstraint = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: numbersButtonArray[7], attribute: .Width, multiplier: 1.0, constant: 0.0)
            view.addConstraint(widthConstraint)
        }
    }
    
}