import 'dart:io';


class Constants {
  static const List<Map<String, String>> categories = [
    {'image': 'assets/images/phone.png', 'title': 'Phones &\nLaptops'},
    {'image': 'assets/images/car.png', 'title': 'Cars'},
    {
      'image': 'assets/images/property.png',
      'title': 'Property for\n Sale & Rent'
    },
    {'image': 'assets/images/bike.png', 'title': 'Bikes'},
    {'image': 'assets/images/electronics.png', 'title': 'Electronics'},
    {'image': 'assets/images/heavy_vehicle.png', 'title': 'Heavy Vehicles'},
    {'image': 'assets/images/jobs.png', 'title': 'Jobs'},
    {'image': 'assets/images/services.png', 'title': 'Services'},
    {'image': 'assets/images/furniture.png', 'title': 'Furniture'},
    {'image': 'assets/images/books.png', 'title': 'Books &\nStationary'},
    {'image': 'assets/images/animals.png', 'title': 'Animals'},
    {'image': 'assets/images/cosmetics.png', 'title': 'Cosmetics &\nLifestyle'},
  ];

  static const Map<String, String> fieldTypes = {
    'title': 'String',
    'description': 'String',
    'price': 'double',
    'bedrooms': 'int',
    'bathrooms': 'int',
    'floor': 'int',
    'garden': 'boolean',
    'inCorner': 'boolean',
    'frameSize': 'double',
    'wheelSize': 'double',
    'deliverable': 'boolean',
    'boxIncluded': 'boolean',
    'condition': 'String',
    'area': 'double',
    'yearBuilt': 'int',
    'fuelType': 'String',
    'mileage': 'double',
    'transmission': 'String',
    'engineSize': 'double',
    'color': 'String',
    'weight': 'double',
    'brand': 'String',
    'model': 'String',
    'serialNumber': 'String',
    'warranty': 'boolean',
    'madeIn': 'String',
    'material': 'String',
    'isNew': 'boolean',
    'capacity': 'int',
    'power': 'double',
    'dimensions': 'String',
    'ports': 'int',
    'screenSize': 'double',
    'ram': 'int',
    'storage': 'int',
    'camera': 'String',
    'battery': 'double',
    'os': 'String',
    'network': 'String',
    'type': 'String',
    'weightCapacity': 'double',
    'voltage': 'double',
    'frequency': 'double',
    'powerConsumption': 'double',
    'connectivity': 'String',
    'supportedFormats': 'String',
    'releaseDate': 'String',
    'modelNumber': 'String',
    'features': 'String',
    'extraDetails': 'String',
    'availability': 'boolean',
    'shipping': 'boolean',
    'deliveryTime': 'int',
    'installation': 'boolean',
    'maintenance': 'boolean',
    'partsIncluded': 'boolean',
    'userManual': 'boolean',
    'compatibility': 'String',
    'age': 'int',
    'processor': 'String',
    'graphicsCard': 'String',
    'make': 'String',
    'sell/Rent': 'String',
    'industry': 'String',
    'qualification': 'String',
    'skills': 'String',
    'location': 'String',
    'projectDuration': 'String',
    'size': 'String',
    'author': 'String',
    'genre': 'String',
    'pages': 'String',
    'subject': 'String',
    'species': 'String',
    'shade': 'String',
    'skinType': 'String',
    'hairType': 'String',
    'scent': 'String',
    'furnished': 'boolean',
    'smartTv': 'boolean',
    'wireless': 'boolean',
    'lensIncluded': 'boolean',
    'vaccinated': 'boolean',
    'pedigree': 'boolean',
    'year': 'int',
    'parkingSpaces': 'boolean',
    'seatingCapacity': 'int',
    'duration': 'int',
    'batteryCapacity': 'double',
    'range': 'double',
    'resolution': 'double',
    'powerOutput': 'double',
  };

