//
//  SecondViewController.swift
//  original
//
//  Created by 小西夏穂 on 2016/06/20.
//  Copyright © 2016年 小西夏穂. All rights reserved.
//


import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    var mySelectedImage: UIImage!
    var mySelectedImageView: UIImageView!
    
    override func viewDidLoad() {
        
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
        
        setImage()
    }
    
    /**
     選択された画像をUIImageViewにセットする.
     */
    func setImage(){
        self.title = "Selected Image"
        
        mySelectedImageView = UIImageView(frame: self.view.bounds)
        mySelectedImageView.contentMode = UIViewContentMode.ScaleAspectFit
        mySelectedImageView.image = mySelectedImage
        self.view.addSubview(mySelectedImageView)
    }
    
}
