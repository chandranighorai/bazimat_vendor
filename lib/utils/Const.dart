class Const {
  static String appUrl =
      "https://dev.solutionsfinder.co.uk/newadminfood/api/v1/";
  static String loginUrl = appUrl + "auth/vendor/login";
  static String forgetPassword = appUrl + "auth/vendor/forgot-password";
  static String otpVerification = appUrl + "auth/vendor/verify-token";
  static String resetPassword = appUrl + "auth/vendor/reset-password";
  static String changePassword = appUrl + "vendor/update-profile";
  static String pendingOrder = appUrl + "vendor/current-orders";
  static String configResturent = appUrl + "config/restaurant";
  static String completedOrder = appUrl + "vendor/completed-orders";
  static String orderUpdate = appUrl + "vendor/update-order-status";
  static String dashboardHome = appUrl + "vendor/dashboard";
  static String updateFcm = appUrl + "vendor/update-fcm-token";
}
