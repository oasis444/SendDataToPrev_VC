//
//  SecondVC.swift
//  SendDataToPrev_VC
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SecondVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var purpleBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var orangeBtn: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate? // weak를 붙이지 않는다면 강한 참조에 의해 메모리 누수 발생
    var text: String?
    var textColor: UIColor = .systemYellow
    var backgroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        configure()
    }
    
    @IBAction func textColorBtn(_ sender: UIButton) {
        if sender == yellowBtn {
            changeTextColor(color: .systemYellow)
            textColor = .systemYellow
        } else if sender == purpleBtn {
            changeTextColor(color: .systemPurple)
            textColor = .systemPurple
        } else {
            changeTextColor(color: .systemGreen)
            textColor = .systemGreen
        }
    }
    
    @IBAction func backgroundColorBtn(_ sender: UIButton) {
        if sender == blackBtn {
            changeBackColor(color: .black)
            backgroundColor = .black
        } else if sender == blueBtn {
            changeBackColor(color: .link)
            backgroundColor = .link
        } else {
            changeBackColor(color: .systemOrange)
            backgroundColor = .systemOrange
        }
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        self.delegate?.changedSetting(
            text: textField.text,
            textColor: textColor,
            backgroundColor: backgroundColor)
        navigationController?.popViewController(animated: true)
    }
    
    private func configure() {
        textField.text = text
        changeTextColor(color: textColor)
        changeBackColor(color: backgroundColor)
    }
    
    private func changeTextColor(color: UIColor) {
        yellowBtn.alpha = color == UIColor.systemYellow ? 1 : 0.2
        purpleBtn.alpha = color == UIColor.systemPurple ? 1 : 0.2
        greenBtn.alpha = color == UIColor.systemGreen ? 1 : 0.2
    }
    
    private func changeBackColor(color: UIColor) {
        blackBtn.alpha = color == UIColor.black ? 1 : 0.2
        blueBtn.alpha = color == UIColor.link ? 1 : 0.2
        orangeBtn.alpha = color == UIColor.systemOrange ? 1 : 0.2
    }
}
