//
//  ViewController.swift
//  CustomPopupTuto
//
//  Created by 김광록 on 2022/03/04.
//

import UIKit
import WebKit

class ViewController: UIViewController, PopupDelegate {

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
        let customPopupVC = storyboard.instantiateViewController(withIdentifier: "AlertPopupVC") as! CustomPopupViewController
        
        // 뷰컨트롤러가 보여지는 스타일
        customPopupVC.modalPresentationStyle = .overCurrentContext
        // 뷰컨트롤러가 사라지는 스타일
        customPopupVC.modalTransitionStyle = .crossDissolve
        
        customPopupVC.goToStartBtnCompletionClosure = {
            print("컴플레션 블럭이 호출되었다.")
            let myBlogUrl = URL(string: "https://www.youtube.com")
            self.myWebView.load(URLRequest(url: myBlogUrl!))
        }
        
        customPopupVC.myPopupDelegate = self
        
        
        self.present(customPopupVC, animated: true, completion: nil)
    }
    
    // MARK: - PopupDelegate methods
    func onOpenChatBtnClicked() {
        print("ViewController - onOpenChatBtnClicked() is called!")
        let myBlogUrl = URL(string: "https://www.google.com")
        self.myWebView.load(URLRequest(url: myBlogUrl!))
    }
}

