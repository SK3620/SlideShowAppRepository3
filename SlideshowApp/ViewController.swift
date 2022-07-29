//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 鈴木健太 on 2022/07/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var susumuButton: UIButton!
    @IBOutlet weak var modoruButton: UIButton!
    @IBOutlet weak var playOrStopButton: UIButton!
    
    var indexNum: Int = 0
    var indexNum2: Int = 0
    var timer: Timer!
    
    
    let imageArray: [UIImage] = [
        UIImage(named: "download.jpg")!,
        UIImage(named: "download-1.jpg")!,
        UIImage(named: "download-2.jpg")!
    ]
    
    @IBAction func tapImageView(_ sender: Any) {
        performSegue(withIdentifier: "ToViewController2", sender: nil)
    }
    
    //    遷移する際に何かしらの処理を行いたい場合はこのメソッド内に書く。遷移が始まると、自動で呼び出される。Segue objects contain information about the view controllers involved in a transition. When a segue is triggered, but before the visual transition occurs, the storyboard runtime calls the current view controller’s prepare(for:sender:) method so that it can pass any needed data to the view controller that is about to be displayed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController2: ViewController2 = segue.destination as! ViewController2
        viewController2.enmptyImage = imageView.image!
        
        if timer != nil{
            
            timer.invalidate()
            playOrStopButton.setTitle("再生", for: .normal)
            playOrStopButton.titleLabel?.textAlignment = NSTextAlignment.center
            
            timer = nil
        }
        
        if susumuButton.currentTitle! == "タップ不可" {
            
            changeButton()
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let sampleImage1 = UIImage(named: "download.jpg")
        imageView.image = sampleImage1
    }
    
    
    @IBAction func susumuButtonAction(_ sender: Any) {
        
        if indexNum == imageArray.count - 1{
            indexNum = 0
            imageView.image = imageArray[indexNum]
        } else {
            indexNum += 1
            imageView.image = imageArray[indexNum]
        }
    }
    
    
    
    @IBAction func modoruButtonAction(_ sender: Any) {
        
        if indexNum == 0 {
            indexNum = imageArray.count - 1
            imageView.image = imageArray[indexNum]
        } else {
            indexNum -= 1
            imageView.image = imageArray[indexNum]
        }
        
    }
    
    @IBAction func platOrStopButtonAction(_ sender: Any) {
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            playOrStopButton.setTitle("停止", for: .normal)
            
            susumuButton.isEnabled = false
            modoruButton.isEnabled = false
            susumuButton.setTitle("タップ不可", for: .normal)
            modoruButton.setTitle("タップ不可", for: .normal)
            susumuButton.titleLabel?.textAlignment = NSTextAlignment.center
            modoruButton.titleLabel?.textAlignment = NSTextAlignment.center
            
        } else {
            
            timer.invalidate()
            timer = nil
            
            playOrStopButton.setTitle("再生", for: .normal)
            
            changeButton()
            
        }
        
        
    }
    
    @objc func changeImage() -> Void{
        
        if indexNum2 == imageArray.count - 1{
            imageView.image = imageArray[imageArray.count - 1]
            indexNum2 = 0
        } else {
            
            imageView.image = imageArray[indexNum2]
            indexNum2 += 1
        }
    }
    
    func changeButton(){
        
        susumuButton.isEnabled = true
        modoruButton.isEnabled = true
        susumuButton.setTitle("進む", for: .normal)
        modoruButton.setTitle("戻る", for: .normal)
        susumuButton.titleLabel?.textAlignment = NSTextAlignment.center
        modoruButton.titleLabel?.textAlignment = NSTextAlignment.center
        
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){
    }
    
    
    
}

