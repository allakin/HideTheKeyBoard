//
//  ViewController.swift
//  HideTheKeyBoard
//
//  Created by Павел Анплеенко on 28/02/17.
//  Copyright © 2017 Pavel Anpleenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var topTextField: UITextField!
	@IBOutlet weak var bottonText: UITextField!
	override func viewDidLoad() {
		super.viewDidLoad()
		registerForKeyboardNotifictions()
	}

	deinit {
		removeKeboardNotification()
	}
	
	func registerForKeyboardNotifictions() {
		NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
			NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
	}
	
	
	func removeKeboardNotification() {
		NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
	}
	
	
	func kbWillShow(_ notification: Notification) {
		let userInfo = notification.userInfo
		//получения конечного значения размера клавиатуры
		let kbFrameSize = (userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
		//сместили клавиатуру на ее высоту
		scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height)
		
	}
	
	func kbWillHide() {
		scrollView.contentOffset = CGPoint.zero
	}
	
	
	@IBAction func buttonTapped(_ sender: Any) {
		topTextField.resignFirstResponder()
		bottonText.resignFirstResponder()
	}
	
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

