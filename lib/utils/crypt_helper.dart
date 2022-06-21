import 'dart:convert';
import 'dart:typed_data';

String encryp(String str) {
  return base64.encode(convertCodeUnitsToUnicodeByteArray(utf8.encode(str)));
}

String decryp(String str) {
  return utf8.decode(base64.decode(str));
}

List<int> convertCodeUnitsToUnicodeByteArray(List<int> codeUnits) {
  var buffer = Uint8List(codeUnits.length * 2).buffer;
  var bdata = ByteData.view(buffer);
  int pos = 0;
  for (int val in codeUnits) {
    bdata.setInt16(pos, val, Endian.little);
    pos += 2;
  }
  return bdata.buffer.asUint8List();
}
