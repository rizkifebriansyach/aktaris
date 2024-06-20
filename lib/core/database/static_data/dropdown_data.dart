class DropdownData {
  String? value;
  String? title;

  DropdownData({this.value, this.title});

  static List<DropdownData> getSortLocation() {
    return <DropdownData>[
      DropdownData(value: 'Lokasiku', title: 'Lokasimu'),
      DropdownData(value: 'jakarta', title: 'Jakarta'),
      DropdownData(value: 'bandung', title: 'Bandung'),
      DropdownData(value: 'bekasi', title: 'Bekasi'),
    ];
  }

  static List<DropdownData> getReligion() {
    return <DropdownData>[
      DropdownData(value: "islam", title: "Islam"),
      DropdownData(value: "kristen", title: "Kristen"),
      DropdownData(value: "konghucu", title: "Konghucu"),
      DropdownData(value: "hindu", title: "Hindu"),
      DropdownData(value: "buddha", title: "Buddha"),
    ];
  }

  static List<DropdownData> getMarriageStatus() {
    return <DropdownData>[
      DropdownData(value: 'menikah', title: 'Menikah'),
      DropdownData(value: 'belum menikah', title: 'Belum Menikah'),
      DropdownData(value: 'cerai', title: 'Cerai'),
      DropdownData(value: 'cerai mati', title: 'Cerai Mati'),
    ];
  }
}
