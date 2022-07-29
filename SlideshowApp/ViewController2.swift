//
//  ViewController2.swift
//  SlideshowApp
//
//  Created by 鈴木健太 on 2022/07/29.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var imageView2: UIImageView!
    
    var enmptyImage: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView2.image = enmptyImage

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
