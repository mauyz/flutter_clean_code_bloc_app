class ErrorConstants {
  const ErrorConstants._();

  static const tokenInvalid = 401;
  static const dataIncorrect = 402;
  static const requestInvalid = 403;
  static const notFound = 404;
  static const alreadyInUse = 405;
  static const serverError = 500;
  static const connexionError = 505;
  static const inputIncorrect = 409;

  static const errorsMessageMap = {
    -1: "Unknown error",
    tokenInvalid: "Session expired",
    inputIncorrect: "Invalid username or password",
    dataIncorrect: "Invalid response",
    requestInvalid: "Invalid request",
    notFound: "No found",
    alreadyInUse: "The email is already in use",
    serverError: "Server internal error",
    connexionError: "Internet problem",
  };

  static String getMessageFromCode(int code) {
    return errorsMessageMap[code] ?? "Unknown error";
  }
}
