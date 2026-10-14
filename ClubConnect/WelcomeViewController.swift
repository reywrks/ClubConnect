import UIKit

class WelcomeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var roleSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Camp Club"
        // The storyboard uses a preview title; the actual title is set here.
        titleLabel.text = "Camp Club"
        navigationItem.largeTitleDisplayMode = .never

        roleSegmentedControl.selectedSegmentIndex = 0
        nameTextField.delegate = self
        nameTextField.accessibilityLabel = "Student name"
        reminderSwitch.accessibilityLabel = "Meeting reminders"
        roleSegmentedControl.accessibilityLabel = "Club role"
    }

    @IBAction func joinButtonTapped(_ sender: UIButton) {
        // Dismiss the keyboard before the manual Show segue begins.
        nameTextField.resignFirstResponder()
        performSegue(
            withIdentifier: "ShowConfirmationSegue",
            sender: self
        )
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Only configure the expected destination for this particular segue.
        guard segue.identifier == "ShowConfirmationSegue",
              let destination = segue.destination as? ConfirmationViewController else {
            return
        }

        // UITextField.text is optional. Treat nil, blank, and spaces as no name.
        let enteredName = (nameTextField.text ?? "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        destination.studentName = enteredName.isEmpty ? "Club Member" : enteredName
        destination.wantsReminders = reminderSwitch.isOn
        destination.selectedRole = roleSegmentedControl.selectedSegmentIndex == 1
            ? "Officer" : "Member"
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Done also closes the keyboard when it covers the Join button.
        textField.resignFirstResponder()
        return true
    }
}
