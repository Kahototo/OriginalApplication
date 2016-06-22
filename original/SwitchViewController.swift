//
//  ViewController2.swift
//  original
//
//  Created by 小西夏穂 on 2016/06/20.
//  Copyright © 2016年 小西夏穂. All rights reserved.
//

import UIKit

class Controller: UIViewController {
    
    private var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色をCyanに設定する.
        self.view.backgroundColor = UIColor.cyanColor()
        
        // Swicthを作成する.
        let mySwicth: UISwitch = UISwitch()
        mySwicth.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 200)
        
        // Swicthの枠線を表示する.
        mySwicth.tintColor = UIColor.blackColor()
        
        // SwitchをOnに設定する.
        mySwicth.on = true
        
        // SwitchのOn/Off切り替わりの際に、呼ばれるイベントを設定する.
        mySwicth.addTarget(self, action: "onClickMySwicth:", forControlEvents: UIControlEvents.ValueChanged)
        
        // SwitchをViewに追加する.
        self.view.addSubview(mySwicth)
        
        // On/Offを表示するラベルを作成する.
        myLabel = UILabel(frame: CGRectMake(0,0,150,150))
        myLabel.backgroundColor = UIColor.orangeColor()
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 75.0
        myLabel.textColor = UIColor.whiteColor()
        myLabel.shadowColor = UIColor.grayColor()
        myLabel.font = UIFont.systemFontOfSize(CGFloat(30))
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        myLabel.text = "On"
        
        // ラベルをviewに追加
        self.view.addSubview(myLabel)
        
        
    }
    
    internal func onClickMySwicth(sender: UISwitch){
        
        if sender.on {
            myLabel.text = "On"
            myLabel.backgroundColor = UIColor.orangeColor()
        }
        else {
            myLabel.text = "Off"
            myLabel.backgroundColor = UIColor.grayColor()
        }
    }
    
    class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        var myImagePicker: UIImagePickerController!
        var myImageView: UIImageView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.title = "Select a Image"
            
            myImageView = UIImageView(frame: self.view.bounds)
            
            // インスタンス生成
            myImagePicker = UIImagePickerController()
            
            // デリゲート設定
            myImagePicker.delegate = self
            
            // 画像の取得先はフォトライブラリ
            myImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            // 画像取得後の編集を不可に
            myImagePicker.allowsEditing = false
        }
        
        override func viewDidAppear(animated: Bool) {
            self.presentViewController(myImagePicker, animated: true, completion: nil)
            
        }
        
        /**
         画像が選択された時に呼ばれる.
         */
        func ImagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
            
            //選択された画像を取得.
            var myImage: AnyObject?  = info[UIImagePickerControllerOriginalImage]
            
            //選択された画像を表示するViewControllerを生成.
            let secondViewController = SecondViewController()
            //選択された画像を表示するViewContorllerにセットする.
            secondViewController.mySelectedImage = myImage as! UIImage
            
            myImagePicker.pushViewController(secondViewController, animated: true)
            
        }
        
        /**
         画像選択がキャンセルされた時に呼ばれる.
         */
        func imagePickerControllerDidCancel(picker: UIImagePickerController) {
            
            // モーダルビューを閉じる
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}