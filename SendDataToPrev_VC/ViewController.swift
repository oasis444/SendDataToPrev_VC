//
//  ViewController.swift
//  SendDataToPrev_VC
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }

    private func configure() {
        let settingBtn = UIBarButtonItem(title: "설정", style: .plain, target: self, action: #selector(tappedButton))
        navigationItem.rightBarButtonItem = settingBtn
        navigationItem.backButtonDisplayMode = .minimal
    }
    
    @objc func tappedButton() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
//        vc.delegate = self
        vc.setData(text: textLabel.text, textcolor: textLabel.textColor, backgroundColor: textLabel.backgroundColor ?? .black)
        vc.data = { [weak self] text, textColor, backgroundColor in
            guard let self = self else { return }
            self.textLabel.text = text
            self.textLabel.textColor = textColor
            self.textLabel.backgroundColor = backgroundColor
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

//extension ViewController: LEDBoardSettingDelegate {
//    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
//        textLabel.text = text
//        textLabel.textColor = textColor
//        textLabel.backgroundColor = backgroundColor
//    }
//}
