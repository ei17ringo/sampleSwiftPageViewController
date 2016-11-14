//
//  PageViewController.swift
//  sampleSwiftPageViewController
//
//  Created by Eriko Ichinohe on 2016/11/14.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
    }

    func getFirst() -> ViewController {
        return storyboard!.instantiateViewController(withIdentifier: "firstViewController") as! ViewController
    }
    
    func getSecond() -> secondViewController {
        return storyboard!.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
    }
    
    func getThird() -> thirdViewController {
        return storyboard!.instantiateViewController(withIdentifier: "thirdViewController") as! thirdViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: thirdViewController.self) {
            // 3 -> 2
            return getSecond()
        } else if viewController.isKind(of: secondViewController.self) {
            // 2 -> 1
            return getFirst()
        } else {
            // 1 -> end of the road
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: ViewController.self) {
            // 1 -> 2
            return getSecond()
        } else if viewController.isKind(of: secondViewController.self) {
            // 2 -> 3
            return getThird()
        } else {
            // 3 -> end of the road
            return nil
        }
    }
}
