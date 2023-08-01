import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/new_post_page/bloc/new_post_page_bloc.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../data/dto/new_post_dto/new_post_dto.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  NewPostDTO newPostDTO = NewPostDTO();
  late NewPostPageBloc newPostPageBloc;

  @override
  void initState() {
    newPostPageBloc = BlocProvider.of<NewPostPageBloc>(context);
    newPostPageBloc.add(NewPostPageInitialFetchEvent());
    super.initState();
  }

  String? selectedCategoryItem = 'Vegetables';
  String? selectedSubCategoryItem = 'Upcountry';
  String? selectedUnitItemMinimumOrder = 'kg';
  String? selectedUnitItemPrice = 'kg';

  File? imageFile;

  TextEditingController productNameController = TextEditingController();
  TextEditingController minimumOrderQtyController = TextEditingController();
  TextEditingController minimumPriceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<DropdownMenuItem<String>> get dropDownListItemsCategory {
    List<DropdownMenuItem<String>> categoryList = [
      const DropdownMenuItem(value: 'Vegetables', child: Text('Vegetables')),
      const DropdownMenuItem(value: 'Fruits', child: Text('Fruits')),
      const DropdownMenuItem(value: 'Flower', child: Text('Flower')),
    ];
    return categoryList;
  }

  List<DropdownMenuItem<String>> get dropDownListItemsSubCategory {
    List<DropdownMenuItem<String>> categoryList = [
      const DropdownMenuItem(value: 'Upcountry', child: Text('Upcountry')),
      const DropdownMenuItem(value: 'Downcountry', child: Text('Downcountry')),
    ];
    return categoryList;
  }

  List<DropdownMenuItem<String>> get dropDownListItemsUnit {
    List<DropdownMenuItem<String>> categoryList = [
      // const DropdownMenuItem(value: '0', child: Text('g (grams)')),
      const DropdownMenuItem(value: 'kg', child: Text('kg (Kilograms)')),
      // const DropdownMenuItem(value: '2', child: Text('Pack')),
      // const DropdownMenuItem(value: '3', child: Text('Bucket')),
    ];
    return categoryList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewPostPageBloc, NewPostPageState>(
      bloc: newPostPageBloc,
      listenWhen: (previous, current) => current is NewPostPageActionState,
      buildWhen: (previous, current) => current is! NewPostPageActionState,
      listener: (context, state) {
        if (state is NewPostPageDataSavedSucessActionState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('New Post is added. Data saved successfully.')));
        } else if (state is NewPostPageDataSavedErrorActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content:
                  Text('Error occured!, Data is not saved successfullu!')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case NewPostPageLoadingSucessState:
            return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  title: const Text(
                    'New Post',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16, left: 5),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://th.bing.com/th/id/OIP.RL7XzQfWqZEpUako3s38cwAAAA?pid=ImgDet&rs=1'),
                        radius: 20,
                      ),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Stack(children: [
                          Container(
                            width: double.maxFinite,
                            height: 220,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                image: imageFile == null
                                    ? const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/noimage.png'),
                                        fit: BoxFit.cover)
                                    : DecorationImage(
                                        image: FileImage(imageFile!),
                                        fit: BoxFit.cover)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: IconButton(
                                        onPressed: () {
                                          getImageFile();
                                          newPostDTO.imageFile = imageFile;
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ))),
                              ),
                            ],
                          ),
                        ]),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Basic Info',
                                style: TextStyle(
                                    color: Color.fromRGBO(151, 151, 151, 1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                            Text(
                                DateFormat('dd MMMM yyyy')
                                    .format(DateTime.now()),
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          width: 390,
                          height: 1200,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 0,
                                offset: Offset(0, 4),
                                blurRadius: 2,
                                color: Colors.grey,
                              )
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Text('Product Name',
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                maxLength: 20,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Product Name is required!!!';
                                  }
                                  return null;
                                },
                                controller: productNameController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    hintText: 'Egg Plant (Korean)',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Text('Category',
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 60,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                child: DropdownButton(
                                  style: const TextStyle(color: Colors.grey),
                                  underline: Container(),
                                  isExpanded: true,
                                  items: dropDownListItemsCategory,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCategoryItem = value;
                                    });
                                    newPostDTO.postCategory = value;
                                  },
                                  value: selectedCategoryItem,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Text('Sub Category',
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 60,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                child: DropdownButton(
                                  style: const TextStyle(color: Colors.grey),
                                  underline: Container(),
                                  isExpanded: true,
                                  items: dropDownListItemsSubCategory,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedSubCategoryItem = value;
                                    });
                                    newPostDTO.postSubCategory = value;
                                  },
                                  value: selectedSubCategoryItem,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Text('Minimum Order',
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 60,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                child: DropdownButton(
                                  style: const TextStyle(color: Colors.grey),
                                  underline: Container(),
                                  isExpanded: true,
                                  items: dropDownListItemsUnit,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedUnitItemMinimumOrder = value;
                                    });
                                    newPostDTO.unit = value;
                                  },
                                  value: selectedUnitItemMinimumOrder,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Minimum Order is required!!!';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                controller: minimumOrderQtyController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    hintText: 'Ex: 45',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Text('Price',
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 60,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                child: DropdownButton(
                                  style: const TextStyle(color: Colors.grey),
                                  underline: Container(),
                                  isExpanded: true,
                                  items: dropDownListItemsUnit,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedUnitItemPrice = value;
                                    });
                                  },
                                  value: selectedUnitItemPrice,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Minimum Price is required!!!';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                controller: minimumPriceController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    hintText: 'Ex: Rs. 120.00',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Text('Pickup Location',
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: addressController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    hintText:
                                        '(Address) 165/42b, main Road, Galle.',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: districtController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    hintText: 'District',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: provinceController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    hintText: 'Province',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Text('Description',
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(width: 5)
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 144,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                child: TextField(
                                  controller: descriptionController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                ),
                              ),
                              // const SizedBox(height: 20),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     const Row(
                              //       children: [
                              //         Text('Related Tags',
                              //             style: TextStyle(color: Colors.grey)),
                              //         SizedBox(width: 5),
                              //         Icon(Icons.error, color: Colors.red),
                              //       ],
                              //     ),
                              //     IconButton(
                              //         onPressed: () {},
                              //         icon: const Icon(
                              //           Icons.add,
                              //           color: Colors.grey,
                              //         ))
                              //   ],
                              // ),
                              // const SizedBox(height: 10),
                              // Container(
                              //   height: 144,
                              //   padding: const EdgeInsets.all(20),
                              //   decoration: BoxDecoration(
                              //       borderRadius: const BorderRadius.all(
                              //           Radius.circular(15)),
                              //       border: Border.all(
                              //           color: Colors.grey, width: 1)),
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      (MediaQuery.of(context).size.width - 50) /
                                          2,
                                      67),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.greenAccent,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)))),
                              onPressed: () {
                                addValuesToDTOObj();

                                newPostPageBloc.add(
                                    NewPostPageCreateNewPostButtonClickedEvent(
                                        newPostDTO: newPostDTO));
                              },
                              child: const Center(
                                child: Text('Post',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      (MediaQuery.of(context).size.width - 50) /
                                          2,
                                      67),
                                  foregroundColor: Colors.greenAccent,
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)))),
                              onPressed: () {
                                clearData();
                                newPostPageBloc
                                    .add(NewPostPageCancelButtonClickedEvent());
                              },
                              child: const Center(
                                child: Text('Cancel',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: const BottomAppBar(
                  height: 40,
                ));
          default:
            return const SizedBox();
        }
      },
    );
  }

  Future<void> getImageFile() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  void addValuesToDTOObj() {
    newPostDTO.postName = productNameController.text;
    newPostDTO.minimumOrderQty = double.parse(minimumOrderQtyController.text);
    newPostDTO.minimumOrderPrice = double.parse(minimumPriceController.text);
    newPostDTO.pickupLocation = addressController.text;
    newPostDTO.district = districtController.text;
    newPostDTO.province = provinceController.text;
    newPostDTO.postDescription = descriptionController.text;
    newPostDTO.imageFile = imageFile;
    newPostDTO.postedDate = DateTime.now();
    newPostDTO.sellerId = '100';
  }

  void clearData() {
    productNameController.clear();
    provinceController.clear();
    districtController.clear();
    minimumOrderQtyController.clear();
    minimumPriceController.clear();
    descriptionController.clear();
    addressController.clear();
    selectedCategoryItem = 'Vegetables';
    selectedSubCategoryItem = 'Upcountry';
    selectedUnitItemMinimumOrder = 'kg';
    selectedUnitItemPrice = 'kg';
    imageFile = null;
  }
}