  static const Map<String, Map<String, String>> filters = {
    'Phones & Laptops': {
      'Samsung': 'brand',
      'Asus': 'brand',
      'HP': 'brand',
      'Oppo': 'brand',
      'Apple': 'brand',
      'Xiaomi': 'brand',
      'Huawei': 'brand',
      'New': 'condition',
      'Old': 'condition',
      'Price': 'price',
    },
    'Cars': {
      'Toyota': 'brand',
      'Honda': 'brand',
      'BMW': 'brand',
      'Mercedes': 'brand',
      'Ford': 'brand',
      'Hyundai': 'brand',
      'Nissan': 'brand',
      'New': 'condition',
      'Old': 'condition',
      'Price': 'price',
    },
    'Property for Rent & Sell': {
      'House': 'type',
      'Apartment': 'type',
      'Office': 'type',
      'Square Feet': 'area',
      'Marla': 'area',
      'Bedrooms': 'bedrooms',
      'Bathrooms': 'bathrooms',
      'New': 'condition',
      'Old': 'condition',
      'Price': 'price',
    },
    'Bikes': {
      'Mountain Bikes': 'type',
      'Road Bikes': 'type',
      'Hybrid Bikes': 'type',
      'Electric Bikes': 'type',
      'New': 'condition',
      'Old': 'condition',
      'Price': 'price',
    },
    'Electronics': {
      'TVs': 'type',
      'Home Audio': 'type',
      'Cameras': 'type',
      'Gaming Consoles': 'type',
      'Kitchen Appliances': 'type',
      'New': 'condition',
      'Old': 'condition',
      'Price': 'price',
    },
    'Heavy Vehicle': {
      'Trucks': 'type',
      'Buses': 'type',
      'Construction Equipment': 'type',
      'Agricultural Machinery': 'type',
      'New': 'condition',
      'Old': 'condition',
      'Price': 'price',
    },
    'Jobs': {
      'Full-Time': 'jobType',
      'Part-Time': 'jobType',
      'Internships': 'jobType',
      'Freelance': 'jobType',
      'Remote': 'jobType',
      'Price': 'salary', // You might want to use salary here instead of price.
    },
    'Services': {
      'Home Services': 'serviceType',
      'Repair Services': 'serviceType',
      'Health & Wellness': 'serviceType',
      'Education & Coaching': 'serviceType',
      'Event Services': 'serviceType',
      'Price': 'price',
    },
    'Furniture': {
      'Sofas': 'type',
      'Beds': 'type',
      'Tables': 'type',
      'Chairs': 'type',
      'Wardrobes': 'type',
      'New': 'condition',
      'Old': 'condition',
      'Price': 'price',
    },
    'Books & Stationary': {
      'Books': 'type',
      'Notebooks': 'type',
      'Office Supplies': 'type',
      'Art Supplies': 'type',
      'Stationary': 'type',
      'New': 'condition',
      'Old': 'condition',
      'Price': 'price',
    },
    'Animals': {
      'Dogs': 'animalType',
      'Cats': 'animalType',
      'Birds': 'animalType',
      'Fish': 'animalType',
      'Accessories': 'type',
      'Price': 'price',
    },
    'Cosmetics & Styles': {
      'Makeup': 'type',
      'Skincare': 'type',
      'Haircare': 'type',
      'Fragrances': 'type',
      'Nail Care': 'type',
      'New': 'condition',
      'Old': 'condition',
      'Price': 'price',
    },
  };
  static const Map<String, double> maxPriceMap = {
    'Phones & Laptops': 1000000.0, // PKR
    'Cars': 10000000.0, // PKR
    'Property for Rent & Sell': 50000000.0, // PKR
    'Bikes': 500000.0, // PKR
    'Electronics': 200000.0, // PKR
    'Heavy Vehicle': 15000000.0, // PKR
    'Jobs': 100000.0, // PKR
    'Services': 50000.0, // PKR
    'Furniture': 200000.0, // PKR
    'Books & Stationary': 5000.0, // PKR
    'Animals': 50000.0, // PKR
    'Cosmetics & Styles': 50000.0 // PKR
  };

  // static Map<String, RxList<Product>?> allControllers = {
  //   'Phones & Laptops': productCntr.mobilePhones,
  //   'Cars': productCntr.cars,
  //   'Property for Rent & Sell': productCntr.propertyForRentAndSell,
  //   'Bikes': productCntr.bikes,
  //   'Electronics': productCntr.electronics,
  //   'Heavy Vehicle': productCntr.heavyVehicles,
  //   'Jobs': productCntr.jobs,
  //   'Services': productCntr.services,
  //   'Furniture': productCntr.furniture,
  //   'Books & Stationary': productCntr.booksAndStationary,
  //   'Animals': productCntr.animals,
  //   'Cosmetics & Styles': productCntr.cosmeticsAndStyles,
  // };

