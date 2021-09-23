String getInitials(String? name) {
  if (name == null) return "NA";
  List result = name.split(" ");

  return result[0][0] + result[1][0];
}
