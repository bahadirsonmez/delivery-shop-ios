//
//  OTPStackView.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 8.02.2021.
//
import UIKit

protocol OTPDelegate: class {
    //always triggers when the OTP field is valid
    func didChangeValidity(isValid: Bool)
}


class OTPStackView: UIStackView {

    //Customise the OTPField here
    let numberOfFields = 5
    var textFieldsCollection: [OTPTextField] = []
    weak var delegate: OTPDelegate?
    var showsWarningColor = false

    //Colors
    let inactiveFieldBorderColor = UIColor.clear
    let textBackgroundColor = UIColor(rgba: "#F2F3F7")
    let activeFieldBorderColor = UIColor.black
    var remainingStrStack: [String] = []

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
        addOTPFields()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        addOTPFields()
    }

    final func firstBoxBecomeFirstResponder() {
        textFieldsCollection[0].becomeFirstResponder()
    }

    //Customisation and setting stackView
    private final func setupStackView() {
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .center
        self.distribution = .fillEqually
        self.spacing = 15
    }

    //Adding each OTPfield to stack view
    private final func addOTPFields() {
        for index in 0..<numberOfFields{
            let field = OTPTextField()
            setupTextField(field)
            textFieldsCollection.append(field)
            //Adding a marker to previous field
            index != 0 ? (field.previousTextField = textFieldsCollection[index-1]) : (field.previousTextField = nil)
            //Adding a marker to next field for the field at index-1
            index != 0 ? (textFieldsCollection[index-1].nextTextField = field) : ()
        }
        textFieldsCollection[0].becomeFirstResponder()
    }

    //Customisation and setting OTPTextFields
    private final func setupTextField(_ textField: OTPTextField){
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(textField)
        textField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        textField.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        textField.backgroundColor = textBackgroundColor
        textField.textAlignment = .center
        textField.adjustsFontSizeToFitWidth = false
        textField.font = Constants.Fonts.regular16
//        textField.font = UIFont(name: "Kefa", size: 40)
        textField.textColor = Constants.Colors.mainTextColor
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 2
        textField.borderColor = inactiveFieldBorderColor
        textField.keyboardType = .numberPad
        textField.autocorrectionType = .no
        textField.textContentType = .oneTimeCode
    }

    //checks if all the OTPfields are filled
    private final func checkForValidity(){
        for fields in textFieldsCollection{
            if (fields.text?.trimmingCharacters(in: CharacterSet.whitespaces) == ""){
                delegate?.didChangeValidity(isValid: false)
                return
            }
        }
        delegate?.didChangeValidity(isValid: true)
    }

    //gives the OTP text
    final func getOTP() -> String {
        var OTP = ""
        for textField in textFieldsCollection{
            OTP += textField.text ?? ""
        }
        return OTP
    }

    //set isWarningColor true for using it as a warning color
    final func setAllFieldColor(isWarningColor: Bool = false, color: UIColor){
        for textField in textFieldsCollection{
            textField.borderColor = color
            if isWarningColor {
                textField.shake()
            }
        }
        showsWarningColor = isWarningColor
    }

    //autofill textfield starting from first
    private final func autoFillTextField(with string: String) {
        remainingStrStack = string.reversed().compactMap{String($0)}
        for textField in textFieldsCollection {
            if let charToAdd = remainingStrStack.popLast() {
                textField.text = String(charToAdd)
            } else {
                break
            }
        }
        checkForValidity()
        remainingStrStack = []
    }

}

//MARK: - TextField Handling
extension OTPStackView: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if showsWarningColor {
            setAllFieldColor(color: inactiveFieldBorderColor)
            showsWarningColor = false
        }
        textField.borderColor = activeFieldBorderColor.withAlphaComponent(0.3)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        checkForValidity()
        textField.borderColor = inactiveFieldBorderColor
    }

    //switches between OTPTextfields
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange,
                   replacementString string: String) -> Bool {
        guard let textField = textField as? OTPTextField else { return true }
        if string.count > 1 {
            textField.resignFirstResponder()
            autoFillTextField(with: string)
            return false
        } else {
            if (range.length == 0 && string == "") {
                return false
            } else if (range.length == 0){
                if textField.nextTextField == nil {
                    textField.text? = string
                    textField.resignFirstResponder()
                }else{
                    textField.text? = string
                    textField.nextTextField?.becomeFirstResponder()
                }
                return false
            }
            return true
        }
    }

}