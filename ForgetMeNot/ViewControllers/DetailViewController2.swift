//
//  DetailViewController2.swift
//  ForgetMeNot
//
//  Created by admin on 2017. 11. 12..
//  Copyright © 2017년 Ray Wenderlich. All rights reserved.
//

import UIKit

class DetailViewController2: UIViewController {

    var pmessageTitle:String!
    var pmainImage:String!
    var plocation:String!
    var pinsDate:String!
    var pmessageContent:String!
    
    @IBOutlet weak var messageTitle: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var insDate: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        messageTitle.text = pmessageTitle
        //messageContent.text = pmessageContent
        location.text = plocation
        insDate.text = pinsDate
        
        let URL_IMAGE = URL(string : pmainImage)
        let session = URLSession(configuration : .default)
        let getImageFromUrl = session.dataTask(with: URL_IMAGE!) { (data, response, error) in
            //if there is any error
            if let e = error {
                //displaying the message
                print("Error Occurred: \(e)")
            } else {
                //in case of now error, checking wheather the response is nil or not
                if (response as? HTTPURLResponse) != nil {
                    //checking if the response contains an image
                    if let imageData = data {
                        //getting the image
                        let image = UIImage(data: imageData)
                        //displaying the image
                        self.mainImage.image = image
                    } else {
                        print("Image file is currupted")
                    }
                } else {
                    print("No response from server")
                }
            }
        }
        //starting the download task
        getImageFromUrl.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
