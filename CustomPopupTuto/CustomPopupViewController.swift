//
//  CustomPopupViewController.swift
//  CustomPopupTuto
//
//  Created by 김광록 on 2022/03/04.
//

import UIKit

class CustomPopupViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var goToStartBtn: UIButton!
    @IBOutlet weak var bgBtn: UIButton!
    
    @IBOutlet weak var openChatBtn: UIButton!
    
    
    var goToStartBtnCompletionClosure: (() -> Void)?
    
    var myPopupDelegate: PopupDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopupViewController Called")
        
        contentView.layer.cornerRadius = 30
        goToStartBtn.layer.cornerRadius = 10
        openChatBtn.layer.cornerRadius = 10
    }
    
    
    // MARK: - IBAction
    @IBAction func onBgBtnClicked(_ sender: UIButton) {
        print("CustomPopupViewController - onBgBtnClicked() is called!")
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func onGoToStartBtnClicked(_ sender: UIButton) {
        print("CustomPopupViewController - onGoToStartBtnClicked() is called!")
        
        self.dismiss(animated: true, completion: nil)
        
        // 컴플레션 블럭 호출
        if let goToStartBtnCompletionClosure = goToStartBtnCompletionClosure {
            // 메인에게 이 버튼이 클릭됐다라는 것을 비동기(?) 방식으로 알린다
            goToStartBtnCompletionClosure()
        }
    }
    
    @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
        print("CustomPopupViewController - onOpenChatBtnClicked() is called!")
        
        myPopupDelegate?.onOpenChatBtnClicked()
        self.dismiss(animated: true, completion: nil)
    }
    
}
