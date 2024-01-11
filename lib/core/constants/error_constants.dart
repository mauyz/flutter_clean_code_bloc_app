class ErrorConstants {
  static const errors = {
    "404": "No found",
    "500": "Server internal error",
  };
  const ErrorConstants._();

  static String getMessageFromCode(String code) {
    return errors[code] ?? "Unknown error";
  }
}
