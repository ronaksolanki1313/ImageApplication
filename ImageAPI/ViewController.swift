
//  ViewController.swift
//  ImageAPI
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageview3: UIImageView!
    @IBOutlet weak var imageview4: UIImageView!
    
    @IBOutlet weak var Imageview5: UIImageView!
    @IBOutlet weak var imageview6: UIImageView!
    @IBOutlet weak var Imageview7: UIImageView!
    @IBOutlet weak var Imageview8: UIImageView!
    @IBOutlet weak var Imageview9: UIImageView!
    
    @IBOutlet weak var Imageview10: UIImageView!
    
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Random Images Data ...")
        scrollView.addSubview(refreshControl)

        
        
        
        loadImage()
    }

    @objc func refresh() {
        loadImage()
        print("Data refresh")
    }

    func loadImage() {
        let timestamp = Int(Date().timeIntervalSince1970)
        let imageUrl = "https://picsum.photos/200/300?random=\(timestamp)"
        for i in 0...9{
            if let url = URL(string: imageUrl) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            
                            switch i{
                            case 1:
                                self.imageView.image = image
                            case 2:
                                self.imageView2.image = image
                            case 3:
                                self.imageview3.image = image
                            case 4:
                                self.imageview4.image = image
                            case 5 :
                                self.Imageview5.image = image
                            case 6 :
                                self.imageview6.image = image
                            case 7 :
                                self.Imageview7.image = image
                            case 8 :
                                self.Imageview8.image = image
                            case 9:
                                self.Imageview9.image = image
                            default:
                                self.Imageview10.image = image
                            }
                            
                            self.refreshControl.endRefreshing()
                        }
                    }
                }.resume()
            }
        }
    }
}

