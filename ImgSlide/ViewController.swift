//
//  ViewController.swift
//  ImgSlide
//
//  Created by nguyentienhoang on 1/22/19.
//  Copyright © 2019 nguyentienhoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let imgFrame = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
    private let imgView = UIImageView()
    private let nextBtn = UIButton()
    private let imgArr = ["1", "2", "3"]
    private var imgIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgFrame.backgroundColor = .orange
        view.addSubview(imgFrame)
        
        imgView.image = UIImage(named: "1")
        imgFrame.addSubview(imgView)
        imgView.frame = imgFrame.frame
        
        view.addSubview(nextBtn)
        nextBtn.frame = CGRect(origin: CGPoint(x: view.center.x, y: UIScreen.main.bounds.width + 30), size: CGSize(width: 100, height: 30))
        nextBtn.backgroundColor = .black
        nextBtn.addTarget(self, action: #selector(nextImg(_:)), for: .touchUpInside)
    }
    
    
    @objc func nextImg(_ sender: UIButton) {
        if imgIndex == imgArr.count {
            imgIndex = 0
        }
        imgIndex += 1
        addImgSlide(ingIndex: imgIndex)
    }
    
    private func addImgSlide(ingIndex: Int) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            self.imgView.frame.origin.x += 500 //di chuyển imgView qua phải 500.
        }) { _ in
            self.imgView.frame.origin.x -= 500 //Sau khi di chuyển qua phải 500 phải đưa imgVIew về vị trí cũ (di duyển qua trái 500).
            self.imgView.image = UIImage(named: "\(self.imgIndex)")
        }
    }
}

