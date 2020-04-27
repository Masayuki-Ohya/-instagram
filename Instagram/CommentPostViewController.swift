//
//  CommentPostViewController.swift
//  Instagram
//
//  Created by 大矢政行 on 2020/04/24.
//  Copyright © 2020 masayuki.ohya. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentPostViewController: UIViewController {
    
    @IBOutlet weak var commentName: UITextField!
    @IBOutlet weak var commentField: UITextField!
    
    var postData:PostData?
    
    @IBAction func commentPost(_ sender: Any) {
        if let CommentName = commentName.text, let Comment = commentField.text{
        
        
        if CommentName.isEmpty || Comment.isEmpty {
            SVProgressHUD.showError(withStatus: "必要項目を入力して下さい")
            return
            }
        }
            
        var updateValue: FieldValue
        
        updateValue = FieldValue.arrayUnion(["\(commentName.text!):\(commentField.text!)"])
        
        
        let commentsRef = Firestore.firestore().collection(Const.PostPath).document(postData!.id)
        commentsRef.updateData(["comments": updateValue])
        
        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
