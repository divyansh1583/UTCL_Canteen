
UTCL-CANTEEN-APP

UTCL-Canteen is app to digitize the coupon system of ordering from canteen. The app aims to simplify the process and make it more convenient for employees.

**Tools Used:**

For the development of the app, I utilized Flutter and Dart, which provided a robust framework for creating the frontend. Additionally, Firebase was used as the backend platform to handle user authentication, data storage, and other necessary functionalities.

**Objective:**

The main objective of the UTCL-Canteen app is to create a user-friendly and easily accessible solution for the coupon system. By digitizing the process, employees can conveniently manage their coupons using their smartphones, eliminating the need for physical coupons or manual tracking.

**Frontend:**

The frontend of the app was developed using Flutter and Dart, enabling a seamless and visually appealing user interface. Upon launching the app, users are greeted with a simple sign-in/sign-up page, ensuring secure access to the coupon management system. The intuitive design and user-friendly interface make it easy for anyone with a smartphone to navigate and utilize the app effectively.


**Backend:**

To power the functionality of the UTCL-Canteen app, I integrated Firebase as the backend solution. Firebase provided a robust set of services that facilitated user authentication and data storage.

1. **Fire Authentication**

For the sign-in process, I leveraged Firebase Authentication, which allowed users to securely log in to the UTCL-Canteen app using their username and password. This ensured that only authorized individuals could access the coupon management system.



1. **Firestore Database:**

To store and manage the data associated with the app, I utilized Firebase Firestore, a flexible and scalable NoSQL document database. Firestore provided a real-time synchronization capability, enabling instant updates to the coupon-related information. This allowed for seamless tracking and management of coupons within the app.


1. **Result:**

When a user submits an order request through the UTCL-Canteen app, the backend system handles the request and initiates the process of sending an email to the canteen and the Head of the Department (HOD).

**Order Submission:**

Once the user, in this case, Divyansh from the IT department, selects the desired items and quantities in the app, they proceed to submit the order.

**Backend Processing:**

The backend of the app, integrated with Firebase, receives the order request. The relevant details, including the selected items and quantities, along with name and department, are retrieved from the Firestore database.

**Email Generation:**

Using the data obtained from the order submission, the backend system generates an email message with a predefined format. The email includes the details of the requested items.

E.g. Pakora (10), Samosa (10), and Tea (10).

**Sending the Email:**

The backend system utilizes a configured email service to send the generated email to the canteen's designated email address. Additionally, a copy of the email is also sent to the HOD's email address. The email contains the subject line "Canteen Order Request" to clearly indicate the purpose of the email.



