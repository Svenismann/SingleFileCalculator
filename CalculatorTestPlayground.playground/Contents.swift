//: A UIKit based Playground for presenting user interface
  
import UIKit
import Foundation
import PlaygroundSupport

class MyViewController : UIViewController {
    
    var positionOne : String = ""
    var positionTwo : String = ""
    var computedValue : String = ""
    var mathOperator : String = "+"
    
    var mathOperatorActive = false

    //var buttonScale: CGFloat = 67
    
    let textView = UITextView() // change to label
    let button0 = UIButton()
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    let button6 = UIButton()
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    let plusButton = UIButton()
    let minusButton = UIButton()
    let equalButton = UIButton()
    let clearButton = UIButton()
    let negativeButton = UIButton()
    let percentageButton = UIButton()
    let divideButton = UIButton()
    let multiplyButton = UIButton()
    let kommaButton = UIButton()
    
    var buttonSpacing : CGFloat = 10.0
    var buttonsInRow : CGFloat = 4.0
    var containerViewWidth : CGFloat = 365
    
    
    var buttonScale : CGFloat {
        get {
            return (containerViewWidth - buttonSpacing*4) / 4
        }
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .black
    
        self.view = view
        
        addUIElements()
        setupUIElements()
        setupButtonTargets()
        

    
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        makeViewCircular(view: button1)
        makeViewCircular(view: button2)
        makeViewCircular(view: button3)
        makeViewCircular(view: button4)
        makeViewCircular(view: button5)
        makeViewCircular(view: button6)
        makeViewCircular(view: button7)
        makeViewCircular(view: button8)
        makeViewCircular(view: button9)
        makeViewCircular(view: clearButton)
        makeViewCircular(view: negativeButton)
        makeViewCircular(view: percentageButton)
        makeViewCircular(view: divideButton)
        makeViewCircular(view: kommaButton)
        makeViewCircular(view: multiplyButton)
        makeViewCircular(view: minusButton)
        makeViewCircular(view: plusButton)
        makeViewCircular(view: equalButton)
        button0.layer.cornerRadius = button0.frame.height/2
    }
    
    func makeString(buttonValue: String) -> String {
        let addValue = buttonValue
        
        if mathOperatorActive == false {
            positionOne += addValue
            textView.text = positionOne
        } else if mathOperatorActive == true {
            positionTwo += addValue
            textView.text = positionTwo
        }
        return addValue
    }
    
    func makeViewCircular(view: UIButton) { // Has to be loaded in "FuncviwDidLayoutSubViews()"
        view.layer.cornerRadius = view.bounds.size.width / 2.0
        view.clipsToBounds = true
    }
    
    func doTheMath() { //NSExpression used to do the math it's amazingly simple
        let mathExpression = NSExpression(format: positionOne + mathOperator + positionTwo)
        let mathvalue = mathExpression.expressionValue(with: nil, context: nil)
        computedValue = "\(mathvalue!)"
        positionOne = computedValue
        positionTwo = ""
        mathOperatorActive = false
    }
    
    // UI Elements
    
    func addUIElements() {
        self.view.addSubview(textView)
        self.view.addSubview(button0)
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
        self.view.addSubview(button4)
        self.view.addSubview(button5)
        self.view.addSubview(button6)
        self.view.addSubview(button7)
        self.view.addSubview(button8)
        self.view.addSubview(button9)
        self.view.addSubview(plusButton)
        self.view.addSubview(minusButton)
        self.view.addSubview(equalButton)
        self.view.addSubview(clearButton)
        self.view.addSubview(negativeButton)
        self.view.addSubview(percentageButton)
        self.view.addSubview(divideButton)
        self.view.addSubview(multiplyButton)
        self.view.addSubview(kommaButton)
    }
    
    func setupUIElements() {
        setupTextView()
        setup0Button()
        setup1Button()
        setup2Button()
        setup3Button()
        setup4Button()
        setup5Button()
        setup6Button()
        setup7Button()
        setup8Button()
        setup9Button()
        setupClearButton()
        setupNegativeButton()
        setupPercentageButton()
        setupDivideButton()
        setupKommaButton()
        setupMultiplyButton()
        setupMinusButton()
        setupPlusButton()
        setupEqualButton()
    }
    
