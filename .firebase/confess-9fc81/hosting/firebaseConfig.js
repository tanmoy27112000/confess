// Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/10.4.0/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.4.0/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyAkLXixpR2W3B1zEo5xVjmgUq63NXezmA0",
    authDomain: "confeife.firebaseapp.com",
    projectId: "confeife",
    storageBucket: "confeife.appspot.com",
    messagingSenderId: "642988925358",
    appId: "1:642988925358:web:9777befbe4f90a6c4e283f",
    measurementId: "G-SN9ZCRNQCT"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);