  static const List<String> categoryList = [
    'Phones & Laptops',
    'Cars',
    'Property for Rent & Sell',
    'Bikes',
    'Electronics',
    'Heavy Vehicle',
    'Jobs',
    'Services',
    'Furniture',
    'Books & Stationary',
    'Animals',
    'Cosmetics & Styles',
  ];

  static const Map<String, List<String>> subCategories = {
    'Phones & Laptops': [
      'Mobile Phones',
      'Laptops',
      'Tablets',
      'Accessories',
      'Wearables',
    ],
    'Cars': [
      'Sedans',
      'SUVs',
      'Trucks',
      'Motorcycles',
      'Spare Parts',
    ],
    'Property for Rent & Sell': [
      'Houses',
      'Apartments',
      'Offices',
      'Shops',
      'Land',
    ],
    'Bikes': [
      'Mountain Bikes',
      'Road Bikes',
      'Hybrid Bikes',
      'Electric Bikes',
      'Accessories',
    ],
    'Electronics': [
      'TVs',
      'Home Audio',
      'Cameras',
      'Kitchen Appliances',
      'Gaming Consoles',
    ],
    'Heavy Vehicle': [
      'Trucks',
      'Buses',
      'Construction Equipment',
      'Agricultural Machinery',
      'Parts',
    ],
    'Jobs': [
      'Full-Time',
      'Part-Time',
      'Internships',
      'Freelance',
      'Remote',
    ],
    'Services': [
      'Home Services',
      'Repair Services',
      'Health & Wellness',
      'Education & Coaching',
      'Event Services',
    ],
    'Furniture': [
      'Sofas',
      'Beds',
      'Tables',
      'Chairs',
      'Wardrobes',
    ],
    'Books & Stationary': [
      'Books',
      'Notebooks',
      'Office Supplies',
      'Art Supplies',
      'Stationary',
    ],
    'Animals': [
      'Dogs',
      'Cats',
      'Birds',
      'Fish',
      'Accessories',
    ],
    'Cosmetics & Styles': [
      'Makeup',
      'Skincare',
      'Haircare',
      'Fragrances',
      'Nail Care',
    ],
  };