    func setupButtonTargets() {
        button0.addTarget(self, action: #selector(button0Tapped), for: .touchUpInside)
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        button3.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
        button4.addTarget(self, action: #selector(button4Tapped), for: .touchUpInside)
        button5.addTarget(self, action: #selector(button5Tapped), for: .touchUpInside)
        button6.addTarget(self, action: #selector(button6Tapped), for: .touchUpInside)
        button7.addTarget(self, action: #selector(button7Tapped), for: .touchUpInside)
        button8.addTarget(self, action: #selector(button8Tapped), for: .touchUpInside)
        button9.addTarget(self, action: #selector(button9Tapped), for: .touchUpInside)
        equalButton.addTarget(self, action: #selector(equalButtonTapped), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
    }
    
    func setupTextView() {
        textView.adjustsFontForContentSizeCategory = true
        textView.isSelectable = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .right
        textView.textColor = UIColor.lightGray
        textView.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        textView.text = "0"
        textView.backgroundColor = UIColor.black
        textView.font = .systemFont(ofSize: 70)
        textViewConstraints()
    }
    
    func setup0Button() {
        button0.backgroundColor = UIColor.darkGray
        button0.setTitle("0", for: .normal)
        button0.contentHorizontalAlignment = .left
        button0.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button0.titleEdgeInsets = UIEdgeInsets(top: 10,left: 33,bottom: 10,right: 10)
        
        
        button0Constraints()
    }
    
    func setup1Button() {
        button1.backgroundColor = UIColor.darkGray
        button1.setTitle("1", for: .normal)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button1.setTitleColor(UIColor.white, for: .normal)
        
        button1Constraints()
    }
    
    func setup2Button() {
        button2.backgroundColor = UIColor.darkGray
        button2.setTitle("2", for: .normal)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button2.setTitleColor(UIColor.white, for: .normal)
        
        button2Constraints()
    }
    
    func setup3Button() {
        button3.backgroundColor = UIColor.darkGray
        button3.setTitle("3", for: .normal)
        button3.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button3.setTitleColor(UIColor.white, for: .normal)
        
        button3Constraints()
    }
    
    func setup4Button() {
        button4.backgroundColor = UIColor.darkGray
        button4.setTitle("4", for: .normal)
        button4.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button4.setTitleColor(UIColor.white, for: .normal)
        
        button4Constraints()
    }
    
    func setup5Button() {
        button5.backgroundColor = UIColor.darkGray
        button5.setTitle("5", for: .normal)
        button5.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button5.setTitleColor(UIColor.white, for: .normal)
        
        button5Constraints()
    }
    
    func setup6Button() {
        button6.backgroundColor = UIColor.darkGray
        button6.setTitle("6", for: .normal)
        button6.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button6.setTitleColor(UIColor.white, for: .normal)
        
        button6Constraints()
    }
    
    func setup7Button() {
        button7.backgroundColor = UIColor.darkGray
        button7.setTitle("7", for: .normal)
        button7.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button7.setTitleColor(UIColor.white, for: .normal)
        
        button7Constraints()
    }
    
    func setup8Button() {
        button8.backgroundColor = UIColor.darkGray
        button8.setTitle("8", for: .normal)
        button8.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button8.setTitleColor(UIColor.white, for: .normal)
        button8Constraints()
    }
    
    func setup9Button() {
        button9.backgroundColor = UIColor.darkGray
        button9.setTitle("9", for: .normal)
        button9.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button9.setTitleColor(UIColor.white, for: .normal)
        
        button9Constraints()
    }
    
    func setupClearButton() {
        clearButton.backgroundColor = UIColor.lightGray
        clearButton.setTitle("C", for: .normal)
        clearButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        clearButton.setTitleColor(UIColor.black, for: .normal)
        
        clearButtonConstraints()
    }
    
    func setupNegativeButton() {
        negativeButton.backgroundColor = UIColor.lightGray
        negativeButton.setTitle("-/+", for: .normal)
        negativeButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        negativeButton.setTitleColor(UIColor.black, for: .normal)
        
        negativeButtonConstraints()
    }
    
    func setupPercentageButton() {
        percentageButton.backgroundColor = UIColor.lightGray
        percentageButton.setTitle("%", for: .normal)
        percentageButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        percentageButton.setTitleColor(UIColor.black, for: .normal)
        
        percentageButtonConstraints()
    }
    
    func setupDivideButton() {
        divideButton.backgroundColor = UIColor.orange
        divideButton.setTitle("/", for: .normal)
        divideButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        divideButton.setTitleColor(UIColor.black, for: .normal)
        
        divideButtonConstraints()
    }
    
    func setupKommaButton() {
        kommaButton.backgroundColor = UIColor.darkGray
        kommaButton.setTitle(",", for: .normal)
        
        kommaButtonConstraints()
    }
    
    func setupMultiplyButton() {
        multiplyButton.backgroundColor = UIColor.orange
        multiplyButton.setTitle("*", for: .normal)
        multiplyButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        multiplyButton.setTitleColor(UIColor.white, for: .normal)
        
        multiplyButtonConstraints()
        
    }
    
    func setupMinusButton() {
        minusButton.backgroundColor = UIColor.orange
        minusButton.setTitle("-", for: .normal)
        minusButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        minusButton.setTitleColor(UIColor.white, for: .normal)
        
        minusButtonConstraints()
    }
    
    func setupPlusButton() {
        plusButton.backgroundColor = UIColor.orange
        plusButton.setTitle("+", for: .normal)
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        plusButton.setTitleColor(UIColor.white, for: .normal)
        
        plusButtonConstraints()
    }
    
    func setupEqualButton() {
        equalButton.backgroundColor = UIColor.orange
        equalButton.setTitle("=", for: .normal)
        equalButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        equalButton.setTitleColor(UIColor.white, for: .normal)
        
        equalButtonConstraints()
    }
        
    
    // Constraints
    
    func textViewConstraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    
    func button0Constraints() {
        button0.translatesAutoresizingMaskIntoConstraints = false
        button0.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button0.widthAnchor.constraint(equalToConstant: 175).isActive = true
        button0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: buttonSpacing).isActive = true
        button0.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: buttonSpacing).isActive = true
    }
    
    func button1Constraints() {
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button1.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        button1.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: buttonSpacing).isActive = true
        
    }
    
    func button2Constraints() {
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button2.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 10).isActive = true
        button2.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: buttonSpacing).isActive = true
        
    }
    
    func button3Constraints() {
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button3.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 10).isActive = true
        button3.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: buttonSpacing).isActive = true
    }
    
    func button4Constraints() {
        button4.translatesAutoresizingMaskIntoConstraints = false
        button4.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button4.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        button4.topAnchor.constraint(equalTo: button7.bottomAnchor, constant: 10).isActive = true
        
    }
    
    func button5Constraints() {
        button5.translatesAutoresizingMaskIntoConstraints = false
        button5.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button5.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button5.leadingAnchor.constraint(equalTo: button4.trailingAnchor, constant: 10).isActive = true
        button5.topAnchor.constraint(equalTo: button7.bottomAnchor, constant: 10).isActive = true
    }
    
    func button6Constraints() {
        button6.translatesAutoresizingMaskIntoConstraints = false
        button6.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button6.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button6.leadingAnchor.constraint(equalTo: button5.trailingAnchor, constant: 10).isActive = true
        button6.topAnchor.constraint(equalTo: button7.bottomAnchor, constant: 10).isActive = true
    }
    
    func button7Constraints() {
        button7.translatesAutoresizingMaskIntoConstraints = false
        button7.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button7.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button7.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        button7.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: 10).isActive = true
    }
    
