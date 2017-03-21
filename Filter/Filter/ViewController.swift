//
//  ViewController.swift
//  Filter
//
//  Created by 爱运动 on 2017/3/21.
//  Copyright © 2017年 爱运动. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var segment: UISegmentedControl!
    
    var value = 0
    var imagex : UIImage!
    @IBAction func slide(_ sender: UISlider) {
        if value == 0{
            sepiaTone(value: sender.value)
        }else{
            blur(value: sender.value)
        }
    }
    
    @IBAction func segmentClick(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            value = 0
        }else{
            value = 1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        segment.selectedSegmentIndex = 0;
//        value = 0
        imagex = UIImage(named: "22")
        imageView.image = imagex
        
    }


}

extension ViewController{
    // 旧色调 滤镜不知道为什么不行 日了狗哦!!! 高斯模糊就可以 fuck
    // wtf  为什么又可以了呢
    fileprivate func sepiaTone(value : Float){
        let context = CIContext(options: nil)
        let cImage = CIImage(cgImage: imagex.cgImage!)
        // 创建滤镜
//        CISepiaTone
//        CIGaussianBlur
        let sepiaTone = CIFilter(name: "CISepiaTone")
        // 设置输入源
        sepiaTone?.setValue(cImage, forKey: kCIInputImageKey)
        // 设置滤镜的强度
        sepiaTone?.setValue(value, forKey: kCIInputIntensityKey)
        // 输出加滤镜以后的图片
        guard let resultImage = sepiaTone?.outputImage else {return}
        
        let imageRef = context.createCGImage(resultImage, from: CGRect(x: 0, y: 0, width: imageView.image!.size.width, height: imageView.image!.size.height))
        let image = UIImage(cgImage: imageRef!)
        imageView.image = image
        
    }
    // 高斯模糊
    fileprivate func blur(value : Float){
        let context = CIContext(options: nil)
        let cImage = CIImage(cgImage: imagex.cgImage!)
        // 创建滤镜
        //        CISepiaTone
        //        CIGaussianBlur
        let sepiaTone = CIFilter(name: "CIGaussianBlur")
        // 设置输入源
        sepiaTone?.setValue(cImage, forKey: kCIInputImageKey)
        // 设置滤镜的强度
        sepiaTone?.setValue(value, forKey: kCIInputRadiusKey)
        // 输出加滤镜以后的图片
        //        print(sepiaTone?.outputImage!)
        guard let resultImage = sepiaTone?.outputImage else {return}
        
        let imageRef = context.createCGImage(resultImage, from: CGRect(x: 0, y: 0, width: imageView.image!.size.width, height: imageView.image!.size.height))
        let image = UIImage(cgImage: imageRef!)
        imageView.image = image
        
    }
    
}
