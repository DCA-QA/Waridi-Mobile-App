import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/filter-provider.dart';

class ProductFilters {
  double minPrice;
  double maxPrice;
  List<String> selectedBrands;
  List<String> selectedCategories;
  List<String> selectedVendors;

  ProductFilters({
    required this.minPrice,
    required this.maxPrice,
    required this.selectedBrands,
    required this.selectedCategories,
    required this.selectedVendors,
  });
}

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
    'Nike',
    'Adidas',
    'Apple',
    'Samsung',
    'Sony',
    'Coca-Cola',
    'AmazonBasics',
    "L'Oréal",
    'Rolex',
    'Dior'
  ];

  List<String> selectedCategory = []; // To store selected brands

  List<String> allCategory = [
    'Jewelery',
    'electronics',
    "women's clothing",
    "men's clothing",
    // Add more categories here
  ];

  List<String> selectedVendor = []; // To store selected brands

  List<String> allVendors = [
    'Wasili sellers',
    "Trendy Threads Clothing",
    "Masterpiece Art Gallery",
    "Happy Paws Pet Store",
    "Star Auto Repairs",
    "Garden Delights Nursery",
    "TechWizards IT Services",
    "Luxury Living Furniture",
    "Timeless Jewelry Emporium"
    // Add more brands here
  ];

  @override
  void initState() {
    super.initState();
    _minPriceController.text = _minPrice.toInt().toString();
    _maxPriceController.text = _maxPrice.toInt().toString();
    // loadSavedFilters();
  }

  // Method to save filters in SharedPreferences
  Future<void> saveFilters() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('minPrice', _minPrice);
    await prefs.setDouble('maxPrice', _maxPrice);
    await prefs.setStringList('selectedBrands', selectedBrands);
    await prefs.setStringList('selectedCategory', selectedCategory);
    await prefs.setStringList('selectedVendor', selectedVendor);
  }

  // Method to load saved filters from SharedPreferences
  Future<void> loadSavedFilters() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _minPrice = prefs.getDouble('minPrice') ?? 0;
      _maxPrice = prefs.getDouble('maxPrice') ?? 200000;
      selectedBrands = prefs.getStringList('selectedBrands') ?? [];
      selectedCategory = prefs.getStringList('selectedCategory') ?? [];
      selectedVendor = prefs.getStringList('selectedVendor') ?? [];
    });
    _minPriceController.text = _minPrice.toStringAsFixed(2);
    _maxPriceController.text = _maxPrice.toStringAsFixed(2);
  }

  // Method to clear saved filters
  

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);
    ProductFilters filters = ProductFilters(
      minPrice: _minPrice,
      maxPrice: _maxPrice,
      selectedBrands: selectedBrands,
      selectedCategories: selectedCategory,
      selectedVendors: selectedVendor,
    );
    debugPrint(filters.maxPrice.toString());
    debugPrint(filters.minPrice.toString());
    debugPrint(filters.selectedBrands.toList().toString());
    debugPrint(filters.selectedCategories.toList().toString());
    debugPrint(filters.selectedVendors.toList().toString());
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
            children: allCategory.map((brand) {
              return CheckboxListTile(
                activeColor: Colors.amber,
                checkColor: Colors.amberAccent,
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
          Text(
            'Select Vendor',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Column(
            children: allVendors.map((brand) {
              return CheckboxListTile(
                activeColor: Colors.amber,
                // checkColor: Colors.amberAccent,
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
          ElevatedButton(
            onPressed: () async {
              // Save filters to SharedPreferences
              // await saveFilters();
              filterProvider.updateFilters(
                _minPrice,
                _maxPrice,
                selectedBrands,
                selectedCategory,
                selectedVendor,
              );
              // Close the bottom sheet
              Navigator.of(context).pop();
            },
            child: Text('Apply Filters'),
          )
        ],
      ),
    );
  }
}
