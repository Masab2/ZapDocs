import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/ViewModel/HistoryViewModel/history_viewModel.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (context, provider, _) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                height: context.mh * 0.05,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: provider.searchController,
                  onChanged: provider.onSearch,
                  decoration: InputDecoration(
                    hintText: "Search in history...",
                    hintStyle: TextStyle(
                      color: AppColor.secondaryText.withOpacity(0.7),
                      fontSize: context.mh * 0.016,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColor.mediumPurple,
                      size: 20,
                    ),
                    border: InputBorder.none,
                    contentPadding:
                         EdgeInsets.symmetric(vertical: context.mh * 0.012),
                  ),
                ),
              ),

              // Filter Chips
              Container(
                height: context.mh * 0.05,
                margin: const EdgeInsets.only(top: 12),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.filterOptions.length,
                  itemBuilder: (context, index) {
                    final option = provider.filterOptions[index];
                    final isSelected = option == provider.selectedFilter;

                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: ChoiceChip(
                        label: Text(
                          option,
                          style: TextStyle(
                            fontSize: context.mh * 0.015,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                            color: isSelected
                                ? Colors.white
                                : AppColor.secondaryText,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: AppColor.mediumPurple,
                        backgroundColor: Colors.white,
                        onSelected: (_) => provider.setFilter(option),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 2,
                        shadowColor: Colors.black.withOpacity(0.04),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
