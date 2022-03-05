//
//  ViewController.swift
//  CustomPopupTuto
//
//  Created by 김광록 on 2022/03/04.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var CreatePopupBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onCreatePopupBtnClicked(_ sender: UIButton) {
        
        print("ViewController - onCreatePopupBtnClicked is played!")
        
        // 스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "Popup", bundle: nil)
        
        // 스토리보드를 통해 뷰컨트롤러 가져오기
        let alertPopupVC = storyboard.instantiateViewController(withIdentifier: "AlertPopupVC")
        
        // 뷰컨트롤러가 보여지는 스타일
        alertPopupVC.modalPresentationStyle = .overCurrentContext
        // 뷰컨트롤러가 사라지는 스타일
        alertPopupVC.modalTransitionStyle = .crossDissolve
        
        self.present(alertPopupVC, animated: true, completion: nil)
        
    }
}

