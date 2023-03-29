//
//  ViewController.swift
//  SendDataToPrev_VC
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {

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
        vc.delegate = self
        vc.text = textLabel.text
        vc.textColor = textLabel.textColor
        vc.backgroundColor = textLabel.backgroundColor ?? .black
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        textLabel.text = text
        textLabel.textColor = textColor
        textLabel.backgroundColor = backgroundColor
    }
}
