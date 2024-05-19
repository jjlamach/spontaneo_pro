import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spontaneo_pro/colors.dart';
import 'package:spontaneo_pro/models/categories.dart';
import 'package:spontaneo_pro/strings.dart';

class SelectYourInterestsPage extends StatefulWidget {
  const SelectYourInterestsPage({super.key});

  @override
  State<SelectYourInterestsPage> createState() =>
      _SelectYourInterestsPageState();
}

class _SelectYourInterestsPageState extends State<SelectYourInterestsPage> {
  final Map<String, Set<String>> _selectedInterests = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: const Text(
          Strings.chooseYourInterests,
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Strings.chooseCategories,
                style: TextStyle(
                  color: AppColor.wordGrey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                Strings.youCanChangeThem,
                style: TextStyle(
                  color: AppColor.wordGrey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, categoryIndex) {
                  final category = items[categoryIndex]; // title category
                  _selectedInterests.putIfAbsent(category.title, () => {});

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: AppColor.purple,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: List.generate(
                            category.categories.length,
                            (subCategoryIndex) {
                              final subCategory =
                                  category.categories[subCategoryIndex];
                              return ChoiceChip(
                                showCheckmark: false,
                                side: const BorderSide(color: AppColor.grey),
                                selectedColor: AppColor.purple,
                                padding: const EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0),
                                ),
                                label: Text(
                                  subCategory,
                                  style: TextStyle(
                                    color: _selectedInterests[category.title]!
                                            .contains(subCategory)
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                selected: _selectedInterests[category.title]!
                                    .contains(subCategory),
                                onSelected: (isSelected) {
                                  setState(() {
                                    if (isSelected) {
                                      _selectedInterests[category.title]!
                                          .add(subCategory);
                                    } else {
                                      _selectedInterests[category.title]!
                                          .remove(subCategory);
                                    }
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(
                    color: AppColor.purple,
                  ),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30.0,
                  ),
                  child: Text(
                    Strings.next,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
