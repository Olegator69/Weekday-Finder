//
//  ViewController.swift
//  HelloWorld
//
//  Created by Oleg Kanatov on 1.09.21.
//

import UIKit

class ViewController: UIViewController {
    
    private var headLabel = UILabel()
    private var dateLabel = UILabel()
    private var monthLabel = UILabel()
    private var yearLabel = UILabel()
    private var resultLabel = UILabel()
    
    private var button = UIButton()
    
    private var dateTextField = UITextField()
    private var monthTextField = UITextField()
    private var yearTextField = UITextField()
    
    private var stackLabel = UIStackView()
    private var stackTextField = UIStackView()
    private var generalStack = UIStackView()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetup()
        headLabelSetup()
        dateLabelSetup()
        monthLabelSetup()
        yearLabelSetup()
        dateTextFieldSetup()
        monthTextFieldSetup()
        yearTextFieldSetup()
        stackLabelSetup()
        stackTextFieldSetup()
        generalStackSetup()
        resultLabelSetup()
        buttonSetup()
        
    }
    
    func viewSetup() {
        view.backgroundColor = .orange
    }
    
    //-------------------------------------------------
    // MARK: - Label
    //-------------------------------------------------
    
    func headLabelSetup() {
        headLabel.text = "Weekday Finder"
        headLabel.font = UIFont(name: "Noteworthy", size: 32)
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headLabel)
        
        NSLayoutConstraint.activate([
            headLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            headLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func dateLabelSetup() {
        dateLabel.text = "Date"
        dateLabel.font = UIFont(name: "System", size: 17)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func monthLabelSetup() {
        monthLabel.text = "Month"
        monthLabel.font = UIFont(name: "System", size: 17)
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func yearLabelSetup() {
        yearLabel.text = "Year"
        yearLabel.font = UIFont(name: "System", size: 17)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func resultLabelSetup() {
        resultLabel.text = "Here you will see the day of the week"
        resultLabel.numberOfLines = 0
        resultLabel.textAlignment = .center
        resultLabel.textColor = .white
        resultLabel.font = UIFont(name: "System", size: 17)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: generalStack.bottomAnchor, constant: 50),
            resultLabel.widthAnchor.constraint(equalToConstant: 150),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    //-------------------------------------------------
    // MARK: - Button
    //-------------------------------------------------
    
    func buttonSetup() {
        button.setTitle("Find day", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(findWeekDay), for: .touchUpInside)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func findWeekDay(sender: UIButton!) {
        
        let calendar = Calendar.current
        
        var dateComponents = DateComponents()
        guard let dataText = dateTextField.text, let montheText = monthTextField.text, let yearText = yearTextField.text else { return }
        dateComponents.day = Int(dataText)
        dateComponents.month = Int(montheText)
        dateComponents.year = Int(yearText)
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ru_Ru")
        dateFormater.dateFormat = "EEEE"
        
        let weekDay = dateFormater.string(from: date)
        let capitalizeWeekday = weekDay.capitalized
        
        resultLabel.text = capitalizeWeekday
    }
    
    //-------------------------------------------------
    // MARK: - TextField
    //-------------------------------------------------
    
    func dateTextFieldSetup() {
        dateTextField.backgroundColor = .white
        dateTextField.layer.cornerRadius = 5
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.keyboardType = .numberPad
    }
    
    func monthTextFieldSetup() {
        monthTextField.backgroundColor = .white
        monthTextField.layer.cornerRadius = 5
        monthTextField.translatesAutoresizingMaskIntoConstraints = false
        monthTextField.keyboardType = .numberPad
    }
    
    func yearTextFieldSetup() {
        yearTextField.backgroundColor = .white
        yearTextField.layer.cornerRadius = 5
        yearTextField.translatesAutoresizingMaskIntoConstraints = false
        yearTextField.keyboardType = .numberPad
    }
    
    //-------------------------------------------------
    // MARK: - StackView
    //-------------------------------------------------
    
    func stackLabelSetup() {
        
        stackLabel.axis = .vertical
        stackLabel.distribution = .fillEqually
        stackLabel.alignment = .leading
        stackLabel.spacing = 20
        stackLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackLabel)
        stackLabel.addArrangedSubview(dateLabel)
        stackLabel.addArrangedSubview(monthLabel)
        stackLabel.addArrangedSubview(yearLabel)
        
        NSLayoutConstraint.activate([
            stackLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func stackTextFieldSetup() {
        stackTextField.axis = .vertical
        stackTextField.distribution = .fillEqually
        stackTextField.spacing = 10
        
        stackTextField.translatesAutoresizingMaskIntoConstraints = false
        
        stackTextField.addArrangedSubview(dateTextField)
        stackTextField.addArrangedSubview(monthTextField)
        stackTextField.addArrangedSubview(yearTextField)
        
    }
    
    func generalStackSetup() {
        generalStack.axis = .horizontal
        generalStack.distribution = .fill
        generalStack.spacing = 15
        
        generalStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(generalStack)
        generalStack.addArrangedSubview(stackLabel)
        generalStack.addArrangedSubview(stackTextField)
        
        NSLayoutConstraint.activate([
            generalStack.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 75),
            generalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            generalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
        ])
    }
    
}

