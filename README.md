# unioulu-ips-community-app

## Description

**unioulu-ips-community-app** is a mobile application developed for the Information Processing Science (IPS) faculty at the University of Oulu. This app was created as part of an internship project under the supervision of the **INTERACT Research Group**.

The primary aim of this app is to enhance community engagement within the IPS faculty by offering a platform where students and faculty members can share posts, view announcements, and explore upcoming events.

### Key Features:
- **Community Posts**: A space where users can create and engage in posts, add comments, and participate in discussions.
- **Event Management**: Users can browse and explore upcoming events. The app displays the most recent 3 events prominently.
- **Announcements**: Faculty members can post important updates or news for the IPS community to stay informed.

This project is built using **Flutter** for the mobile frontend and **Appwrite** for backend services such as authentication, data storage, and real-time database interaction.

---

## Installation

To contribute to the **unioulu-ips-community-app**, follow these steps to set up the project locally on your machine. This guide will walk you through setting up the **Appwrite server** for backend services and **Flutter** for the mobile app.

### Prerequisites

Before you begin, make sure you have the following installed:

1. **Docker**: For running the Appwrite server.
2. **Flutter**: The mobile development framework.
3. **Git**: Version control to clone the repository.
4. **Visual Studio Code** or any preferred IDE.

---

### 1. Install and Set Up Appwrite (Self-Hosted)

We are using a self-hosted **Appwrite** instance. Follow the steps below to set up **Appwrite** on your machine using Docker.

#### Docker Installation

1. **Docker CLI**: Make sure you have Docker installed on your machine. You can download it from [Docker's official site](https://www.docker.com/products/docker-desktop).

#### Run the Appwrite Server

After installing Docker, run the following commands based on your OS:

**macOS and Linux:**

```bash```
```
docker run -it --rm \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume "$(pwd)"/appwrite:/usr/src/code/appwrite:rw \
    --entrypoint="install" \
    appwrite/appwrite:1.5.10
```
**Windows:**

```CMD```
```
docker run -it --rm ^
    --volume //var/run/docker.sock:/var/run/docker.sock ^
    --volume "%cd%"/appwrite:/usr/src/code/appwrite:rw ^
    --entrypoint="install" ^
    appwrite/appwrite:1.5.10
```
```PowerShell```
```
docker run -it --rm `
    --volume /var/run/docker.sock:/var/run/docker.sock `
    --volume ${pwd}/appwrite:/usr/src/code/appwrite:rw `
    --entrypoint="install" `
    appwrite/appwrite:1.5.10
```
For detailed instructions, refer to the [Appwrite self-hosting documentation](https://appwrite.io/docs/advanced/self-hosting) or watch the [YouTube tutorial](https://youtu.be/aO4mw8smXkI?si=8qp5IWHNkY-74J5v).

---
### 2. Install Flutter

Once Appwrite is set up, the next step is to install **Flutter** on your machine. Follow the official Flutter installation guide for your operating system:

- **Flutter Installation Guide**: [Get Started with Flutter](https://docs.flutter.dev/get-started/install)
- **YouTube Tutorial** for Windows: [Install Flutter on Windows](https://youtu.be/VFDbZk2xhO4?si=n3k9nqJ2sa8kIxi4)
- **YouTube Tutorial** for macOS: [Install Flutter on macOS](https://youtu.be/KdO9B_CZmzo?si=iYMvJ0ao_HHwKhfq)

#### Verify Installation

After installing Flutter, verify that Flutter and Dart have been installed successfully by running the following command in your terminal:

```bash
flutter doctor
```
This command will display any missing dependencies or issues that need to be resolved before proceeding. Make sure to resolve any issues if prompted.

---
### 3. Install Git

To manage your code and collaborate with other contributors, you'll need to install Git.

- [Download Git](https://git-scm.com/downloads)

Follow the instructions for your operating system to complete the installation.

---

### 4. Install an IDE

We recommend using Visual Studio Code (VS Code) for development, but you can use any IDE of your choice.

- [Download VS Code](https://code.visualstudio.com/download)

After downloading and installing VS Code, make sure to install the necessary extensions for Flutter and Dart for a smooth development experience.

---

### 5. Clone the Project

Once you have Git installed, you can clone the project repository to your local machine.

1. Open your terminal or command prompt.
2. Navigate to the directory where you want to store the project.
3. Run the following command to clone the repository:

```bash
git clone https://github.com/salscoding/unioulu-ips-community-app.git
```

---

### 6. Set Up the Project

After cloning the project, follow these steps:

1. Navigate to the project directory:

```bash
cd unioulu-ips-community-app
```

2. Fetch all the dependencies required for the project by running:

```bash
flutter pub get
```

---

### 7. Run the Application

Now, you can run the Flutter app on your preferred device or emulator. Ensure your device is connected or the emulator is running, then use the following command:

```bash
flutter run
```

This will build and launch the app on the connected device or emulator.

---

For further assistance with running or debugging the project, please refer to the official Flutter documentation or check the project's issue tracker on GitHub.