    func button8Constraints() {
        button8.translatesAutoresizingMaskIntoConstraints = false
        button8.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button8.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button8.leadingAnchor.constraint(equalTo: button7.trailingAnchor, constant: 10).isActive = true
        button8.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: 10).isActive = true
    }
    
    func button9Constraints() {
        button9.translatesAutoresizingMaskIntoConstraints = false
        button9.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button9.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        button9.leadingAnchor.constraint(equalTo: button8.trailingAnchor, constant: 10).isActive = true
        button9.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: 10).isActive = true
    }
    
    func clearButtonConstraints() {
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        clearButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        clearButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
        
    }
    
    func negativeButtonConstraints() {
        negativeButton.translatesAutoresizingMaskIntoConstraints = false
        negativeButton.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        negativeButton.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        negativeButton.leadingAnchor.constraint(equalTo: clearButton.trailingAnchor, constant: 10).isActive = true
        negativeButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
        
    }
    
    func percentageButtonConstraints() {
        percentageButton.translatesAutoresizingMaskIntoConstraints = false
        percentageButton.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        percentageButton.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        percentageButton.leadingAnchor.constraint(equalTo: negativeButton.trailingAnchor, constant: 10).isActive = true
        percentageButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
    }
    
    func divideButtonConstraints() {
        divideButton.translatesAutoresizingMaskIntoConstraints = false
        divideButton.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        divideButton.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        divideButton.leadingAnchor.constraint(equalTo: percentageButton.trailingAnchor, constant: 10).isActive = true
        divideButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
    }
    
    func kommaButtonConstraints() {
        kommaButton.translatesAutoresizingMaskIntoConstraints = false
        kommaButton.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        kommaButton.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        kommaButton.leadingAnchor.constraint(equalTo: button0.trailingAnchor, constant: buttonSpacing).isActive = true
        kommaButton.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 10).isActive = true
    }
    
    func multiplyButtonConstraints() {
        multiplyButton.translatesAutoresizingMaskIntoConstraints = false
        multiplyButton.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        multiplyButton.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        multiplyButton.leadingAnchor.constraint(equalTo: button9.trailingAnchor, constant: buttonSpacing).isActive = true
        multiplyButton.topAnchor.constraint(equalTo: divideButton.bottomAnchor, constant: 10).isActive = true
    }
    
    func minusButtonConstraints() {
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        minusButton.leadingAnchor.constraint(equalTo: button6.trailingAnchor, constant: buttonSpacing).isActive = true
        minusButton.topAnchor.constraint(equalTo: multiplyButton.bottomAnchor, constant: 10).isActive = true
        
    }
    
    func plusButtonConstraints() {
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        plusButton.leadingAnchor.constraint(equalTo: button3.trailingAnchor, constant: buttonSpacing).isActive = true
        plusButton.topAnchor.constraint(equalTo: minusButton.bottomAnchor, constant: 10).isActive = true
    }
    
    func equalButtonConstraints() {
        equalButton.translatesAutoresizingMaskIntoConstraints = false
        equalButton.heightAnchor.constraint(equalToConstant: buttonScale).isActive = true
        equalButton.widthAnchor.constraint(equalToConstant: buttonScale).isActive = true
        equalButton.leadingAnchor.constraint(equalTo: kommaButton.trailingAnchor, constant: buttonSpacing).isActive = true
        equalButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 10).isActive = true
    }
    
    // Actions
    
    @objc func button0Tapped() {
        print("0 Tapped")
        makeString(buttonValue: "0")
        
        
    }
    
    @objc func button1Tapped() {
        print("1 Tapped")
        makeString(buttonValue: "1")
        
    }
    
    @objc func button2Tapped() {
        print("2 Tapped")
        makeString(buttonValue: "2")
    }
    
    @objc func button3Tapped() {
        print("3 Tapped")
        makeString(buttonValue: "3")
    }
    
    @objc func button4Tapped() {
        print("4 Tapped")
        makeString(buttonValue: "4")
    }
    
    @objc func button5Tapped() {
        print("5 Tapped")
        makeString(buttonValue: "5")
    }
    
    @objc func button6Tapped() {
        print("6 Tapped")
        makeString(buttonValue: "6")
    }
    
    @objc func button7Tapped() {
        print("7 Tapped")
        makeString(buttonValue: "7")
    }
    
    @objc func button8Tapped() {
        print("8 Tapped")
        makeString(buttonValue: "8")
    }
    
    @objc func button9Tapped() {
        print("9 Tapped")
        makeString(buttonValue: "9")
    }
    
    @objc func equalButtonTapped() {
        if (positionOne != "") && (positionTwo != "") && (mathOperator != "") {
            doTheMath()
            textView.text = computedValue
            print("equal")
        }
         print("equal")
    }
    
    @objc func clearButtonTapped() {
        print("clear")
       
        textView.text = ""
        positionOne = ""
        positionTwo = ""
        mathOperator = ""
    }
    
    @objc func plusButtonTapped() {
        print("+")
        mathOperator = "+"
        mathOperatorActive = true
        textView.text = ""
    }
    
    
}
// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()
let vc = MyViewController()
vc.preferredContentSize = CGSize(width: 375, height: 812) // iPhone X
PlaygroundPage.current.liveView = vc

