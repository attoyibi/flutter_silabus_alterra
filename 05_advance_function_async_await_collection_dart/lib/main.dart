void main() {
  int itemIdtofind = 12;
  // print(cari_via_id(stockData, itemIdtofind););
  cari_via_id(stockData, itemIdtofind);
}

List<Map> stockData = [];
void cari_via_id(data, itemId) {
  for (var item in data) {
    if (item['id'] == itemId) {
      print('Diskripsi barand ID $itemId: ${item['deskripsi']}');
    }
  }
}
