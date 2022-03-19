//
//  ViewController.swift
//  CustomPopupTuto
//
//  Created by 김광록 on 2022/03/04.
//

import UIKit
import WebKit

let notificationName = "btnClickNotification"

class ViewController: UIViewController, PopupDelegate {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var CreatePopupBtn: UIButton!
    
    deinit{
        NotificationCenter.default.removeObserver(self)  // 메모리에서 해제를 해줘야한다..(?) 
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 노티피케이션이라는 방송 수신기를 장착한다.
        NotificationCenter.default.addObserver(self, selector: #selector(LoadWebView), name: NSNotification.Name(rawValue: notificationName), object: nil)
    }
    
    @objc fileprivate func LoadWebView(){
        print("ViewController - LoadWebView() is called")
        
        let myBlogUrl = URL(string: "https://crazydeer.tistory.com")
        self.myWebView.load(URLRequest(url: myBlogUrl!))
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