  static const Map<String, List<String>> subcategoryAttributes = {
    'Mobile Phones': [
      'brand',
      'model',
      'storage',
      'color',
      'warranty',
      'condition', // New, Used
      'boxIncluded',
      'deliverable',
    ],
    'Laptops': [
      'brand',
      'model',
      'processor',
      'ram',
      'storage',
      'graphicsCard',
      'warranty',
      'condition', // New, Used
      'boxIncluded',
      'deliverable',
    ],
    'Tablets': [
      'brand',
      'model',
      'storage',
      'screenSize',
      'warranty',
      'condition', // New, Used
      'boxIncluded',
      'deliverable',
    ],
    'Phone Accessories': [
      'type', // e.g., charger, case, etc.
      'brand',
      'compatibility', // e.g., iPhone, Samsung, etc.
      'condition', // New, Used
      'deliverable',
    ],
    'Wearables': [
      'brand',
      'model',
      'type', // e.g., smartwatch, fitness band
      'warranty',
      'condition', // New, Used
      'boxIncluded',
      'deliverable',
    ],
    'Sedans': [
      'make',
      'model',
      'year',
      'mileage',
      'fuelType', // Petrol, Diesel, Electric
      'transmission', // Automatic, Manual
      'color',
      'condition', // New, Used
      'deliverable',
    ],
    'SUVs': [
      'make',
      'model',
      'year',
      'mileage',
      'fuelType',
      'transmission',
      'color',
      'condition', // New, Used
      'deliverable',
    ],
    'Motorcycles': [
      'make',
      'model',
      'year',
      'mileage',
      'fuelType',
      'color',
      'condition', // New, Used
      'deliverable',
    ],
    'Spare Parts': [
      'type', // e.g., engine, brakes, etc.
      'brand',
      'compatibility', // e.g., Toyota, Honda, etc.
      'condition', // New, Used
      'deliverable',
    ],
    'Houses': [
      'bedrooms',
      'bathrooms',
      'area', // in square feet
      // True/False
      'yearBuilt',
      'furnished',
      'parkingSpaces',
      'garden', // True/False
      'condition',
      'sell/Rent',
      'inCorner' // Rent, Sale
    ],
    'Apartments': [
      'bedrooms',
      'bathrooms',
      'area', // in square feet

      'floor',
      'furnished',
      'parkingSpaces',
      'condition',
      'sell/Rent',
      'inCorner' // Rent, Sale
    ],
    'Offices': [
      'area', // in square feet

      'floor',
      'parkingSpaces',
      'furnished',
      'condition',
      'sell/Rent',
      'inCorner' // Rent, Sale
    ],
    'Shops': [
      'area', // in square feet
      'furnished',
      'parkingSpaces',
      'condition',
      'sell/Rent',
      'inCorner' // Rent, Sale
    ],
    'Land': [
      'area', // in square feet
      'type', // Commercial, Residential, Agricultural
      'condition',
      'sell/Rent',
      'inCorner' // Rent, Sale
    ],
    'Mountain Bikes': [
      'brand',
      'model',
      'frameSize',
      'wheelSize',
      'type', // e.g., hardtail, full suspension
      'condition', // New, Used
      'deliverable',
    ],
    'Road Bikes': [
      'brand',
      'model',
      'frameSize',
      'wheelSize',
      'type', // e.g., racing, touring
      'condition', // New, Used
      'deliverable',
    ],
    'Hybrid Bikes': [
      'brand',
      'model',
      'frameSize',
      'wheelSize',
      'type', // e.g., commuter, fitness
      'condition', // New, Used
      'deliverable',
    ],
    'Electric Bikes': [
      'brand',
      'model',
      'batteryCapacity', // in Ah
      'range', // in km
      'condition', // New, Used
      'deliverable',
    ],
    'TVs': [
      'brand',
      'screenSize', // in inches
      'resolution', // e.g., 4K, 1080p
      'smartTv', // True/False
      'warranty',
      'condition', // New, Used
      'deliverable',
    ],
    'Home Audio': [
      'brand',
      'type', // e.g., speakers, soundbars
      'powerOutput', // in watts
      'wireless', // True/False
      'warranty',
      'condition', // New, Used
      'deliverable',
    ],
    'Cameras': [
      'brand',
      'model',
      'type', // e.g., DSLR, Mirrorless
      'resolution', // in MP
      'lensIncluded', // True/False
      'warranty',
      'condition', // New, Used
      'deliverable',
    ],
    'Kitchen Appliances': [
      'brand',
      'type', // e.g., fridge, microwave, etc.
      'capacity', // in liters
      'energyRating', // e.g., 5 star
      'warranty',
      'condition', // New, Used
      'deliverable',
    ],
    'Gaming Consoles': [
      'brand',
      'model',
      'storage', // in GB
      'condition', // New, Used
      'warranty',
      'deliverable',
    ],
    'Trucks': [
      'make',
      'model',
      'year',
      'mileage',
      'fuelType',
      'transmission',
      'capacity', // Load capacity in tons
      'condition', // New, Used
      'deliverable',
    ],
    'Buses': [
      'make',
      'model',
      'year',
      'mileage',
      'fuelType',
      'transmission',
      'seatingCapacity',
      'condition', // New, Used
      'deliverable',
    ],
    'Construction Equipment': [
      'type', // e.g., excavator, bulldozer
      'make',
      'model',
      'year',
      'mileage',
      'fuelType',
      'condition', // New, Used
      'deliverable',
    ],
    'Agricultural Machinery': [
      'type', // e.g., tractor, harvester
      'make',
      'model',
      'year',
      'mileage',
      'fuelType',
      'condition', // New, Used
      'deliverable',
    ],
    'Parts': [
      'type', // e.g., engine, transmission
      'brand',
      'compatibility', // e.g., make, model
      'condition', // New, Used
      'deliverable',
    ],
    'Full-Time': [
      'industry', // e.g., IT, Finance
      'experience', // in years
      'qualification',
      'skills',
      'location',
    ],
    'Part-Time': [
      'industry',
      'experience',
      'qualification',
      'skills',
      'location',
    ],
    'Internships': [
      'industry',
      'duration', // in months
      'qualification',
      'skills',
      'location',
    ],
    'Freelance': [
      'industry',
      'skills',
      'experience',
      'projectDuration', // in weeks or months
      'location',
    ],
    'Remote': [
      'industry',
      'skills',
      'experience',
      'qualification',
      'location', // Can be "Remote"
    ],
    'Home Services': [
      'type', // e.g., cleaning, plumbing
      'experience', // in years
      'location',
    ],
    'Repair Services': [
      'type', // e.g., electronics, vehicles
      'experience', // in years
      'location',
    ],
    'Health & Wellness': [
      'type', // e.g., yoga, physiotherapy
      'experience', // in years
      'qualification',
      'location',
    ],
    'Education & Coaching': [
      'subject', // e.g., math, science
      'experience', // in years
      'qualification',
      'location',
    ],
    'Event Services': [
      'type', // e.g., photography, catering
      'experience', // in years
      'location',
    ],
    'Sofas': [
      'brand',
      'material', // e.g., leather, fabric
      'seatingCapacity',
      'condition', // New, Used
      'deliverable',
    ],
    'Beds': [
      'brand',
      'material', // e.g., wood, metal
      'size', // e.g., single, queen, king
      'condition', // New, Used
      'deliverable',
    ],
    'Tables': [
      'brand',
      'material', // e.g., wood, glass
      'type', // e.g., dining, coffee
      'condition', // New, Used
      'deliverable',
    ],
    'Chairs': [
      'brand',
      'material', // e.g., wood, metal, plastic
      'type', // e.g., dining, office
      'condition', // New, Used
      'deliverable',
    ],
    'Wardrobes': [
      'brand',
      'material', // e.g., wood, metal
      'size', // e.g., 2-door, 3-door
      'condition', // New, Used
      'deliverable',
    ],
    'Books': [
      'title',
      'author',
      'genre',
      'condition', // New, Used
      'deliverable',
    ],
    'Notebooks': [
      'brand',
      'size', // e.g., A4, A5
      'pages',
      'type', // e.g., ruled, plain
      'deliverable',
    ],
    'Office Supplies': [
      'type', // e.g., pens, paper
      'brand',
      'deliverable',
    ],
    'Art Supplies': [
      'type', // e.g., paints, brushes
      'brand',
      'deliverable',
    ],
    'Stationary': [
      'type', // e.g., pens, pencils
      'brand',
      'deliverable',
    ],
    'Dogs': [
      'breed',
      'age', // in months or years
      'vaccinated', // True/False
      'pedigree', // For Sale, Adoption
    ],
    'Cats': [
      'breed',
      'age',
      'vaccinated', // True/False
      'pedigree', // For Sale, Adoption
    ],
    'Birds': [
      'species',
      'age',
      'vaccinated', // For Sale, Adoption
    ],
    'Fish': [
      'species',
      'age', // For Sale, Adoption
    ],
    'Accessories': [
      'type', // e.g., leashes, cages
      'brand',
      'compatibility', // e.g., dog, cat, etc.
      'deliverable',
    ],
    'Makeup': [
      'brand',
      'type', // e.g., foundation, lipstick
      'shade', // e.g., light, medium, dark
      'warranty',
      'condition', // New, Used
      'deliverable',
    ],
    'Skincare': [
      'brand',
      'type', // e.g., moisturizer, cleanser
      'skinType', // e.g., oily, dry
      'warranty',
      'condition', // New, Used
      'deliverable',
    ],
    'Haircare': [
      'brand',
      'type', // e.g., shampoo, conditioner
      'hairType', // e.g., curly, straight
      'warranty',
      'condition', // New, Used
      'deliverable',
    ],
    'Fragrances': [
      'brand',
      'type', // e.g., perfume, cologne
      'scent', // e.g., floral, woody
      'warranty',
      'condition', // New, Used
      'deliverable',
    ],
    'Nail Care': [
      'brand',
      'type', // e.g., polish, remover
      'shade', // e.g., red, pink
      'warranty',
      'condition', // New, Used
      'deliverable',
    ],
  };
  static const Map<String, Map<String, List<String>>> dropdownOptions = {
    'Mobile Phones': {
      'brand': ['Samsung', 'iPhone', 'Huawei', 'Oppo', 'Other'],
      'model': ['Galaxy S21', 'iPhone 13', 'Mate 40', 'Find X3', 'Other'],
      'color': ['Black', 'White', 'Blue', 'Red', 'Other'],
      'storage': ['64GB', '128GB', '256GB', '512GB', 'Other'],
      'condition': ['New', 'Used'],
    },
    'Laptops': {
      'brand': ['Dell', 'HP', 'Apple', 'Lenovo', 'Other'],
      'model': ['XPS 13', 'Spectre x360', 'MacBook Pro', 'ThinkPad', 'Other'],
      'processor': ['Intel i7', 'Intel i5', 'AMD Ryzen 5', 'M1', 'Other'],
      'storage': ['256GB SSD', '512GB SSD', '1TB SSD', 'Other'],
      'ram': ['8GB', '16GB', '32GB', 'Other'],
      'condition': ['New', 'Used'],
    },
    'Tablets': {
      'brand': ['Samsung', 'Apple', 'Huawei', 'Lenovo', 'Other'],
      'model': ['Galaxy Tab', 'iPad', 'MatePad', 'Yoga Tab', 'Other'],
      'storage': ['64GB', '128GB', '256GB', '512GB', 'Other'],
      'screenSize': ['7 inch', '8 inch', '10 inch', '12 inch', 'Other'],
      'condition': ['New', 'Used'],
    },
    'Phone Accessories': {
      'type': ['Charger', 'Case', 'Screen Protector', 'Cable', 'Other'],
      'brand': ['Samsung', 'Apple', 'Huawei', 'Oppo', 'Other'],
      'compatibility': ['iPhone', 'Samsung Galaxy', 'Huawei', 'Oppo', 'Other'],
      'condition': ['New', 'Used'],
    },
    'Wearables': {
      'brand': ['Apple', 'Samsung', 'Fitbit', 'Garmin', 'Other'],
      'model': [
        'Apple Watch',
        'Galaxy Watch',
        'Fitbit Versa',
        'Garmin Fenix',
        'Other'
      ],
      'type': ['Smartwatch', 'Fitness Band', 'Other'],
      'condition': ['New', 'Used'],
    },
    'Sedans': {
      'make': ['Toyota', 'Honda', 'BMW', 'Ford', 'Other'],
      'model': ['Corolla', 'Civic', 'Camry', 'Accord', 'Other'],
      'color': ['Black', 'White', 'Silver', 'Blue', 'Other'],
      'fuelType': ['Petrol', 'Diesel', 'Electric', 'Hybrid', 'Other'],
      'transmission': ['Automatic', 'Manual'],
      'condition': ['New', 'Used'],
    },
    'SUVs': {
      'make': ['Toyota', 'Honda', 'Ford', 'BMW', 'Other'],
      'model': ['RAV4', 'CR-V', 'Explorer', 'X5', 'Other'],
      'color': ['Black', 'White', 'Silver', 'Blue', 'Other'],
      'fuelType': ['Petrol', 'Diesel', 'Electric', 'Hybrid', 'Other'],
      'transmission': ['Automatic', 'Manual'],
      'condition': ['New', 'Used'],
    },
    'Motorcycles': {
      'make': ['Honda', 'Yamaha', 'Suzuki', 'Harley-Davidson', 'Other'],
      'model': ['CBR500', 'MT-07', 'GSX-R', 'Sportster', 'Other'],
      'color': ['Black', 'White', 'Red', 'Blue', 'Other'],
      'fuelType': ['Petrol', 'Electric', 'Hybrid'],
      'condition': ['New', 'Used'],
    },
    'Spare Parts': {
      'type': ['Engine', 'Transmission', 'Brakes', 'Suspension', 'Other'],
      'brand': ['Bosch', 'Denso', 'Valeo', 'Other'],
      'compatibility': ['Toyota', 'Honda', 'Ford', 'BMW', 'Other'],
      'condition': ['New', 'Used'],
    },
    'Houses': {
      'condition': ['New', 'Used', 'Renovated'],
      'sell/Rent': ['For Sale', 'For Rent'],
    },
    'Apartments': {
      'condition': ['New', 'Used', 'Renovated'],
      'sell/Rent': ['For Sale', 'For Rent'],
    },
    'Offices': {
      'condition': ['New', 'Used'],
      'sell/Rent': ['For Sale', 'For Rent'],
    },
    'Shops': {
      'condition': ['New', 'Used'],
      'sell/Rent': ['For Sale', 'For Rent'],
    },
    'Land': {
      'type': ['Residential', 'Commercial', 'Agricultural'],
      'condition': ['New', 'Used'],
      'sell/Rent': ['For Sale', 'For Rent'],
    },
    'Mountain Bikes': {
      'brand': ['Trek', 'Specialized', 'Giant', 'Cannondale', 'Other'],
      'model': ['Fuel EX', 'Stumpjumper', 'Trance', 'Habit', 'Other'],
      'type': ['Hardtail', 'Full Suspension'],
      'condition': ['New', 'Used'],
    },
    'Road Bikes': {
      'brand': ['Trek', 'Specialized', 'Cannondale', 'BMC', 'Other'],
      'model': ['Domane', 'Roubaix', 'Synapse', 'Teammachine', 'Other'],
      'type': ['Racing', 'Touring'],
      'condition': ['New', 'Used'],
    },
    'Electric Bikes': {
      'brand': ['Trek', 'Specialized', 'Giant', 'Cannondale', 'Other'],
      'model': ['Powerfly', 'Levo', 'Quick-E', 'Habit Neo', 'Other'],
      'condition': ['New', 'Used'],
    },
    'TVs': {
      'brand': ['Samsung', 'Sony', 'LG', 'Panasonic', 'Other'],
      'screenSize': ['32 inch', '40 inch', '50 inch', '65 inch', 'Other'],
      'resolution': ['720p', '1080p', '4K', '8K'],
      'condition': ['New', 'Used'],
    },
    'Cameras': {
      'brand': ['Canon', 'Nikon', 'Sony', 'Fujifilm', 'Other'],
      'model': ['EOS', 'D3500', 'Alpha', 'X-T3', 'Other'],
      'type': ['DSLR', 'Mirrorless', 'Other'],
      'condition': ['New', 'Used'],
    },
    'Gaming Consoles': {
      'brand': ['Sony', 'Microsoft', 'Nintendo', 'Other'],
      'model': ['PlayStation 5', 'Xbox Series X', 'Switch', 'Other'],
      'storage': ['500GB', '1TB', 'Other'],
      'condition': ['New', 'Used'],
    },
    'Sofas': {
      'brand': ['Ikea', 'Ashley', 'Home Center', 'Other'],
      'material': ['Leather', 'Fabric', 'Wood', 'Other'],
      'condition': ['New', 'Used'],
    },
    'Beds': {
      'brand': ['Ikea', 'Ashley', 'Home Center', 'Other'],
      'material': ['Wood', 'Metal', 'Other'],
      'size': ['Single', 'Queen', 'King'],
      'condition': ['New', 'Used'],
    },
    'Books': {
      'condition': ['New', 'Used'],
    },
    'Makeup': {
      'brand': ['MAC', 'Maybelline', 'Sephora', 'Other'],
      'type': ['Foundation', 'Lipstick', 'Blush', 'Other'],
      'shade': ['Light', 'Medium', 'Dark'],
      'condition': ['New', 'Used'],
    },
    'Skincare': {
      'brand': ['Neutrogena', 'CeraVe', 'Clinique', 'Other'],
      'type': ['Moisturizer', 'Cleanser', 'Sunscreen', 'Other'],
      'skinType': ['Oily', 'Dry', 'Combination', 'Normal'],
      'condition': ['New', 'Used'],
    },
    'Haircare': {
      'brand': ['L\'Oreal', 'Pantene', 'Dove', 'Other'],
      'type': ['Shampoo', 'Conditioner', 'Hair Oil', 'Other'],
      'hairType': ['Curly', 'Straight', 'Wavy'],
      'condition': ['New', 'Used'],
    },
    'Fragrances': {
      'brand': ['Chanel', 'Dior', 'Gucci', 'Other'],
      'scent': ['Floral', 'Woody', 'Fresh', 'Other'],
      'condition': ['New', 'Used'],
    },
    'Nail Care': {
      'brand': ['OPI', 'Essie', 'Sally Hansen', 'Other'],
      'shade': ['Red', 'Pink', 'Nude', 'Other'],
      'condition': ['New', 'Used'],
    },
  };

  static final mapKey = Platform.isIOS
      ? 'AIzaSyBgQzk8FxKbNEsNxrT25MGuzUZWE65_byI'
      : 'AIzaSyAjlwPMl_w8T4ogMubk24r5cBrtcueMyS8';
}
