import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class FiltersBottomSheet extends StatefulWidget {
  @override
  State<FiltersBottomSheet> createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {
  double _minPrice = 0;
  double _maxPrice = 200000;
  TextEditingController _minPriceController = TextEditingController();
  TextEditingController _maxPriceController = TextEditingController();

  List<String> selectedBrands = []; // To store selected brands

  List<String> allBrands = [
    'Brand A',
    'Brand B',
    'Brand C',
    // Add more brands here
  ];
  List<String> selectedCategory = []; // To store selected brands

  List<String> allCategory = [
    'Category A',
    'Category B',
    'Category C',
    // Add more brands here
  ];
  List<String> selectedVendor = []; // To store selected brands

  List<String> allVendors = [
    'Vendor A',
    'Vendor B',
    'Vendor C',
    // Add more brands here
  ];

  @override
  void initState() {
    super.initState();
    _minPriceController.text = _minPrice.toInt().toString();
    _maxPriceController.text = _maxPrice.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Range',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _minPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Low Range'),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _minPrice = double.parse(value);
                      });
                    }
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _maxPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Upper Range'),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _maxPrice = double.parse(value);
                        if (_maxPrice < _minPrice) {
                          _minPrice = _maxPrice;
                          _minPriceController.text =
                              _minPrice.toInt().toString();
                        }
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Select Price Range',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          RangeSlider(
            activeColor: Colors.amber,
            values: RangeValues(_minPrice, _maxPrice),
            min: 0,
            max: 200000,
            onChanged: (RangeValues values) {
              setState(() {
                _minPrice = values.start;
                _maxPrice = values.end;
              });
              _minPriceController.text = _minPrice.toInt().toString();
              _maxPriceController.text = _maxPrice.toInt().toString();
            },
          ),
          SizedBox(height: 16),
          Text(
            'Select Brands',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Column(
            children: allBrands.map((brand) {
              return CheckboxListTile(
                activeColor: Colors.amber,
                // checkColor: Colors.amberAccent,
                title: Text(brand),
                value: selectedBrands.contains(brand),
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 5.0 : 1.0;
                    if (value!) {
                      selectedBrands.add(brand);
                    } else {
                      selectedBrands.remove(brand);
                    }
                  });
                },
                // secondary: const Icon(Icons.hourglass_empty),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          Text(
            'Select Category',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Column(
            children: allVendors.map((brand) {
              return CheckboxListTile(
                activeColor: Colors.amber,
                checkColor: Colors.amberAccent,
                title: Text(brand),
                value: selectedVendor.contains(brand),
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 5.0 : 1.0;
                    if (value!) {
                      selectedVendor.add(brand);
                    } else {
                      selectedVendor.remove(brand);
                    }
                  });
                },
                // secondary: const Icon(Icons.hourglass_empty),
              );
            }).toList(),
          ),
          Text(
            'Select Vendor',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Column(
            children: allCategory.map((brand) {
              return CheckboxListTile(
                activeColor: Colors.amber,
                // checkColor: Colors.amberAccent,
                title: Text(brand),
                value: selectedCategory.contains(brand),
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 5.0 : 1.0;
                    if (value!) {
                      selectedCategory.add(brand);
                    } else {
                      selectedCategory.remove(brand);
                    }
                  });
                },
                // secondary: const Icon(Icons.hourglass_empty),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
