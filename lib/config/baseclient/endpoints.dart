// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class EndPoints {
  static String LOGIN = '/api/auth/login';
  static String REGISTDER = "/api/auth/register";
  static String RESETPASSWORD = '/api/auth/forgot-password/reset-password';
  static String SENDOTP = "/api/auth/forgot-password/send-otp";
  static String VERIFY_OTP = "/api/auth/forgot-password/verify-otp";
  static String ONBOARDING = "/api/user/onboard";
/*  static const String LOGIN = "/api/auth/login";*/
  static const String GETPROPOSALS = "/api/projects";
  static const String ACCEPTPROPOSAL = "/api/proposal";

  static const String PROJECTS = "/api/projects";
  static const String FREELANCERS = "/api/auth/getAllFreelancers";
  static const String FILTER = "/api/projects/filter";
  static const String USERPROPOSALS = '/api/proposals/sent';
}
