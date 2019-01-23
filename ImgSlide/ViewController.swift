//
//  ViewController.swift
//  ImgSlide
//
//  Created by nguyentienhoang on 1/22/19.
//  Copyright © 2019 nguyentienhoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let imgFrame = UIView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 2))
    private let imgView = UIImageView()
    private let line = UIView()
    private let nextBtn = UIButton()
    private let imgArr = ["1", "2", "3"]
    private var imgIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgFrame.backgroundColor = .orange
        view.addSubview(imgFrame)
        
        imgView.image = UIImage(named: "1")
        imgView.frame = CGRect(x: 0, y: 70, width: 30, height: 30)
        view.addSubview(imgView)
        
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
            self.imgView.image = UIImage(named: "\(self.imgIndex)")
            self.imgView.frame.origin.x += UIScreen.main.bounds.width / 10
        }) { _ in
            
        }
    }
}

