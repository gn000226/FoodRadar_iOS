//
//  ViewController.swift
//  FoodRadar_iOS
//
//  Created by Hsinwei Kao on 2020/10/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 取得使用者登入狀態並設定全域變數COMM_USER_ID的為會員ID
        if let userAccount = UserAccount.readUsersFromFile() {
            COMM_USER_ID = userAccount[0].userId
        } else {
            COMM_USER_ID = 0
        }
        
        // 關閉 Badge 功能
//        SetBadge ()
        
        //調整TabBar文字顏色
        if #available(iOS 13, *) {
            let appearance = UITabBarAppearance.init()
            // 預設樣式
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor(red: 23/255, green: 38/255, blue: 37/255, alpha: 1)
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10),
                NSAttributedString.Key.foregroundColor: UIColor(red: 23/255, green: 38/255, blue: 37/255, alpha: 1)
            ]
            // 選擇時樣式
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10),
                NSAttributedString.Key.foregroundColor: UIColor(red: 171/255, green: 83/255, blue: 96/255, alpha: 1.00)
            ]
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor(red: 171/255, green: 83/255, blue: 96/255, alpha: 1.00)
            appearance.stackedItemPositioning = .automatic
            appearance.backgroundColor = UIColor.white
            /*apearance.stackedLayoutAppearance.normapl.iconColor = AppData.barColor
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10),
                NSAttributedString.Key.foregroundColor: AppData.barColor
            ]*/
            tabBarController?.tabBar.standardAppearance = appearance
            
        } else{
            UITabBarItem.appearance().setTitleTextAttributes([
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ], for: .selected)
            UITabBarItem.appearance().setTitleTextAttributes([
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10),
                NSAttributedString.Key.foregroundColor: UIColor(red: 171/255, green: 83/255, blue: 96/255, alpha: 1.00)
            ], for: .normal)
            tabBarController?.tabBar.unselectedItemTintColor = UIColor(red: 171/255, green: 83/255, blue: 96/255, alpha: 1.00)
            
            /*UITabBarItem.appearance().setTitleTextAttributes([
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10),
                NSAttributedString.Key.foregroundColor: UIColor(red: 33/255, green: 137/255, blue: 137/255, alpha: 1)
            ], for: .normal)
            self.tabBar.unselectedItemTintColor = UIColor(red: 33/255, green: 137/255, blue: 137/255, alpha: 1)*/
        }
        tabBarController?.tabBar.tintColor = UIColor.white
        
    }
    
    func SetBadge () {
        // 設定TabBar會員專區顯示的badge等於會員ID
        if let tabItems = tabBarController?.tabBar.items {
            let tabItem = tabItems[4] // TabBar會員專區
            if COMM_USER_ID == 0 {
                tabItem.badgeValue = nil
                print("SetBadge.COMM_USER_ID == 0")
            } else {
                tabItem.badgeValue = String(COMM_USER_ID)
                print("SetBadge.String(COMM_USER_ID)")
            }
        }
    }


}

