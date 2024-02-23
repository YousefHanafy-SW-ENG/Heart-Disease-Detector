
# HeartApp: ECG-Based Heart Disease Detection

HeartApp leverages cutting-edge Flutter technology and AI to provide real-time heart disease detection using ECG signals from a Raspberry Pi device. Upon detecting potential heart disease symptoms, the app automatically sends an alert message with the user's current location to up to five emergency contacts, ensuring immediate assistance can be sought.

## Project Overview

This project integrates hardware signals, AI model analysis, and mobile technology to create a life-saving application. It's designed to work with specific hardware that collects ECG signals; these signals are then analyzed by a sophisticated AI model for heart disease symptoms. In case of a detected anomaly that suggests heart disease, the app utilizes the user's mobile device to send an emergency alert to predefined contacts along with the user's location.

## Features

- **ECG Signal Collection:** Integration with a Raspberry Pi device to collect ECG signals in real-time.
- **AI Disease Detection:** Utilizes an AI model to analyze ECG signals for potential heart disease.
- **Emergency Alerts:** Automatically sends an alert message to up to five emergency contacts with the user's current location when potential heart disease is detected.

## Getting Started

To get started with HeartApp, ensure you have Flutter installed on your development machine. This project also requires a Raspberry Pi configured to collect ECG signals.

### Prerequisites

- Flutter environment setup
- Raspberry Pi device with ECG signal collection setup
- Basic knowledge of Dart and Flutter development

### Installation

1. Clone the repository:
```
git clone https://github.com/yourgithubusername/heart_app_finallll.git
```

2. Navigate to the project directory:
```
cd heart_app_finallll
```

3. Install dependencies:
```
flutter pub get
```

4. Connect your device or emulator and run the project:
```
flutter run
```

## Configuration

To properly use HeartApp, you need to configure the application with the details of the emergency contacts and ensure the Raspberry Pi device is correctly sending ECG signals to the app. Detailed instructions on setting up the Raspberry Pi and configuring the app are available in the `docs` directory.

## Contribution

Your contributions are welcome! Please refer to the `CONTRIBUTING.md` for guidelines on how to propose bug fixes, features, or improvements.

## License

This project is licensed under the MIT License - see the `LICENSE.md` file for details.

## Acknowledgments

- HeartApp uses Flutter for mobile development. [Learn more about Flutter](https://docs.flutter.dev/)
- This project was inspired by the need for immediate response systems for individuals at risk of heart disease.
