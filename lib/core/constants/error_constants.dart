class ErrorConstants {
  const ErrorConstants._();

  static const unknownError = -1;
  static const inputIncorrect = 401;
  static const dataIncorrect = 402;
  static const requestInvalid = 403;
  static const notFound = 404;
  static const alreadyInUse = 405;
  static const serverError = 500;
  static const connexionError = 505;

  static const errorsMessageMap = {
    unknownError: "Unknown error",
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