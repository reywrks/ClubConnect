//
//  ConfirmationViewController.swift
//  ClubConnect
//
//  Created by CEZAR REY BALLAD on 10/7/26.
//

import UIKit

class ConfirmationViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!

    // Defaults keep this screen meaningful even before registration data arrives.
    var studentName: String = "Club Member"
    var wantsReminders: Bool = false
    var selectedRole: String = "Member"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the title shown in the navigation bar.
        title = "Confirmation"
        navigationItem.largeTitleDisplayMode = .never

        // prepare(for:sender:) sets these properties before this view is loaded.
        let reminderStatus = wantsReminders ? "ON" : "OFF"
        messageLabel.text = """
        Thanks, \(studentName)!

        You joined Camp Club as a \(selectedRole).

        Meeting reminders: \(reminderStatus).
        """
    }
}
